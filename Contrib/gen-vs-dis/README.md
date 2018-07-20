# gen-vs-dis
Generative vs Discriminative
In 2001 there was an influential paper by Andrew Ng and Michael Jordan [On discriminative vs generative classifiers](https://ai.stanford.edu/~ang/papers/nips01-discriminativegenerative.pdf). The takeway was that generative models are better with small datasets and discriminative better with large datasets. However, both the experiments and the theory were limited to the most vanilla versions of these models, without any form of regularization.

TODO: Reproduce the experiments of Ng & Jordan's paper, but include basic regularization, say L2 for logistic regression and some kind of basic smoothing for the naive bayes estimates. Do the experimental results persist?


# Summary of experiments and findings

We replicated results from Andrew Ng's paper on three datasets : Pima (continuous), Adult (continuous) and Adult (discrete).
For continuous features we used Gaussian Naive Bayes while for discrete ones we used Multinomial Naive Bayes. As a regularizer for Gaussian Naive Bayes we added some epsilon (eps=1e-2) to diagonal covariances for smoothing (preventing values from taking on 0 probabilities). For Multinomial Naive Bayes we used Laplace smoothing (l=1)

We then generated a bigger synthetic dataset (n_samples=10000, n_features=200) and in addition to comparing Naive Bayes with Logistic regression we also compared Naive Bayes with regularized (5-fold cross validated) Logistic regression. 
We observed the same behavior we saw on smaller datasets with Naive Bayes and Logistic Regression but when regularized Logistic regression outperformed Naive Bayes very early on (<500 data points)!  

One possible explanation could be that since Logistic regression is trained on a very small data set without any form of regularization it is susceptible to overfitting and hence does a bad job generalizing on unseen data. When regularized on the other hand, even with small dataset, it performs equally well compared to Naive Bayes (if not better as dataset size increases).
