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
- Explain optimization error, and write down an excess risk
  decomposition that incorporates approximation error, estimation
  error, and optimization error.
