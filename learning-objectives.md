
# Learning Objectives

**Issue:** "The students come to believe that their primary responsibility is not
so much to learn as to guess what their instructors want them to
know." (Teaching and Learning STEM: A practical guide)

**Solution:** Just tell the students directly what we want them to know.

By the end of each lecture/homework, you should be able to do the
following:

## Week 1 (1/20/2018)
### 1b: Basic Setup for Statistical Learning Theory
- Identify the input, action, and outcome spaces for a given machine
  learning problem.
- Provide an example for which the action space and outcome spaces are
  the same and one for which they are different.
- Explain the relationships between the decision function, the loss
  function, the input space, the action space, and the outcome space.
- Define the risk of a decision function and a Bayes decision
  function.
- Provide example decision problems for which the Bayes risk is 0 and
  the Bayes risk is nonzero.
- Know the Bayes decision functions for square loss and multiclass 0/1
  loss.
- Define the empirical risk for a decision function and the empirical risk
  minimizer.
- Explain what a hypothesis space is, and how it can be used with
  constrained empirical risk minimization to control overfitting.

### Multivariate Differentiation
- Define the directional derivative, and use it to find a linear
  approximation to f(x+hu).
- Define partial derivative and the gradient.  Show how to compute
  an arbitrary directional derivative using the gradient.
- For a differentiable function, give a linear approximation near a point x
  the gradient.
- Show that the gradient gives the direction of steepest ascent, and
  the negative gradient gives the direction of steepest descent.

### Computing Gradients
- Find the gradient of a function by computing each partial derivative separately.
- Use the chain rule to perform gradient computations.
- Compute the gradient of a differentiable function by determining the form of a
  general directional derivative.


## Week 2 (1/31/2017)
### 2a: Gradient and Stochastic Gradient Descent
- Be able to write the empirical risk for a particular loss function over a
  particular parameterized hypothesis space, such as for square loss over a
  hypothesis space of linear functions.
- Explain possible stopping conditions for gradient descent (using validation error and norm of gradient)


### 2b: Excess Risk Decomposition
- Give precise definitions for excess risk, approximation error, estimation error,
  and optimization error.
- Suppose we have nested hypothesis spaces, say H₁⊂H₂.
  Explain how we would expect the approximation error and
  estimation error to change when we change from H₁ to H₂, all else fixed.
- Explain how we would expect the approximation error and
  estimation error to change when we increase the sample size, all
  else fixed.
- Explain optimization error, and write down an excess risk decomposition that
  incorporates approximation error, estimation error, and optimization error.
  Why might we have negative optimization error but never negative estimation
  error?

### 2c: L1 and L2 Regularization
- Explain the concept of a sequence of nested hypothesis spaces, and explain how a complexity measure (of a function) can be used to create such a sequence.
- Given a base hypothesis space of decision functions (e.g. affine functions), a performance measure for a decision function (e.g. empirical risk on a training set), and a function complexity measure (e.g. Lipschitz continuity constant of decision function), give the corresponding optimization problem in Tikhonov and Ivanov forms.
- For some situations (i.e. combinations of base hypothesis space, performance measure, and complexity measure), we claimed that Tikhonov and Ivanov forms are equivalent.  Be able to explain what this means and write it down mathematically.
- In particular, the Tikhonov and Ivanov formulations are equivalent for lasso and ridge regression. Be comfortable switching between the formulations to assist with interpretations (e.g. the classic L1 regularization picture with the norm ball is based on the Ivanov formulation).
- Be able to explain what's going on in a regularization path plot, and highlight the key characteristics that differentiate the lasso regularization paths from ridge.
- Explain what we mean when we say that L1 regularization often gives sparse solutions.
- Give reasons why we might want the sparsity that L1 regularization often provides.
- Explain the various pieces of the lasso regularization picture containing the L1 norm ball and level sets of the empirical risk. Explain how you could partition the parameter space into regions that lead to sparsity and regions that don't, and what that even means. (Hint -- pick a point in the parameter space and suppose it is the ERM.  Now suppose we imposed an L1 norm constraint...)
- The penalty form (i.e. Tikhonov form) for the Lasso optimization problem does not have a differentiable objective function.  Give an equivalent formulation that has a differentiable objective function by dividing the weight vector into positive and negative parts. Explain how we could solve this optimization problem with techniques from our class.
- Explain what coordinate descent is, and why it is of particular interest for the Lasso.

