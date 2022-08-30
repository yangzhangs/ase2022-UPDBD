library(caret)
library(randomForest)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(doParallel)
library(Metrics)

M<-read.csv('models_data_cv.csv',header=TRUE,sep=",")
M$language<-as.factor(M$language)
M$owner_type<-as.factor(M$owner_type)
M$ignorefile_tag<-as.factor(M$ignorefile_tag)
M$df_change_pos<-as.factor(M$df_change_pos)
M$day_or_night<-as.factor(M$day_or_night)
M$day_of_week<-as.factor(M$day_of_week)
M$first_build_tag<-as.factor(M$first_build_tag)
M$multistage_tag<-as.factor(M$multistage_tag)
M$base_image<-as.factor(M$base_image)
M$maintainer_tag<-as.factor(M$maintainer_tag)
M$url_tag<-as.factor(M$url_tag)
M$version_tag<-as.factor(M$version_tag)
mdrrClass=M$build_duration
mdrrDescr=M[,-c(1,2)] 
str(mdrrClass)
str(mdrrDescr)
newdata<-subset(mdrrDescr,select=-c(files))
Process=preProcess(newdata,method = c("center", "scale")) 
newdata_cv=predict(Process,newdata)
str(newdata_cv)

trainx=newdata_cv
trainy=mdrrClass

num_trainx<-as.data.frame(lapply(trainx,as.numeric))
str(num_trainx)

model_summary <- function(data,lev=NULL,model=NULL) {
  c(Spearman=cor.test(data$obs,data$pred,method="spearman")$estimate,
    RMSE=Metrics::rmse(data$obs, data$pred),
    MAE=Metrics::mae(data$obs, data$pred),
  )
}
fitControl=trainControl(method="repeatedcv",number=10,repeats=1,returnResamp="final",summaryFunction = model_summary)

set.seed(123)
cl <- makePSOCKcluster(5)
registerDoParallel(cl)

set.seed(123) 
LR_benchmark=train(trainx,trainy,method="lm",trControl=fitControl)
print(LR_benchmark$resample)
print(LR_benchmark)

set.seed(123)
PLS_benchmark=train(trainx,trainy,method="pls",trControl=fitControl)
print(PLS_benchmark$resample)
print(PLS_benchmark)

set.seed(123)
PLR_benchmark=train(num_trainx,trainy,method="plr",trControl=fitControl)
print(PLR_benchmark$resample)
print(PLR_benchmark)

set.seed(123)
CART_benchmark=train(trainx,trainy,method="rpart",trControl=fitControl)
print(CART_benchmark$resample)
print(CART_benchmark)

set.seed(123)
KNN_benchmark=train(num_trainx,trainy,method="knn",trControl=fitControl)
print(KNN_benchmark$resample)
print(KNN_benchmark)

set.seed(123)
tgrid<-expand.grid(
  .mtry = 2:9,
  .splitrule = "extratrees",
  .min.node.size = 5
)
set.seed(123)
Rf_benchmark=train(num_trainx,trainy,method="ranger",trControl=fitControl,num.trees=100,tuneGrid = tgrid)
print(Rf_benchmark$resample)
print(Rf_benchmark)

set.seed(123)
SGB_benchmark=train(trainx,trainy,method="gbm",trControl=fitControl)
print(SGB_benchmark$resample)
print(SGB_benchmark)

set.seed(123)
XGBOOST_benchmark=train(num_trainx,trainy,method="xgbLinear",trControl=fitControl)
print(XGBOOST_benchmark$resample)
print(XGBOOST_benchmark)

data<-M$build_duration
set.seed(123)
folds<-createFolds(data,k=10)
Random_result<-matrix(data=NA,nrow=10,ncol=6,
               dimnames = list(c(1,2,3,4,5,6,7,8,9,10),c('spearman','RMSE','MAE')))

for (i in 1:10) {
  print(i)
  tmp<-folds
  obs<-data[tmp[[i]]]
  tmp[[i]]<-NULL
  traintmp<-c()
  for (j in 1:9) {
    for (k in data[tmp[[j]]]) {
      traintmp<-c(traintmp,k)
    }
  }
  meantmp<-mean(traintmp)
  sdtmp<-sd(traintmp)
  min<-meantmp-sdtmp
  max<-meantmp+sdtmp
  pred<-c()
  for (o in 1:length(obs)) {
    pred<-c(pred,runif(1,min,max))
  }
  Random_result[i,]<-model_summary(obs,pred)
}

Random_summary(result)



