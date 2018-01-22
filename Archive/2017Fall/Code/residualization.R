library(ggplot2)
set.seed(1234)

N= 100000
x0 = rnorm(N)
##x0 = runif(N,min=0,max=1)

sigx = 0.33
x1 = x0 + sigx*rnorm(N)
x2 = x0 + sigx*rnorm(N)


cor(x1,x2)
1/(1+sigx^2)  # theoretical value, as N-->Infinity
 
sigy = 1
y = 2 + 5*x0 + sigy*rnorm(N)

d = data.table(x1=x1,x2=x2,y=y)
ggplot(d, aes(x=x1, y=x2))+ geom_point(aes(color=y))

fit = lm(y ~ x1 + x2)
summary(fit)

fitx1x2 = lm(x1 ~ x2)
fitx2x1 = lm(x2 ~ x1)
                                   
summary(fitx1x2)  # E[x1|x2] = x2/ (1+sigx^2)
1/ (1+sigx^2)  # theoretical coefficient of x2
summary(fitx2x1)

d[, resx1 := residuals(fitx1x2)]
d[, resx2 := residuals(fitx2x1)]

d[, mean(resx1)]  #should be 0
d[, var(resx1)]
d[, cor(resx1,resx2)]
e=1+sigx^2 
e-e^-1  # theoretical variance of each residual
(1-e^2)/(e^3-e)  # theoretical correlation of residuals

ggplot(d, aes(x=resx1, y=resx2))+ geom_point(aes(color=y))
cor(residuals(fitx1x2), residuals(fitx2x1))
-(1+sigx^2) / ( 1 + (1+sigx^2)^2)



fit2 = lm(y ~ residuals(fitx1x2) + residuals(fitx2x1))
summary(fit2)

mean(residuals(fitx2x1))