## Week 3 (2/6/2018)
### 3a: Lasso, Ridge, and Elastic Net
- Explain what happens when we do linear, lasso, and ridge regression with 2 identical features.
- If features x1 and x2 are linearly related (e.g. x2 = 2 x1), then there are infinitely many ways to express the same function of x1 and x2.  Give the relation between the corresponding parameters for the set of equivalent prediction functions. If x1 and x2 are our only two features, what solutions are selected if have L1 regularization?  L2 regularization?
- Same as previous question, but explain happens when x1 and x2 are highly correlated, but not exactly linearly related. (Be able to explain the picture from lecture slides.)
- In class we discussed an example for which there were two batches of highly correlated features.  We claimed that using L1 regularization to select one feature from each batch would hurt our expected performance.  Explain why.
- Explain how elastic net may help give the best of both worlds: eliminating features that are not helpful, but spreading weight roughly equally among highly correlated useful features.

### 3b: Loss functions for regression and classification
- For regression, "distance-based" losses (i.e. losses that only depend on the residual, and have zero loss for 0 residual) are translation-invariant. Explain what this means.
- Explain why 'relative error' or 'percent error' are not translation-invariant.  How can we reduce these error measures to a translation invariant loss?
- Explain why the L1 loss leads to more "robustness" than L2 loss. (Loosely
  speaking, we can define robustness as how much a single outlier point can
  affect the final prediction function.)'
- What are the relative advantages and disadvantages of L1, L2, and Huber loss that we discussed in class? (There are others we did not discuss.)
- Explain the concepts of the score function and the margin (functional margin, not geometric margin), and define a margin-based loss.
- Define the hinge loss and compare it to the logistic loss.  In particular, explain what we mean by "logistic loss always wants more margin, while hinge loss is satisfied with 1."

## Week 4 (2/13/2018)

### 4a (Continuing 3c): Subgradient Descent
- Explain motivation for our exploration of subgradient descent (i.e. thinking about "gradient" of SVM objective)
- Understand where everything lives (i.e. for a function f:R^D to R, the subdifferentials are sets of vectors in R^d; subgradients are vecctors in R^d, level sets are in R^d, underestimating hyperpplanes/graph of function in R^(d+1), etc)
- For a subgradient g, explain that -g may not be a descent direction, but it for small enough step size it will take us closer to minimizer -- be able to explain the two proofs from class.

### 4b: SVM -- consequences of lagrangian duality
- Be able to identify characterize support vectors given margins.
- Compare and contrast the "sparsity in input examples" that we might observe from SVM with the sparsity we've discussed around, for example, Lasso.

### 4c: Representer Theorem:
- Explain Lasso isn't an instance of the "generalized objective" defined on slides 14-16
- Explain the significance of the representer theorem -- given an objective function that is an instance of the "generalized objective", what do we know about the set of minimizers?

