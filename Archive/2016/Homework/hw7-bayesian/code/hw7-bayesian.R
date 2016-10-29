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

