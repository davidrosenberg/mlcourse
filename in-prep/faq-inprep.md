## Conditional probability models

[//]: # (Original discussion: https://piazza.com/class/ii99b8o57me5jo?cid=383)

**What's the deal with conditional probability models, GLMs, and multinomial logistic regression?**

At a high level, for any conditional probability model, there are a few things we need to think about:
1) A function that takes (x,y) as input and returns the likelihood of y given x. This function is what we finally want to produce. An example of this is on slide 34, which is for the multinomial case. Here we plug in an input x and a possible output y, and the expression gives us a prediction for p(y∣x), the conditional likelihood (which in this case is also a probability) of y given x.  Another example of this is given on slide 39 for Gaussian regression. In that case, we are getting the conditional likelihood (or density here) for a particular y given x.
 
Equivalently, we can have a function that produces the parameter of a probability distribution, that we could then use to calculate the likelihood of y given x. An example of the latter is given on the bottom of slide 26. There, p(y=1∣x) is the Bernoulli parameter θ. And we can use that to (trivially) calculate the probabilities of y=1 and y=0. 
 
2) Once we can predict conditional likelihood for any (x,y), we can apply that to our data set D. By independence, the likelihood of the whole dataset is the product of the likelihood of the individual observations. This dataset likelihood (or more typically we just write down the log-likelihood) is given for Bernoulli on slide 29, for Poisson regression it's on slide 37, and for Gaussian it's on slide 41. I did not write down the data likelihood for multinomial, but I hope you can now figure out how to do so.
 
3) Once we can write down the likelihood of our dataset, then we want to find the parameter value that maximizes that likelihood. That's called the MLE. In all of our examples, we've been denoting this parameter by the vector w∈Rd.
 
OK -- that's the big picture. Now there's the question about the transfer/link function and the softmax...
 
In these slides we're talking about a particular strategy for going from x to a probability distribution on y. Although I never gave the general definition, all of our examples are instances of a "generalized linear model" (GLM). For a GLM, we need to do the following:
1) We choose a parametric family of probability distributions for y. Then for each x, we're essentially predicting the parameter in that family. For each family, the parameter may have a different range. For Bernoulli, the parameter is in [0,1]. For the Gaussian mean, it's the full real line. For the exponential distribution, it's nonnegative reals.... 
2) Our prediction is derived from a linear function of x, which we've been denoting wtx. That's what the "linear" in GLM means. 
3) We usually cannot use wtx directly as our parameter prediction, because it can be any real number, and as we said in 1), the parameter we're predicting is often restricted to a particular domain. To map wtx to the right domain, we use a "transfer" or "inverse link" function. For the Bernoulli case, this is described in slide 26 and 27. The choice of this transfer function is a modeling assumption, along the same lines as choosing the parametric family. This is decided by the data scientist. It can be based on data at a model selection phase. 
 
Multinomial logistic regression is a bit of a special case, because the distribution we are predicting has k parameters. One approach to this is to have k linear functions of x. The softmax function then maps the outputs of those k functions, which are real-valued, into the k parameters that we are trying to predict. So the softmax function is indeed the transfer function in this setting.
