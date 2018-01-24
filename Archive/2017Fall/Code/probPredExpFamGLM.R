library(reshape2)
library(data.table)
library(ggplot2)

figbasepath = path.expand("~/Dropbox/NYU.ML.Class/Lectures/Figures")
figpath = paste0(figbasepath,"/cosineWithNoise")
figpath = path.expand("~/Dropbox/NYU.ML.Class")

plotIt <- function(d, legendLabels, ylims=c(-3,3)) {#, yname="Y") {
  dd = as.data.table(melt(d, id.vars="x"))
  if (!missing(legendLabels)) {
    dd[, variable := factor(variable, levels=legendLabels[,levels], labels=legendLabels[,labels])]
  }
  setnames(dd, "variable", "Y")
  f <- ggplot(dd, aes(x=x, y=value, color=Y))
  f <- f + geom_point(size=1)
  f <- f + geom_line(data = dd[Y%in% legendLabels[line==TRUE, labels]], size=1.7)
  return(f+ylab("")+ylim(ylims))
}

mysave <- function(plot, fname) {
  fullpath = paste0(figpath,"/",fname)
  cat("Saving to",fullpath,"\n")
  ggsave(filename=fullpath,plot=plot, units="in", width=5, height=3)
}

## Basic function setup
n = 1000
d = data.table(x=seq(0,10, length.out=n))
d[, meanY := cos(x)]

## Gaussian Noise 1
d[, Y := meanY + rnorm(n=n, mean=0, sd=0.3)]
legendLabels = data.table(levels=c("meanY","Y"), labels=c("cos(x)", "cos(x)+N(0,0.09)"), line=c(TRUE,FALSE))
p = plotIt(d, legendLabels); print(p)
mysave(p, "cosineGaussNoise1.pdf")
mysave(p, "cosineGaussNoise1.svg")
fullpath = paste0(figpath,"/","cosineGaussNoise.svg")
cat("Saving to",fullpath,"\n")
ggsave(filename=fullpath,plot=p, units="in", width=5, height=3)
ggsave(filename=fullpath,plot=p)


## Gaussian Noise 2
d[, Y := meanY + rnorm(n=n, mean=0, sd=0.1)]
legendLabels = data.table(levels=c("meanY","Y"), labels=c("cos(x)", "cos(x)+N(0,0.01)"), line=c(TRUE,FALSE))
p = plotIt(d, legendLabels); print(p)
mysave(p, "cosineGaussNoise2.pdf")

## Centered Exponential Noise
d[, Y := meanY + rexp(n=n, rate = 2) - .5]
legendLabels = data.table(levels=c("meanY","Y"), labels=c("cos(x)", "cos(x)+Exp(2)-0.5"), line=c(TRUE,FALSE))
p = plotIt(d, legendLabels); print(p)
mysave(p, "cosineCenteredExpNoise.pdf")

## Heterogeneous Gaussian Noise
baseNoise = rnorm(n=n, mean=0, sd = 1)
d[, Y := meanY + baseNoise * meanY * meanY ]
legendLabels = data.table(levels=c("meanY","Y"),
  labels=c("cos(x)", "cos(x)+N(0,cos^4(x))"),
  line=c(TRUE,FALSE))
p = plotIt(d, legendLabels); print(p)
mysave(p, "cosineHeterogeneousGaussNoise.pdf")


## Logit and normal CDF function
figpath = paste0(figbasepath,"/GLM")
mysave <- function(plot, fname) {
  fullpath = paste0(figpath,"/",fname)
  cat("Saving to",fullpath,"\n")
  ggsave(filename=fullpath,plot=plot, units="in", width=5, height=3)
}

library(boot)
n = 1000
d = data.table(x=seq(-5,5, length.out=n))
d[, logistic := inv.logit(x)] #logistic function is the inverse of the logit function
d[, normalCDF := pnorm(x)] #logistic function is the inverse of the logit function
legendLabels = data.table(levels=c("logistic","normalCDF"), labels=c("Logistic Function", "Normal CDF"), line=c(TRUE,TRUE))
p = plotIt(d, legendLabels, ylims=c(0,1));
p = p +xlab("Linear(x)") #+ labs(title="Inverse Links Functions for Bernoulli Regression")
print(p)
mysave(p, "bernoulliInverseLinkFunctions.pdf")


logit
f <- ggplot(data.frame(x = c(-5, 5), aes(x))
f + stat_function(fun = inv.logit, colour = "red") + stat_function(fun = pnorm, colour = "blue")




