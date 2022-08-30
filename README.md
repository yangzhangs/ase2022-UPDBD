# Understanding and Predicting Docker Build Duration: An Empirical Study of Containerized Workflow of OSS Projects

Artifact package for the ASE'22 paper "Understanding and Predicting Docker Build Duration: An Empirical Study of Containerized Workflow of OSS Projects". This reproducible repository includes our data, scripts, and survey questions.

## Abstract of the Paper
Docker building is a critical component of containerized workflow, which automates the process by which sources are packaged and transformed into container images. If not run properly, Docker builds can bring long durations (i.e., slow builds), which increases the cost in human and computing resources, and thus inevitably affect the software development. However, the current status and remedy for the duration cost in Docker builds remain unclear and need an in-depth study. To fill this gap, this paper provides the first empirical investigation on 171,439 Docker builds from 5,833 open source software (OSS) projects. Starting with an exploratory study, the Docker build durations can be characterized in real-world projects, and the developers’ perceptions of slow builds are obtained via a comprehensive survey. Driven by the results of our exploratory study, we propose a prediction modeling of Docker build duration, leveraging 27 handcrafted features from build-related context and
configuration and 8 regression algorithms for the prediction task. Our results demonstrate that Random Forest provides the superior performance with a Spearman’s correlation of 0.781, outperforming the baseline random model by 82.9% in RMSE, 90.6% in MAE, and 94.4% in MAPE, respectively. The implications of this study will
facilitate research and assist practitioners in improving the Docker build process.


## Citation
The preprint is available [here]().

BibTeX
```
@inproceedings{WuASE22,
author={Wu, Yiwen and Zhang, Yang and Wu, Kele and Wang, Tao and Wang, Huaimin},
title={Understanding and Predicting Docker Build Duration: An Empirical Study of Containerized Workflow of OSS Projects},
booktitle={Proceedings of the 37th IEEE/ACM International Conference on Automated Software Engineering (ASE)},
year={2022},
organization={ACM}
}
```


## Data

- Data for prediction models
  -   We start with the dataset proposed by Lin et al. [link](https://github.com/linncy/icsme2020-docker-study)
  -   The data for prediction models can be found in *models_data_cv.csv*
  -   This data includes 171,439 builds with 27 features

- Other data: builds, commits, and dockerfiles from 5,833 projects.
  - 171,439 builds in *builds.rar* 
  - 551,838 commits in *commits.part1.rar* and *commits.part2.rar*
  - 65,026 dockerfiles in *dockerfiles.rar*


## Scripts
We implement the prediction models using R with the [caret](http://topepo.github.io/caret/index.html) package.

- Implementation details of prediction models: see *prediction_models.md*

- Scripts for prediction modeling: see *scripts_for_modelling.R*

- Optimal parameters settings of prediction models: see *optimal_parameters.md* 

- Methods used in our feature analysis
  - VARCLUS clustering analysis (*varclus* in *Hmisc* package)
  - Redundancy analysis (*redun* in *rms* package)
  - Permutation importance (*varImp* in *caret* package)

- Statistical hypothesis tests used in our quantitative analysis
  - Wilcoxon signedrank test
  - Cliff's delta
  - ScottKnott ESD test
  - Kruskal-Wallis test
 
## Survey questions

- Our survey questions can be found in *survey_questions.md*
