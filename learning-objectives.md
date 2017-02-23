# Learning Objectives

**Issue:** "The students come to believe that their primary responsibility is not
so much to learn as to guess what their instructors want them to
know." (Teaching and Learning STEM: A practical guide)

**Solution:** Just tell the students directly what we want them to know.

By the end of each lecture/homework, you should be able to do the
following:

## Lecture 1 (1/24/2017)
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

### 1c: Gradient and Stochastic Gradient Descent 
- Be able to write the empirical risk for a particular loss function over a
  particular parameterized hypothesis space, such as for square loss over a
  hypothesis space of linear functions.
- Explain possible stopping conditions for gradient descent (using validation error and norm of gradient)

## Recitation 1 (1/25/2017)

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
### 2a: Excess Risk Decomposition
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

### 2b: L1 and L2 Regularization
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

## Lecture 3 (2/7/2017)
### 3a: Lasso, Ridge, and Elastic Net
- Explain what happens when we do linear, lasso, and ridge regression with 2 identical features.
- If features x1 and x2 are linearly related (e.g. x2 = 2 x1), then there are infinitely many ways to express the same function of x1 and x2.  Give the relation between the corresponding parameters for the set of equivalent prediction functions.
- 

