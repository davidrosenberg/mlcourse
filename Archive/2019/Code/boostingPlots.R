##http://vis.supstat.com/2013/04/mathematical-annotation-in-r/
library(ggplot2)
library(reshape2)
library(data.table)
quartz()

jobFolder = "/Users/dr9512/Dropbox/NYU.ML.Class/Lectures/Figures/boosting"

xmin=0.001
xmax=.5
d = data.table(err = seq(xmin,xmax,length.out=3000))
d[, alpha := log((1-err)/err)]

p = ggplot(d, aes(x=err,y=alpha))
p = p + geom_line(size=1.5) + labs(title="Classifier Weight vs Weighted Error")
p+ylab(expression(alpha[m]))+xlab(expression(err[m]))
print(p)

fname = paste0(jobFolder,"/adaboostAlphaVsError.png")
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

xmin=0.001
xmax=.5
d = data.table(err = seq(xmin,xmax,length.out=3000))
d[, weightIncreaseFactor := ((1-err)/err)]

p = ggplot(d, aes(x=err,y=weightIncreaseFactor))
p = p + geom_line(size=1.5) + labs(title="Multiplicative Weight Update for Misclassified Points") + scale_y_log10() + ylab("Weight Increase Factor")

fname = paste0(jobFolder,"/adaboostWeightUpdate.png")
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)


n = 10
w = rep(1/n, n)
errIdx = c(1,2)
err = length(errIdx) / n
w[errIdx] = w[errIdx] * (1-err)/err
wNormalized = w / sum(w)
wNormalized

### Loss functions
xmin=-4
xmax=4
d = data.table(margin = seq(xmin,xmax,length.out=3000))
d[, Zero_One := as.numeric(margin<0)]
d[, Hinge := pmax(1-margin, 0)]
##d[, Perceptron := pmax(-margin, 0)]
d[, Logistic := log(1+ exp(-margin))]
d[, Logistic_Rescaled:= log(1+ exp(-margin))/log(2)]
d[, Exponential := exp(-margin)]

dd = as.data.table(melt(d, id.vars="margin"))#, variable.name="Loss")
setnames(dd, "variable", "Loss")

plotOrder = c("Zero_One", "Hinge", "Logistic_Rescaled", "Exponential")

i=length(plotOrder)
p = ggplot(dd[Loss %in% plotOrder[1:i]] , aes(x=margin, y=value, color=Loss))
p = p + geom_line(size=1.6)+ xlab("Margin m=yf(x)") + ylab("Loss(m)")+xlim(-3,2)+ylim(0,8)
p = p + theme(legend.justification=c(0,0), legend.position=c(0.6,.6))
print(p)

fname = paste0(jobFolder,"/loss.",paste(plotOrder[1:i],collapse="."),".png")
print(fname)
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

