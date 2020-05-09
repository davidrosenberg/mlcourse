<!-- # DS-GA 1003: Machine Learning and Computational Statistics -->
<!-- - New figures illustrating regularization paths in space of all functions.-->

## Notable Changes from [2017FOML](https://bloomberg.github.io/foml/#home) to [2018](https://davidrosenberg.github.io/ml2018/#home)
- Elaborated on the [case against sparsity](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/03a.elastic-net.pdf#page=18) in the lecture on elastic net, to complement the reasons *for* sparsity on the slide [Lasso Gives Feature Sparsity: So What?](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/02c.L1L2-regularization.pdf).
- Added a [note on conditional expectations](https://davidrosenberg.github.io/mlcourse/Notes/conditional-expectations.pdf), since many students find the notation confusing.
- Added a [note on the correlated features theorem for elastic net](https://davidrosenberg.github.io/mlcourse/Notes/elastic-net-theorem.pdf), which was basically a translation of Zou and Hastie's 2005 paper "Regularization and variable
selection via the elastic net." into the notation of our class, dropping an unnecessary centering condition, and using a more standard definition of correlation.
- Changes to EM Algorithm presentation: Added [several diagrams](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/13c.EM-algorithm.pdf#page=10) (slides 10-14) to give the general idea of a variational method, and made explicit that the marginal log-likelihood is exactly the pointwise supremum over the variational lower bounds [(slides 31 and 32)](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/13c.EM-algorithm.pdf#page=31)).
- Treatment of [the representer theorem](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/04c.representer-theorem.pdf) is now well before any mention of kernels, and is described as an interesting consequence of basic linear algebra:  "Look how the solution always lies in the subspace spanned by the data.  That's interesting (and obvious with enough practice). We can now constrain our optimization problem to this subspace..."
- The [kernel methods](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/05a.kernel-methods.pdf) lecture was rewritten to significantly reduce references to the feature map.  When we're just talking about kernelization, it seems like unneeded extra notation. 
- Replaced the [1-hour crash course in Lagrangian duality](https://davidrosenberg.github.io/mlcourse/Archive/2017/Lectures/4a.convex-optimization.pdf) with a [10-minute summary of Lagrangian duality](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/04d.lagrangian-duality-in-ten-minutes.pdf), which I actually never presented and left as optional reading.
- Added a [brief note on Thompson sampling for Bernoulli Bandits](https://davidrosenberg.github.io/mlcourse/in-prep/thompson-sampling-bernoulli.pdf) as a fun application for our [unit on Bayesian statistics](https://davidrosenberg.github.io/mlcourse/Archive/2018/Lectures/08a.bayesian-methods.pdf).
- Significant improvement of the programming problem for lasso regression in [Homework #2](https://davidrosenberg.github.io/mlcourse/Homework/hw2.pdf).
- New written and programming problems on logistic regression in [Homework #5](https://davidrosenberg.github.io/mlcourse/Homework/hw5.pdf) (showing the equivalence of the ERM and the conditional probability model formulations, as well as implementing regularized logistic regression).
- New homework on backpropagation [Homework #7](https://davidrosenberg.github.io/mlcourse/Homework/hw7.pdf) (with Philipp Meerkamp and Pierre Garapon).

## Notable Changes from [2017](https://davidrosenberg.github.io/ml2017/#home) to [2017FOML](https://bloomberg.github.io/foml/#home)
- This version of the course didn't have any ML prerequisites, so added a couple lectures on the basics:
    - Added lecture on [Black Box ML](https://davidrosenberg.github.io/mlcourse/Archive/2017Fall/Lectures/01.black-box-ML.pdf).
    - Added lecture on standard methods of [evaluating classifier performance](https://davidrosenberg.github.io/mlcourse/Archive/2017Fall/Lectures/06b.classifier-performance.pdf).
- Added a note on the [main takeaways from duality for the SVM](https://davidrosenberg.github.io/mlcourse/Notes/SVM-main-points.pdf). 
- Rather than go through the [full derivation of the SVM dual](https://davidrosenberg.github.io/mlcourse/Archive/2017/Lectures/4b.SVM.pdf), in [the new lecture](https://davidrosenberg.github.io/mlcourse/Lectures/04b.SVM-summary.pdf), I just state the dual formulation and highlight the insights we get from the complementary slackness conditions, with an emphasis on the "sparsity in the data". 
- Dropped the [geometric derivation of SVMs](https://davidrosenberg.github.io/mlcourse/Archive/2017/Labs/3-SVM-Slides.pdf) and all mention of hard-margin SVM. It was always a crowd-pleaser, but I don't think it's worth the time. Seemed most useful as a review of affine spaces, projections, and other basic linear algebra.
- Dropped most of [the AdaBoost lecture](https://davidrosenberg.github.io/mlcourse/Archive/2017/Lectures/9b.adaboost.pdf), except to mention it as a special case of forward stagewise additive modeling with an exponential loss [(slides 24-29)](https://davidrosenberg.github.io/mlcourse/Archive/2017Fall/Lectures/11a.gradient-boosting.pdf#page=23). 
- New [worked example](https://davidrosenberg.github.io/mlcourse/Notes/poisson-gradient-boosting.pdf) for predicting Poisson distributions with linear and gradient boosting models.
- New module on [back propagation](https://davidrosenberg.github.io/mlcourse/Archive/2017Fall/Lectures/14b.backpropagation.pdf).

## Notable Changes from [2016](https://davidrosenberg.github.io/ml2016/#home) to [2017](https://davidrosenberg.github.io/ml2017/#home)
- New lecture on geometric approach to SVMs (Brett)
- New lecture on principal component analysis (Brett)
- Added slide on k-means++ (Brett)
- Added slides on explicit feature vector for 1-dim RBF kernel
- Created notebook to regenerate the buggy lasso/elastic net plots from Hastie's book (Vlad)
- L2 constraint for linear models gives Lipschitz continuity of prediction function (Thanks to Brian Dalessandro for pointing this out to me). 
- Expanded discussion of L1/L2/ElasticNet with correlated random variables (Thanks Brett for the figures)

## Notable Changes from [2015](https://davidrosenberg.github.io/ml2015/#home) to [2016](https://davidrosenberg.github.io/ml2016/#home)
- [New lecture](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/9a.multiclass.pdf) on **multiclass classification** and an intro to **structured prediction**
- [New homework](https://davidrosenberg.github.io/mlcourse/Archive/2016/Homework/hw6-multiclass/hw6.pdf) on **multiclass hinge loss** and **multiclass SVM**
- [New homework](https://davidrosenberg.github.io/mlcourse/Archive/2016/Homework/hw7-bayesian/hw7.pdf) on Bayesian methods, specifically the **beta-binomial model, hierarchical models, empirical Bayes ML-II, MAP-II**
- [New short lecture](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/2.Lab.elastic-net.pdf) on correlated variables with L1, L2, and **Elastic Net** regularization
- Added some details about subgradient methods, including a [one-slide proof](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/4b.subgradient-descent.pdf#page=14) that subgradient descent moves us towards a minimizer of a
  convex function (based on [Boyd's notes](http://stanford.edu/class/ee364b/lectures.html))
- Added some [review notes](https://davidrosenberg.github.io/mlcourse/Archive/2016/Notes/directional-derivative.pdf) on directional derivatives, gradients, and first-order approximations
- Added light discussion of [convergence rates](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/4a.sgd-gd-revisited.pdf#page=12) for SGD vs GD (accidentally left out theorem for SGD)
- For lack of time, dropped the [curse of dimensionality discussion](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/1b.intro-slt-riskdecomp.pdf#page=18), originally based on [Guillaume Obozinski's slides](http://sites.uclouvain.be/socn/pmwiki/uploads/Courses/Obozinski1#page=21)
- [New lecture (from slide 12)](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/5b.kernel-methods.pdf#page=12) on the **Representer Theorem** (without RKHS), and its use for kernelization (based on [Shalev-Shwartz and Ben-David's book](http://www.cs.huji.ac.il/~shais/UnderstandingMachineLearning/index.html))
- Dropped the [kernel machine approach (slide 16)](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/4c.kernels.pdf#page=16) to introducing kernels, which was based on the approach in Kevin Murphy's book 
- Added EM algorithm convergence [theorem (slide 20)](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/14a.EM-algorithm.pdf#page=20) based on [Vaida's result](http://www3.stat.sinica.edu.tw/statistica/oldpdf/a15n316.pdf)	
- [New lecture](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/8.Lab.more-boosting.pdf) giving more details on gradient boosting, including brief mentions of some variants (**stochastic gradient boosting**, **LogitBoost**, **XGBoost**)
- New [worked example](https://github.com/davidrosenberg/mlcourse/blob/gh-pages/Archive/2016/Notes/test-two-review-problems.pdf) for predicting exponential distributions with generalized linear models and gradient boosting models.
- Deconstructed 2015's [lecture on generalized linear models](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/8.Lab.glm.pdf), which started with [natural exponential families (slide 15)](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/8.Lab.glm.pdf#page=15) and built up to a definition of [GLMs (slide 20)](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/8.Lab.glm.pdf#page=20).  Instead, presented the more general notion of [conditional probability models](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/10b.conditional-probability-models.pdf), focused on using MLE and gave multiple examples; relegated formal introduction of exponential families and generalized linear models to the end; 
- Removed equality constraints from [convex optimization lecture](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/3b.convex-optimization.pdf) to
  simplify, but check [here](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/3b.convex-optimization.pdf) if you want them back
- Dropped content on [Bayesian Naive Bayes](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/12.Lab.bayesian-methods.pdf), for lack of time
- Dropped formal discussion of [k-means objective function (slide 9)](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/13.mixture-models.pdf#page=9)
- Dropped the [brief introduction to **information theory**](https://davidrosenberg.github.io/mlcourse/Archive/2015/Lectures/14a.information-theory.pdf). Initially included, since we needed to introduce KL divergence and Gibbs inequality anyway, for the EM algorithm. The mathematical prerequisites are now given [here (slide 15)](https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/13.Lab.EM-algorithm.pdf#page=15).

## Possible Future Topics
### Basic Techniques
- Gaussian processes
- MCMC (or at least Gibbs sampling)
- Importance sampling
- Density ratio estimation (for covariate shift, anomaly detection, conditional probability modeling)
- Local methods (knn, locally weighted regression, etc.)
### Applications
- Collaborative filtering / matrix factorization (building on [this lecture on matrix factorization](https://github.com/davidrosenberg/mlcourse/blob/gh-pages/in-prep/matrix-factorization.pdf) and [Brett's lecture on PCA](https://davidrosenberg.github.io/mlcourse/Archive/2017/Lectures/13-PCA-Slides.pdf))
- Learning to rank and associated concepts
- Bandits / learning from logged data?
- Generalized additive models for interpretable nonlinear fits (smoothing way, basis function way, and gradient boosting way)
- Automated hyperparameter search (with GPs, random, hyperband,...)
- Active learning
- Domain shift / covariate shift adaptation
- Reinforcement learning (minimal path to REINFORCE)
#### Latent Variable Models
- PPCA / Factor Analysis and non-Gaussian generalizations
    - Personality types as example of factor analysis if we can get data?
- Variational Autoencoders 
- Latent Dirichlet Allocation / topic models
- Generative models for images and text (where we care about the human-perceived quality of what's generated rather than the likelihood given to test examples) (GANs and friends)
#### Bayesian Models
- Relevance vector machines
- BART
- Gaussian process regression and conditional probability models
### Technical Points
- Overfitting the validation set?
- Link to paper on [subgradient convergence for tame functions](https://arxiv.org/pdf/1804.07795.pdf)
### Other
- Class imbalance
- Black box feature importance measures (building on [Ben's 2018 lecture](https://davidrosenberg.github.io/mlcourse/Labs/FeatureImportance/feature-importance-slides.ipynb))
- Quantile regression and conditional prediction intervals (perhaps integrated into homework on loss functions); 
- More depth on basic neural networks: weight initialization, vanishing / exploding gradient, possibly batch normalization
- Finish up 'structured prediction' with beam search / Viterbi
    - give probabilistic analogue with MEMM's/CRF's 
- Generative vs discriminative (Jordan & Ng's naive bayes vs logistic regression, plus new experiments including regularization)
- Something about causality?
- [DART](http://proceedings.mlr.press/v38/korlakaivinayak15.pdf)
- LightGBM and [CatBoost](http://learningsys.org/nips17/assets/papers/paper_11.pdf) efficient handling of categorical features (i.e. handling categorical features in regression trees )

<!-- #    - [Metric-Optimized Example Weights](https://arxiv.org/abs/1805.10582) -->

## Citation Information
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Machine Learning Course Materials</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Various Authors</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.  The author of each document in this repository is considered the license holder for that document.
