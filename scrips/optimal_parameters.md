## Parameter settings for the best performance of each prediction model

- LR: 

  - intercept=TRUE (intercept) 

- PLS:   
  - ncomp=3 (#Components)

- PLR: 
  - alpha=0.1 (L2 Penalty)
  - lambda=0.07558164 (Complexity Parameter)


- CART:   
  - cp=0.04064864 (Complexity Parameter)

- KNN:    
  - k=5 (#Neighbors)

- RF:
  - mtry=9 (#Randomly Selected Predictors)
  - splitrule="extratrees" (Splitting Rule)
  - min.node.size=5 (Minimal Node Size)
  - num.trees=100 (#Trees)

- SGB:   
  - n.trees=150 (# Boosting Iterations) 
  - interaction.depth=3 (Max Tree Depth)
  - shrinkage=0.1 (Shrinkage) 
  - n.minobsinnode=10 (Min. Terminal Node Size)
 
- XGBOOST:
  - nrounds=150 (#Boosting Iterations)
  - lambda=0.1 (L2 Regularization)
  - alpha=0.0001 (L1 Regularization)
  - eta=0.3 (Learning Rate)
