library(data.table)

## true model
## y = z + eps, for eps N(0,1).

n = 100
d = 50

z = rnorm(n, sd = 10)
eps = rnorm(n, sd = 1)
y = z + eps


## But we don't observe z, but rather 100 noisy versions of z
x = matrix(z + rnorm(n*d, sd=.5), nrow=n)
colnames(x) = paste0("x",1:d)
d = data.table(y,x)

fit = lm(y ~ ., data=d)
summary(fit)
 
