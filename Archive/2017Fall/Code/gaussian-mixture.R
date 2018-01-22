library(mvtnorm)
library(ggplot2)
jobFolder = "~/Dropbox/NYU.ML.Class/Lectures/Figures/clustering"

set.seed(1)
n <- 100
rho1 <- 0  #correlation
Sigma1 <- matrix(c(1, rho1, rho1, .4), 2, 2) # Covariance matrix
rho2 <- -0.3  #correlation
Sigma2 <- 1.4*matrix(c(.7, rho2, rho2, .7), 2, 2) # Covariance matrix
rho3 <- .1  #correlation
Sigma3 <- matrix(c(.5, rho3, rho3, .5), 2, 2) # Covariance matrix

means = matrix(c(0,0,4,2,-2,4), nrow=3, byrow=TRUE)
x1 <- cbind(rmvnorm(n, mean=means[1,], Sigma1), 1)
x2 <- cbind(rmvnorm(n, mean=means[2,], Sigma2), 2)
x3 <- cbind(rmvnorm(n, mean=means[3,], Sigma3), 3)
x = rbind(x1,x2,x3)
d = data.table(x=x[,1],y=x[,2], c=x[,3])

meandt = as.data.table(means)
setnames(meandt, c("V1","V2"), c("x","y"))
meandt[, nn := c("hi","bye","dfds")]
meandt[, c := as.factor(c(1,2,3))]
p <- ggplot(d, aes(x, y, color=as.factor(c)))
p = p + geom_point() +        coord_fixed() +
  stat_ellipse(type = "norm", level=.66, size=1.5)
##p+  annotate("text", label = expression(N(mu[1],Sigma[1])), x = -2, y = 2, size = 4, colour = "red")
p = p + annotate('text', x = -2.3, y = 2.2, label = "bolditalic(N)(bolditalic(mu)[1],Sigma[1])",parse = TRUE,size=5) +
 annotate('text', x = 0, y = -1.5, label = "bolditalic(N)(bolditalic(mu)[2],Sigma[2])",parse = TRUE,size=5) +
  annotate('text', x = 4.5, y = -.25, label = "bolditalic(N)(bolditalic(mu)[3],Sigma[3])",parse = TRUE,size=5) + labs(title="Mixture of Three Gaussians")
p = p + theme(legend.position="none")

fname = path.expand(paste0(jobFolder,"/mixture-3-gaussians.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

p <- ggplot(d, aes(x, y))
p = p + geom_point() +        coord_fixed() + labs(title="Mixture of Three Gaussians")
p = p + theme(legend.position="none")
p
fname = path.expand(paste0(jobFolder,"/mixture-3-gaussians-nolabels.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)
