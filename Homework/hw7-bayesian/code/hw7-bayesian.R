require(ggplot2)
library(scales)
library(data.table)

## Plot Beta prior for CTR problem
xmin = 0
xmax = 0.025
numPts = 1000
a = shape1 = 3
b = shape2 = 400
d = data.table(x=seq(xmin, xmax, len = numPts))
d[, y := dbeta(x,shape1, shape2)]
theTitle = paste0("Beta(",shape1,",",shape2,") Density Function")
p <- ggplot(d, aes(x,y)) + geom_line() + labs(title=theTitle) + xlab(expression(theta)) + scale_x_continuous(labels=scales::percent)
p <- p + theme(axis.ticks = element_blank(), axis.text.y = element_blank()) + ylab(NULL)

setwd("~/Dropbox/repos/mlcourse-homework/hw7-bayesian/")

fname = paste0("beta",shape1,"-",shape2,".png"); fname
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

beta(a,b)

#### Marginal Likelihood calculations
#contour plot using ggplot2
library(ggplot2)
library(reshape2) #for melt()
library(lattice) #for filled.contour()
library(RColorBrewer) #for brewer.pal()
d
x = 3
n = 500
d[, lik := beta(x+a,n-x+b)/beta(a,b)]
v<-ggplot(d, aes(x=a,y=b,z=lik))+
    geom_tile(aes(fill=lik))+
    stat_contour(bins=6,aes(a,b,z=lik), color="black", size=0.6)+
    scale_fill_gradientn(colours=brewer.pal(6,"YlOrRd"))

d[, loglik := log(beta(x+a,n-x+b)) - log(beta(a,b))]

###
npts = 100
a <- seq(1/npts,5,length.out=npts)
b <- seq(1/npts,16,length.out=npts)
d = CJ(a,b)
setnames(d,c("V1","V2"),c("a","b"))
ss = matrix( c(20,40,
               2,4,
               3,90), byrow=TRUE, ncol=2)
colnames(ss) = c("x","n")

marglik <- function(aa,bb) {
    prod(beta(ss[,"x"]+aa, ss[,"n"]-ss[,"x"]+bb)) / (beta(aa,bb)^nrow(ss))
}
d[, sslik := marglik(a,b), by=rownames(d)]
v<-ggplot(d, aes(x=a,y=b,z=sslik))+
    geom_tile(aes(fill=sslik))+
    stat_contour(bins=6,aes(a,b,z=sslik), color="black", size=0.6)+
    scale_fill_gradientn(colours=brewer.pal(6,"YlOrRd"))
v
d[order(sslik)]
d[which.max(sslik), list(amax=2*a,bmax=2*b)]