### Lecture 4d: Lagrangian Duality and Convex Optimization (optional)
- Define a convex set,  a convex function, and a strictly convex function. (Don't forget that the domain of a convex function must be a convex set!)
- For an optimization problem, define the terms feasible set, feasible point, active constraint, optimal value, and optimal point.
- Give the form for a general inequality-constrained optimization problem (there are many ways to do this, but our convention is to have inequality constraints of the form fᵢ(x)≤0).
- Define the Lagrangian for this optimization problem, and explain how the Lagrangian encodes all the information in the original optimization problem.
- Write the primal and dual optimization problem in terms of the Lagrangian.

## Week 5 (2/20/2018)

### 5a: Kernel Methods
- Explain how explicit feature maps can be used to extend the expressivity of linear models.
- Explain potential issues explicitly computing large feature spaces.
- State and explain the definition of a 'kernelized' method.
- Explain why the SVM dual is kernelized, while the primal is not (ignoring the representer theorem).
- Give the relationship between a feature map and kernel function.
- Explain the computational benefits of kernelization based on costs of optimizing over R^n vs R^d.
- Be able to apply the kernel trick using the kernel matrix K.
- Be able to apply the elements of our proof of the representer theorem (ex: projections decrease norms) to prove related theorems.
- Compare using the representer theorem and duality to kernelized SVM.
- Describe common kernels (RBF/polynomial) and their properties (i.e. equivalent feature maps, computational benefits relative to explicit computation (if possible),...).
- Describe some general recipes for deriving "new" kernel function.

### 5b: Citysense
- Explain what's new here (specifically defining our action space as probability distributions on y).

### 5c: MLE
- Define the likelihood of an estimate of a probability distribution for some data D.
- Define a parameteric model, and some common parameteric families.
- Define the MLE for some parameter theta of a probability model.
- Be able to find the MLE using first order conditions on the log-likelihood.

## Week 6 (2/27/2018)

### 6a: Conditional Probability Models
- Describe the basic structure of a linear probabilistic model, in terms of (i) a parameter theta of the probablistic model, (ii) a linear score function, (iii) a transfer function (kin to a "response function" or "inverse link" function, though we've relaxed requirements on the parameter theta).
- Explain how we can use MLE to choose w, the weight vector in our linear function (in (ii) above).
- Give common transfer functions for (i) bernoulli, (ii) poisson, (iii) gaussian, and (iv) categorical distributions. Explain why these common transfer functions make sense (in terms of their codomains).
- Explain the equivalence of EMR and MLE for negative log-likelihood loss.


### 6b: Bayesian Methods
- Explain basic setup for point estimation, and desirable properties of point estimators.
- Be able to find MLE for simple problems using log-likelihood.
- Exlain what's new with bayesian statistic (relative to classical/frequentist approaches).
- Be able to unpack the joint distribution on a parameter and data using the prior and likelihood.
- Express and manipulate the posterior distribution using proportionality.
- Define conjugate priors, and why they're useful.
- Give the setup for Bayesian decision theory, and derive bayes action for standard loss functions.


## Week 7 (3/6/2018): Midterm

## Week 8 (3/20/2018)

### 8b: Bayesian Regression
- (Recap) Recall the basic Bayesian setup (likelihood and prior), and be able to write the posterior distribution using proportionality -- (see slide 15 for Gaussian Example).
- Explain the difference between the posterior predictive distribution function and the MAP or posterior mean estimator.
- Be able to show the relationship between Gaussian regression and ridge regression.
- Explain what a predictive distribution is, and how it gives additional information (relative to the prediction functions we've learned in our ridge/lasso homework, for example).

## Week 9 (3/27/2018)

### 9a: Bayesian Regression continued
- See objectives for 8b.

### 9b: Multiclass
- Be able to give pseudocode to fit and apply a one-vs-all/one-vs-rest prediction function.
- Be able to describe an example where one-vs-all fails.
- Be able to explain our reframing of multiclass learning in terms of a compatability score function.
- Be able to define the class-specific margin of a data instance using the compatability score function.
- Be able to map a set of linear score functions onto a single linear class-sensitive score function using a class-sensitive feature map. Give some intuition for the value of this feature map (based on features related to the target classes).
- Be able to state the multiclass SVM objective with 1 as the target margin, and be able to generalize using a class-specific target-margin and explain this generalization using the intuition of this target-margin as a lookup table.

## Week 10 (4/04/2018)

### 10a: Trees

- Be able to describe the structure of a binary tree (ex: put bounds on number of leaves given height; describe the geometry of the resulting prediction function; etc.).
- Give pseudocode for finding the optimal split for (a) a continuous feature, and (b) a categorical feature for a binary classification problem.
- Describe some reasonable strategies for controlling the complexity of a tree.
- In particular, describe the regularization approach used in CART (pruning and use of number of leaves as complexity measure), recognize the cost complexity criterion as our standard regularized ERM.
- Recall the entropy, Gini, and misclassification error splitting criteria. Give some intuition around preference for Gini/entropy (i.e. purity measures) over misclassification.

### 10b: Intro to the Bootstrap

- Recall from basic statics concepts related to an estimator (e.g. bias) and its variance.
- Describe (outside the context of bagging/RFs) how the bootstrap is a useful method for estimating the variance of an estimator, and have some intuition on how it can be applied across many problems.

## Week 11 (4/10/2018)

### 11a: Bagging and RFs
- Give an intuitive explanation for parallel ensembles (in terms of variance reduction), and sequential ensembles (in terms of adding new models that do well where previous models did not).
- Recalling basic statistics, understand why bagging (averaging predictions) reduces variance.
- Recalling that the bootstrap ignores an expected 37% of data in each bootstrap sample, explain how we can use out-of-bag observations to approximate test performance.
- Understand what the out-of-bag observations are and how we can use them to estimate test error.
- Recognize that bagged prediction function is one way to combine many base prediction functions.
- Explain how random feature subsetting in RFs reduces dependence between trees.

### 11b: Gradient Boosting
- Compare learning a linear model on a fixed set of basis functions on the input space, and an "adaptive basis function model" where the basis functions are learned.
- In particular, explain the "recipe" for an adaptive basis function model in terms of the base hypothesis space, and combined hypothesis space.
- Give psuedo-code for forward stagewise additive modeling (FSAM).
- Give the ingredients for gradient boosting machines; in particular, be able to explain why we need a [sub]differentiable loss function w.r.t. the prediction.
- Explain how gradient boosting uses "functional" gradient descent -- i.e. learning the basis function (i.e. function in the base hypothesis space) that is closest to the negative gradient step direction given the current prediction function.
- Explain options for step sizes (line search and shrinkage parameter/learning rate).
- Explain variations on gradient boosting (stochastic gradient boosting, and column subsampling).


## Week 12 (4/17/2018)

### 12a: Neural Networks

- Be able to explain the recipe for a basic neural network (MLP), including common activation functions.
- Be able to explain the intuition that hidden layers are essentially features or basis functions (and can be extracted and used as such in other predition functions).
- Be able to set up ERM objective function and defend that we can use gradient-based methods even though the objective is not convex w.r.t. parameters (i.e. we might still find a sufficiently good solution).
- Be able to state the universal approximation theorem presented in class.
- Be able to give the standard recipe for MLP for multinomial logistic regression.
- Be able to explain how to easily extend MLP for multiple outputs.

### 12b: Back Propagation and the Chain Rule

- Be able to give an intuitive explanation for the partial derivatives of a function mapping from R^p --> R^n.
- Be able to give the chain rule in terms of partial derivatives, and explain in terms of a computation graph.
- Be able to work out partials using a computation graph, and give the partials returns by backwards method of a node.
- Explain the role of topological sort in backprop.


# Week 13 (4/25/2018)

### 13a: K-means
- Be able to give pseudocode for k-means (i.e. an intuitive explanation).
- Understand the importance of standardizing in k-means.
- Be able to give the k-means objective formally.
- Be able to summarize we can say about the k-means solution -- i.e. each iteration the objective does not increase, but we can converge to local optimum.
- Be able to describe k-means++ initialization.

### 13b: Gaussian Mixture Models
- Be able to set up the GMM probelm (multinomial distribution on z, Gaussian x|z).
- Be able to give and factorize the joint density p(x,z) for this problem.
- Be able to give pseudocode for the EM Algorithm for GMM (as in slide 29).
- Be able to state the relationship of EM for GMM to k-means.

### 13c: EM-algorithm:
- Be able to set up problem (in terms of observed Xs, unobserved Zs, and parameter theta).
- Be able to state Jensen's inequality, and define KL divergence (prereqs for ELBO).
- Be able to give EM algorithm pseudocode (as in slide 27).
- Explain how we can compute the two arg maxes needed in this algorithm (i.e. using bound on KL divergence).
- Be able to show that EM gives monotonically increasing likelihood.
- Be able to summarize variations on EM, including generalied EM (address optimization in "M" step), and restriction to a set Q of distributions (addressing optimization in "E" step).


