library(ggplot2)
library(reshape2)
library(data.table)

jobFolder = "~/Dropbox/repos/mlcourse/Code"

xmin=-4
xmax=4
d = data.table(margin = seq(xmin,xmax,length.out=3000))
d[, Zero_One := as.numeric(margin<0)]
d[, Hinge := pmax(1-margin, 0)]
d[, Perceptron := pmax(-margin, 0)]
d[, Logistic := log(1+ exp(-margin))]
d[, Exponential := exp(-margin)]
d[, Square := (1-margin)^2]

dd = as.data.table(melt(d, id.vars="margin"))#, variable.name="Loss")
setnames(dd, "variable", "Loss")

plotOrder = c("Zero_One", "Perceptron", "Hinge", "Logistic")
plotOrder = c("Zero_One", "Hinge", "Logistic", "Square")

for (i in 1:length(plotOrder)) {
  p = ggplot(dd[Loss %in% plotOrder[1:i]] , aes(x=margin, y=value, color=Loss))
  p = p + geom_line(size=1.6)+ xlab("Margin m=yf(x)") + ylab("Loss(m)")+xlim(-3,3)+ylim(0,4)
  p = p + theme(legend.justification=c(0,0), legend.position=c(0.6,.6))
  print(fname)
  fname = paste0(jobFolder,"/loss.",paste(plotOrder[1:i],collapse="."),".png")
  ggsave(filename=fname,plot=p, units="in", width=6, height = 4)
}


## Huberized Loss
xmin=-4
xmax=4
d = data.table(margin = seq(xmin,xmax,length.out=3000))
d[, SquareHinge := pmax(1-margin, 0)^2]
d[, Negative4Margin := -.1-4*margin]
d[, HuberizedSquareHinge := .2+ifelse(margin< -1, Negative4Margin, SquareHinge)]
dd = as.data.table(melt(d, id.vars="margin"))#, variable.name="Loss")
setnames(dd, "variable", "Loss")
p = ggplot(dd, aes(x=margin, y=value, color=Loss))
p = p + geom_line()+ xlab("Margin m=yf(x)") + ylab("Loss(m)")
p = p + theme(legend.justification=c(0,0), legend.position=c(.4,.6))
p+xlim(-3,2)+ylim(-10,16)
fname = "/Users/dr9512/Dropbox/NYU.ML.Class/Homeworks/Midterm/Figures/huberizedSqrHinge.png"
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

## Logistic loss on log scale
xmin=-4
xmax=40
d = data.table(margin = seq(xmin,xmax,length.out=3000))
d[, Logistic := log(1+ exp(-margin))]
d[, LogLogistic := log(Logistic)]
p = ggplot(d, aes(x=margin, y=Logistic))
p + geom_line(size=1.6)+ xlab("Margin m=yf(x)") + ylab("Logistic(m)")+scale_y_log10()



p = ggplot(d, aes(x=margin, y=LogLogistic))
p + geom_line(size=1.6)+ xlab("Margin m=yf(x)") + ylab("LogLoss(m)")
p = p + geom_line(size=1.6)+ xlab("Margin m=yf(x)") + ylab("Loss(m)")+xlim(-3,3)+ylim(
d
dd = as.data.table(melt(d, id.vars=c("logmargin","margin")  #, variable.name="Loss")
setnames(dd, "variable", "Loss")

p = ggplot(dd[Loss %in% plotOrder[1:i]] , aes(x=margin, y=value, color=Loss))
p = p + geom_line(size=1.6)+ xlab("Margin m=yf(x)") + ylab("Loss(m)")+xlim(-3,3)+ylim(0,4)
p = p + theme(legend.justification=c(0,0), legend.position=c(0.6,.6))



print(fname)
fname = paste0(jobFolder,"/loss.",paste(plotOrder[1:i],collapse="."),".png")
  ggsave(filename=fname,plot=p, units="in", width=6, height = 4)
}
