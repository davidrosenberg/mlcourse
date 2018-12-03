library(rpart)
library(ggplot2)
library(tree)
library(ROCR)
library(reshape2)
library(foreach)
jobFolder = '~/Dropbox/DRClass'
## 1. Classification Sample Data
## Has two features
#- x1 within [0,1]
#- x2 within [0,1]
# Output y
# y = 1 if x1-x2>0 
# y = 0 if x1-x2<=0 

sampleSize = 2^20
x1 = runif(sampleSize)
x2 = runif(sampleSize)
y = as.numeric(x1>x2)
trainData = data.frame(x1,x2,y)

## 1.0. Approximation error - plots (for demo)
plotFolder = paste0(jobFolder,"/DemoPlots")
treeDepthVec = c(2:15)
RET.AE = data.table()
for (treeDepth in treeDepthVec ){
  minCut = round(sampleSize/(2^treeDepth))
  treefit = tree(y ~ x1+x2,data=trainData,mincut = minCut,minsize = 2*minCut,mindev = 0)
  tree.pred = predict(treefit,trainData)
  errorRate = round(sum(as.numeric((tree.pred <=0.5 & y ==1) | (tree.pred>0.5 & y ==0)))/sampleSize,10)


  png(paste0(plotFolder,"/treeDepth",treeDepth,".png"))
  plot(trainData$x1,trainData$x2,col='white', xlab="x1",ylab="x2",main = paste0("Error Rate (thre = 0.5): ",errorRate))
  partition.tree(treefit,ordvars=c("x1","x2"),add=TRUE)
  dev.off()
  RET.AE = rbind(RET.AE,data.table(treeDepth = treeDepth,errorRate = errorRate))
}
write.table(RET.AE,file = paste0(plotFolder,"/TreeApproximationErrorAlignWithPlots.csv"),sep = ",",col.names = T,row.names = F)


## 1.1. Approximation error - run 10 times to get minimal RET.AE
RET.AE = data.table()
for(i in 1:10){
  sampleSize = 2^21
  x1 = runif(sampleSize)
  x2 = runif(sampleSize)
  y = as.numeric(x1>x2)
  trainData = data.frame(x1,x2,y)
  for (treeDepth in treeDepthVec ){
    minCut = round(sampleSize/(2^treeDepth))
    treefit = tree(y ~ x1+x2,data=trainData,mincut = minCut,minsize = 2*minCut,mindev = 0)
    tree.pred = predict(treefit,trainData)
    errorRate = round(sum(as.numeric((tree.pred <=0.5 & y ==1) | (tree.pred>0.5 & y ==0)))/sampleSize,10)
    RET.AE = rbind(RET.AE,data.table(trial = i,treeDepth = treeDepth,errorRate = errorRate))
  }
}
write.table(RET.AE,file = paste0(jobFolder,"/TreeApproximationError.csv"),sep = ",",col.names = T,row.names = F)
RET.AE.minimal = RET.AE[,list(errorRate = min(errorRate)),by=treeDepth]

# 2. excess risk
testSize = 2^20
x1 = runif(testSize)
x2 = runif(testSize)
y = as.numeric(x1>x2)
testData = data.frame(x1,x2,y)

sampleSizeVec = unlist(lapply(c(6:15),function(x) {2^x}))
noiseRateVec = seq(0,0.1,0.02)
treeDepthVec = c(2:20)
ret <- foreach(rep = c(1:8)) %do% {
  RET.EXCESS = data.table()
  for(noiseRate  in noiseRateVec){
    for(sampleSize in sampleSizeVec){
      x1 = runif(sampleSize)
      x2 = runif(sampleSize)
      y = as.numeric(x1>x2)

      noiseIndex = sample(c(1:sampleSize),round(sampleSize*noiseRate))
      y[noiseIndex] = 1-y[noiseIndex]

      idx = x1!=x2
      trainData = data.frame(x1,x2,y)[idx,]

      for(treeDepth in treeDepthVec){
	minCut = max(1, ceiling(sampleSize/(2^treeDepth)))
	tryCatch({treefit = tree(y ~ x1+x2,data=trainData,mincut = minCut,minsize = 2*minCut,mindev = 0)
	tree.pred = predict(treefit,testData)
	errorRate = round(sum(as.numeric((tree.pred <=0.5 & testData$y ==1) | (tree.pred>0.5 & testData$y ==0)))/testSize,10)
	RET.EXCESS = rbind(RET.EXCESS,data.table(rep = rep,sampleSize = sampleSize,noiseRate = noiseRate,treeDepth = treeDepth,errorRate = errorRate))},error = function(e){})
      }
    }
  }
  RET.EXCESS
}

RET.EXCESS = data.table(ldply(ret,rbind))
write.table(RET.EXCESS,file = paste0(jobFolder,"/TreeExcessRisk.csv"),sep = ",",col.names = T,row.names = F)
RET.EXCESS.avg  = RET.EXCESS[,list(errorRate = mean(errorRate)),by=list(sampleSize,noiseRate,treeDepth)]

# 3.  Plots of three types of errors 
for(noise in noiseRateVec){
  RET.merged = merge(RET.AE.minimal,RET.EXCESS.avg[noiseRate == noise],by = 'treeDepth')
  setnames(RET.merged ,c('errorRate.x','errorRate.y'),c('ApprError','ExcessError'))
  RET.merged[,EstError:=ExcessError - ApprError]

  ## Plot
  plotFolder.sub = paste0(jobFolder,"/noiseRate",noise)
  dir.create(plotFolder.sub)

  for (s in sampleSizeVec){
    toplot = RET.merged[sampleSize == s]
    toplot[EstError<0,EstError:=0]
    toplot = melt(toplot,idvars = 'treeDepth',measure.vars = c('ApprError','ExcessError','EstError'))
    g = ggplot(toplot,aes(x = treeDepth, y = value,color = as.factor(variable)))+geom_line()+
    ylim(c(0,0.3))+ggtitle(paste0("sample size = ",s))+
    xlab("tree depth") + ylab("")+theme(legend.title=element_blank())
    png(paste0(plotFolder.sub,"/sampleSize",s,".png"))
    print(g)
    dev.off()
  }
}
