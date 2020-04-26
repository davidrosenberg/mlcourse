library(ggplot2)
library(reshape2)
library(data.table)


jobFolder = "~/Dropbox/repos/mlcourse/Figures/neural-networks"

xmin=-4
xmax=4
d = data.table(input = seq(xmin,xmax,length.out=3000))
d[, Sigmoid := 1/(1+ exp(-input))]
d[, Tanh := tanh(input)]
d[, Rectified_Linear := 1/(1+ exp(-input))]

dd = as.data.table(melt(d, id.vars="input"))#, variable.name="Loss")
setnames(dd, "variable", "Activation_Function")

plotOrder = c("Tanh", "Sigmoid",  "Rectified_Linear")

for (i in 1:length(plotOrder)) {
  p = ggplot(dd[Activation_Function %in% plotOrder[1:i]] , aes(x=input, y=value, color=Activation_Function))
  p = p + geom_line(size=1.6)+ xlab("Input") + ylab("Output")+xlim(-4,4)#+ylim(0,4)
  p = p + theme(legend.justification=c(0,0), legend.position=c(0.6,.6))
  fname = paste0(jobFolder,"/activationFn-",paste(plotOrder[1:i],collapse="-"),".png")
  print(fname)
  ggsave(filename=fname,plot=p, units="in", width=6, height = 4)
}

xmin = -1.5; xmax = 1.5
x = seq(xmin,xmax,length.out=3000)
numFns = 6
v = 5*rnorm(numFns)
b = 4*rnorm(numFns)
bMatrix = matrix(b, nrow=length(x), ncol=length(b), byrow=TRUE)
affineTransforms = outer(x,v) + bMatrix
colnames(affineTransforms) = paste0("a",(1:numFns))
d = as.data.table(affineTransforms)
d[, x := x]
dd = as.data.table(melt(d, id.vars="x"))
#p = ggplot()
#p + geom_line(data=dd, aes(x=x, y=value, color=variable), size=1)

dd[, activation := tanh(value)]
p = ggplot()
p + geom_line(data=dd, aes(x=x, y=activation, color=variable), size=1)

## Now let's take random samples of all neural net parameters
xmin = -1.5; xmax = 1.5
x = seq(xmin,xmax,length.out=3000)
numFns = 6
numScoreFunctions = 6
scores = matrix(nrow=length(x), ncol=numScoreFunctions)
for (i in 1:numScoreFunctions) {
  v = 5*rnorm(numFns)
  b = 4*rnorm(numFns)
  bMatrix = matrix(b, nrow=length(x), ncol=length(b), byrow=TRUE)
  affineTransforms = outer(x,v) + bMatrix
  w = 5*rnorm(numFns)
  b2 = 4*rnorm(1)
  affineTransform = tanh(affineTransforms) %*% w + b2
  scores[,i] = affineTransform
}

colnames(scores) = paste0("s",(1:numFns))
d = as.data.table(scores)
d[, x := x]
dd = as.data.table(melt(d, id.vars="x"))
p = ggplot()
p + geom_line(data=dd, aes(x=x, y=value, color=variable), size=1)


library(neuralnet)
xmin = -1; xmax = 1
x = seq(xmin,xmax,length.out=50)
d = data.table(x=x)
d[, xsquared := x^2-.5]
nHidden = 3
xsqrNNet = neuralnet(xsquared ~ x, data=d, hidden=c(nHidden),
                     act.fct="tanh", linear.output=TRUE,threshold = 0.001 )
xx = seq(xmin,xmax,length.out=10)
dd = data.table(x=xx)
preds = compute(xsqrNNet, xx)
dd[, pred := preds$net.result]
p = ggplot()
p = p + geom_point(data=d, aes(x=x, y=xsquared))
p + geom_line(data=dd, aes(x=x, y=pred))

hidden = preds$neurons[[2]]
colnames(hidden) = paste0('h',0:(nHidden))
dd = cbind(dd, hidden)
dd[, h0 := NULL]
ddd = as.data.table(melt(dd, id.vars="x"))
p = ggplot()
p +geom_point(data=d, aes(x=x, y=xsquared))+ geom_line(data=ddd, aes(x=x,y=value, color=variable))
xsqrNNet$result.matrix


