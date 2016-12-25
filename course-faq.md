# Frequently Asked Questions


## Vectorization
[//]: # (Original discussion: https://piazza.com/class/ii99b8o57me5jo?cid=24)

An essential tool for writing machine learning tools in high-level
languages such as Python, Matlab, R, etc., is vectorization.  That is,
using built in operations for multiplying matrices, vectors, and
arrays, rather than coding it yourself with loops.  Some people have
found Justin Johnson's [Nympy Tutorial](http://cs231n.github.io/python-numpy-tutorial/)
helpful, but please share additional recommended resources.
## Partial Credit and Concept Mastery

<a name="concept-mastery"></a> 
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
self, explaining the concept.  This should be somehting you can read
in 6-12 months (or years, eventually) when you need that mastery, but
you've forgotten the details.  You'll have trouble writing the note if
you don't fully understand the material, so it's also a good self
test.  I have 100s pages of these types of notes, and I have find them
immensely useful over the years.

## Is all the math really necessary?

<a name="math"></a> 

This is a good question and worth examining.  You know the 80/20 rule
or the "pareto principle"?  Says you can get 80% of the outcome from
20% of the effort.  Applied here, you can be a pretty decent data
scientist without a lot of "deep understanding" and without knowing
much math.  What's essential (the "20%") is an understanding of the
core principles of machine learning, such as discussed in
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
 
This course, and the Masters in Data Science curriculum more
generally, is really aimed at getting people much further past this
level, deeper into that last 20% of success.  You're right, that 80%
of the time, possibly even 95% of the time, you can do just fine
without perfectly understanding the details of how/why things work.
But sometimes, there really are hard questions that need to be
answered and decisions that need to be made.  And that's when all the
hard work can pay off.  At any rate, this has been my experience --
I'm sure there are other paths to success.

As a specific example, here Andrej Karpathy
[makes the case](https://medium.com/@karpathy/yes-you-should-understand-backprop-e2f06eab496b#.cqsiru2ei)
for really understanding the math of backprop.  I'll collect more as I
find them. (Please let [me](mailto:dr129@nyu.edu) know of good
specific examples.)
