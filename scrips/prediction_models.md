## Prediction models 

- **Linear Regression (LR)**: 
  - It is a linear approach for modeling the relationship between one dependent variable and one or more independent variable. It is a very simple algorithm that can be implemented very easily. 
  - Use *lm* model in caret
  
- **Partial Least Squares (PLS)**: 
  - This regression is a statistical method that bears some relation to principal components regression; instead of finding hyperplanes of maximum variance between the response and independent variables, it 
    finds a linear regression model by projecting the predicted variables and the observable variables to a new space.
  - Use *pls* model in caret

- **Penalized Linear Regression (PLR)**: 
  - It allows to create a linear regression model that is penalized, for having too many variables in the model, by adding a constraint in the equation.
  - Use *glmnet* model in caret

- **Classification and Regression Trees (CART)**: 
  - It is a non-linear algorithm which uses a set of predictor variables to build decision trees that predict the value of a response variable.
  - Use *rpart* model in caret

- **K-Nearest Neighbors (KNN)**: 
  - It is a non-parametric supervised learning method. In regression tasks, the input consists of the k closest training examples in a data set, the output is the average of the values of k nearest neighbors.
  - Use *knn* model in caret
  
- **Random Forests (FR)**: 
  - It is an ensemble learning method for tasks that operates by constructing a multitude of decision trees at training time. For regression tasks, the mean or average prediction of the individual trees is returned. 
  - Use *ranger* model in caret
  
- **Stochastic Gradient Boosting (SGB)**: 
  - It is a type of ensemble algorithm where the subsequent predictors are based on the results of previous predictors, and bagging where the predictors are fitted using random subsets of the original training data for each model.
  - Use *gbm* model in caret
  
- **Extreme Gradient Boost (XGBOOST)**: 
  - It is a decision tree-based ensemble algorithm that uses a gradient boosting framework, which turns weak learning models into strong learner. 
  - Use *xgbLinear* model in caret
