<!-- # DS-GA 1003: Machine Learning and Computational Statistics -->

## Notable Changes from [2016](https://davidrosenberg.github.io/ml2016/#home) to [2017](https://davidrosenberg.github.io/ml2017/#home)
- Added slides on explicit feature vector for 1-dim RBF kernel
- Created notebook to regenerate the buggy lasso/elasticnet plots from Hastie's book (Vlad)
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

## Citation Information
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Machine Learning Course Materials</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Various Authors</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.  The author of each document in this repository is considered the license holder for that document.
