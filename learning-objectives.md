
# Learning Objectives

**Issue:** "The students come to believe that their primary responsibility is not
so much to learn as to guess what their instructors want them to
know." (Teaching and Learning STEM: A practical guide)

**Solution:** Just tell the students directly what we want them to know.

By the end of each lecture/homework, you should be able to do the
following:


## Big Picture Objectives
- SGD for subgradient
- Lagrangian
- number of nonzero coefficients in lasso
- scale of features and l1/l2 regularization
- svm sparsity & lasso sparsity
- write down the objective functions
- outliers vs loss
- geometric of SVM
- lagrangian duality --
- reworking objective functions
- coordinate descent : what was special about the coordinate descent for Lasso.


## Lecture 1 (1/20/2018)
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

## Recitation 1 (1/21/2018)

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


## Lecture 2 (1/31/2017)
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

## Lecture 3 (2/6/2018)
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

## Lecture 4 (2/13/2018)

### Lecture 4a (Continuing 3c): Subgradient Descent
- Explain motivation for our exploration of subgradient descent (i.e. thinking about "gradient" of SVM objective)
- Understand where everything lives (i.e. for a function f:R^D to R, the subdifferentials are sets of vectors in R^d; subgradients are vecctors in R^d, level sets are in R^d, underestimating hyperpplanes/graph of function in R^(d+1), etc)
- For a subgradient g, explain that -g may not be a descent direction, but it for small enough step size it will take us closer to minimizer -- be able to explain the two proofs from class.

### Lecture 4b: SVM -- consequences of lagrangian duality
- Be able to identify characterize support vectors given margins.
- Compare and contrast the "sparsity in input examples" that we might observe from SVM with the sparsity we've discussed around, for example, Lasso.

### Lecture 4c: Representer Theorem:
- Explain Lasso isn't an instance of the "generalized objective" defined on slides 14-16
- Explain the significance of the representer theorem -- given an objective function that is an instance of the "generalized objective", what do we know about the set of minimizers?

### Lecture 4d: Lagrangian Duality and Convex Optimization (optional)
- Define a convex set,  a convex function, and a strictly convex function. (Don't forget that the domain of a convex function must be a convex set!)
- For an optimization problem, define the terms feasible set, feasible point, active constraint, optimal value, and optimal point.
- Give the form for a general inequality-constrained optimization problem (there are many ways to do this, but our convention is to have inequality constraints of the form fᵢ(x)≤0).
- Define the Lagrangian for this optimization problem, and explain how the Lagrangian encodes all the information in the original optimization problem.
- Write the primal and dual optimization problem in terms of the Lagrangian.
