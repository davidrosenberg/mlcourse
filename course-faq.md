# Frequently Asked Questions and Useful Notes

## In AdaBoost, what happens if a base classifier gets 0 weighted training error?
There is definitely a "gotcha" in the AdaBoost algorithm. What happens if a base
classifier can get 0 weighted error on the training set? Then the recipe for the
weight on that classifier gives infinity, which is no good. The important thing
to notice is that, if a base classifier can get 0 weighted training error, then
the same classifier will also get 0 [unweighted] training error, since the
weights are always greater than zero. Thus if we're ever going to get a 0 for
weighted error, it's going to happen in the first round of boosting. If that happens, you
just stop boosting and your final classifier is the base classifier that did
perfect classification.

## What are reasonable stopping conditions for our minimization procedures?
If the goal is to minimize a differentiable and convex function, we can run
until the norm of our gradient is below some threshold, since we know the
gradient will be zero at a minimum. When we're optimizing a non-differentiable
function (e.g. the lasso or SVM objective function), we have to do something
else. One approach is to periodically check the value of our objective function
at our current location, and compare to the last time we checked. If we're doing
gradient descent or a stochastic descent method, we can check every XX steps. If
we're doing a method like coordinate descent, we could check after every cycle
through the coordinates.

In the machine learning context, our goal is usually to find a decision function
that performs well (say small empirical risk) out-of-sample.  Thus another approach is to stop when the empirical risk on 
validation data stops improving, or gets worse.  This may lead us to stop before the objective function is minimized.  This is called "early stopping", and it may help our
out-of-sample performance (i.e. how well we do on new data). 

That said, our goal in the homework is usually to understand and assess the
performance of the ML methods we discuss. Thus we should try to get as close to
the optimum of our optimization problem as possible, since that is what the
method prescribes. That means evaluating the objective function (which may be a
penalized empirical risk, for example) on the training data.

One approach to deciding when to stop is based on the idea of "patience".   There's a short description at https://davidrosenberg.github.io/mlcourse/Archive/2016/Lectures/14b.neural-networks.pdf#page=20, based on Bengio's "Practical recommendations" paper.  It's really designed for minibatch gradient steps, but could be applied for gradient descent as well.  I think it's overkill for the homework though.  


## Do **not** normalize the gradient in gradient descent
In gradient descent, SGD, and minibatch GD, we do NOT normalize the gradient.
For backtracking line search in GD, it doesn't matter, but for the other
methods, convergence proofs assume we're not normalizing the gradient.
 
The terminology IS confusing, but that's the way it is. Let's review it:
step direction = negative gradient (in GD), or negative estimate of the gradient (in SGD and minibatch GD)
 
Even though it's called a step _direction_, it is NOT normalized to have unit length.
 
Second confusing point: the step _length_ is NOT the length of the step.  it is the multiplier on the step direction.  It WOULD be the length of the step if the step direction had unit length, but it does NOT (in general).
 
If I can find a more consistent terminology that people actually used, I would be happy to switch terminologies to something that made more sense.

## Is the gradient a row vector or a column vector?
This is indeed a confusing issue, since different people adopt different conventions. In this course we consider the gradient to be a column vector. But if you understand the meaning of the objects in question, it doesn't really matter much for this class.

When we talk about the derivative of f:ℝᵈ→ℝ, we're talking about the Jacobian matrix of f, which for a function mapping into ℝ ends up as a matrix with a single row, which is a row vector. The gradient would then be the transpose of the Jacobian matrix, and thus a column vector.

In the course webpage we link to [Barnes's Matrix Differentiation](http://www.atmos.washington.edu/~dennis/MatrixCalculus.pdf) notes as a reference. You'll notice the notes never use the word "gradient". Indeed, everything he writes there is about the derivative (i.e. the Jacobian). This is fine, as the gradient is just going to be the transpose of the relevant Jacobian.

Now an annoying thing: the other document on the website, simply called [C: Matrix Calculus](http://www.colorado.edu/engineering/cas/courses.d/IFEM.d/IFEM.AppC.d/IFEM.AppC.pdf), uses the reverse convention. They define the Jacobian as the transpose of the one we've defined above and which we've found to be the more standard. Once you realize the difference is just a transpose, it's not a big deal. But it can certainly be confusing at first...

Besides
[Brett Bernstein's excellent notes](https://davidrosenberg.github.io/mlcourse/Labs/1-gradients-Notes_sol.pdf),
Michael Orlitzky's also has some
[nice notes](http://michael.orlitzky.com/articles/the_derivative_of_a_quadratic_form.php) on
finding derivatives (note that he mentions gradient as an aside).

So now -- does it matter? Well, to some people, of course it matters. But in this course, we have two primary uses for the gradient:

1. Find the directional derivative in a particular direction. To do this, we only need to take the inner product of the gradient with the direction. If you have a row vector (i.e. the Jacobian) instead of a column vector (the gradient), it's still pretty clear what you're supposed to do. In fact, when you're programming, row and column vectors are often just represented as "vectors" rather than matrices that happen to have only 1 column or 1 row. You then just keep track yourself of whether it's a row or a column vector.

2. Equating the gradient to zero to find the critical points. Again, here it doesn't matter at all if you have a row or column vector (i.e. if you're working with the gradient or the derivative).

## Gradient Checker
What to do if the gradient checker fails?

If your gradient checker fails, either your gradient checker is wrong, or the
gradient calculation is wrong. Either way, there's a bug in the code that you
should fix. So the correct action is that the code should exit. The gradient
check is intended to help you detect a bug in your code. It becomes more
important as the complexity of the gradient code increases (which happens with
more sophisticated models).

For more information about gradient checking, see
the
[UFLDL notes on gradient checking](http://ufldl.stanford.edu/wiki/index.php/Gradient_checking_and_advanced_optimization).

## Vectorization
[//]: # (Original discussion: https://piazza.com/class/ii99b8o57me5jo?cid=24)

An essential tool for writing machine learning tools in high-level
languages such as Python, Matlab, R, etc., is vectorization.  That is,
using built in operations for multiplying matrices, vectors, and
arrays, rather than coding it yourself with loops.  Some people have
found Justin Johnson's [Numpy Tutorial](http://cs231n.github.io/python-numpy-tutorial/)
helpful, but please share additional recommended resources.

## Partial Credit and Concept Mastery
[//]: # (Original discussion: https://piazza.com/class?cid=ioafvb6pm2h7dz&nid=ii99b8o57me5jo&token=UBVy4GpzZ0f)

I receive a lot of questions and comments related to partial credit on
tests.  Specifically, that we don't award enough of it.  This is
what's going on:

There are many small, individual concepts in the course.  Part of what
makes the class challenging is that there are so many different things
to master.  I want to assess the fraction of these many little
concepts you have mastered. My perspective is that if you only
partially understand a concept, or if you give an answer that vaguely
resembles the correct answer, but is not actually correct, then you
don't have a skill or a piece of knowledge that's actually useful.

For example, if you can write down an objective function that's mostly
correct, but you dropped a few symbols (e.g. a "square"), there are 2
possibilities: 1) you don't really know how to write the objective, or
2) you know it, but in the panic of the test, you made a careless
mistake.  A grader has a bit of leeway to give partial credit to cover
the 2nd possibility, but not the first.  If you write the empirical
risk correctly but not the regularization term, you don't know the
objective function for ridge regression.  No credit for that concept.

There IS one use for partial understanding: partial understanding is a
useful starting point for continued study.  It's easier to get to
mastery if you already "kind of" understand, than if you're starting
from 0.  But to get there, you have to actually finish the job of
mastering the material.

I think you'll be surprised how much easier it is to remember
something once you've fully mastered it.  In any case, once you master
something, I always recommend that you write a note to your future
self, explaining the concept.  This should be something you can read
in 6-12 months (or years, eventually) when you need that mastery, but
you've forgotten the details.  You'll have trouble writing the note if
you don't fully understand the material, so it's also a good self
test.  I have 100s of pages of these types of notes, and I've found them
immensely useful over the years.

## Is all the math really necessary?

<a name="math"></a> 

This is a good question and worth examining.  You know the 80/20 rule,
or the "Pareto principle"?  Says you can get 80% of the outcome from
20% of the effort.  Applied here, you can be a decent data
scientist without knowing a lot of math.  What's essential (the
"20%") is an understanding of the core principles of machine learning,
such as discussed in
[DS-GA 1001](http://cds.nyu.edu/course-pages/ds-ga-1001-intro-data-science/)
or the book
[Data Science for Business](http://data-science-for-biz.com/DSB/Home.html),
along with an ability to use existing machine learning toolkits.  With
this amount of knowledge, you should be able to avoid big mistakes and
achieve some level of success as a data scientist.  For somebody who
has some quantitative background and some basic experience with
computer programming, this is not a very difficult level to achieve.
With data science becoming so popular, this level of mastery is
getting pretty common.
 
This course is really aimed at getting people much further past this
level, deeper into that last 20% of success.  You're right, that 80%
of the time, possibly even 95% of the time, you can do just fine
without perfectly understanding the details of how/why things work.
But sometimes, there really are hard questions that need to be
answered and decisions that need to be made.  And that's when all the
hard work can pay off.  At any rate, this has been my experience --
I'm sure there are other paths to success.

As a specific example, here Andrej Karpathy
[makes the case](https://medium.com/@karpathy/yes-you-should-understand-backprop-e2f06eab496b#.cqsiru2ei)
for really understanding the math of backprop. 
