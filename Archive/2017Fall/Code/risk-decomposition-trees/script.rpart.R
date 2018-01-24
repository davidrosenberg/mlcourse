library(data.table)
library(rpart)
library(ggplot2)
library(tree)
library(reshape2)
library(foreach)
library(plyr)
##jobFolder = '~/Dropbox/DRClass/ApproxEstError/package_rpart'
jobFolder = '~/Dropbox/NYU.ML.Class/Demos/ZNS-ApproximationEstimation'
## 1. Classification Sample Data
## Has two features
#- x1 within [0,1]
#- x2 within [0,1]
# Output y
# y = 1 if x1-x2>0 
# y = 0 if x1-x2<=0 


if(1==0){ ## uniform random train data
  sampleSize = 2^21
  sampleSize = 2^10
  x1 = runif(sampleSize)
  x2 = runif(sampleSize)
  y = as.numeric(x1>x2)
  trainData = data.table(x1,x2,y)
  plotSubsampleIdx  = sample(1:sampleSize,min(sampleSize,5000))
  treeDepthVec = c(2:15)
}

# super uniform train data
gridsize = 0.0005
grids = seq(0,1,gridsize)
trainData = CJ(x1 = grids,x2 = grids)
trainData = trainData[x1!=x2]
trainData[,y:=x1>x2]
sampleSize = nrow(trainData)
plotSubsampleIdx  = sample(1:sampleSize,min(sampleSize,5000))
treeDepthVec = c(2:10)

## go exact
td = trainData[order(x2)]
td = trainData[order(-x1)]
td[, numGoodToHere := cumsum(y)]
td[, numGoodAfterHere := (nrow(td) - .I) - (sum(y) - numGoodToHere)]
td[, accuracy := (numGoodToHere + numGoodAfterHere) / nrow(td)]
td[which.max(accuracy)]

## 1.0. tree classification boundary plots 
plotFolder = paste0(jobFolder,"/DemoPlots")
dir.create(plotFolder)
for (treeDepth  in treeDepthVec){
  treefit= rpart(y ~x1+x2,data = trainData,method = 'class',minsplit = 2,minbucket = 1,cp = 0,maxdepth = treeDepth)
  treefit= rpart(y ~x1+x2,data = trainData,method = 'class',maxdepth = treeDepth)
print(treefit)
  contourData = CJ(x1 = seq(0,1,0.001),x2 = seq(0,1,0.001))
  tree.pred.contour.raw = predict(treefit,contourData)[,1]
  tree.pred.contour = matrix(tree.pred.contour.raw,1001,1001,byrow = T)

  fname = paste0(plotFolder,"/treeDepth",treeDepth,'.png')
  fname
  png(fname)
  contour(seq(0,1,0.001),seq(0,1,0.001),tree.pred.contour,levels = 0.5,labels = "",xlab = 'x1',ylab = 'x2',axes = T,lwd = 2)
  points(trainData[plotSubsampleIdx,list(x1,x2)], col=ifelse(trainData[plotSubsampleIdx,y]==1, "coral", "cornflowerblue"),cex = 0.1)
  dev.off()
}


## 1.1. Approximation error - run 10 times to get minimal RET.AE
RET.AE = data.table()
for(i in 1:10){
  sampleSize = 2^21
  x1 = runif(sampleSize)
  x2 = runif(sampleSize)
  y = as.numeric(x1>x2)
  trainData = data.table(x1,x2,y)
  for (treeDepth in treeDepthVec ){
    treefit= rpart(y ~x1+x2,data = trainData,method = 'class',minsplit = 2,minbucket = 1,cp = 0,maxdepth = treeDepth)
    tree.pred = predict(treefit,trainData)[,2]
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
	tryCatch({ treefit= rpart(y ~x1+x2,data = trainData,method = 'class',minsplit = 2,minbucket = 1,cp = 0,maxdepth = treeDepth)
	tree.pred = predict(treefit,testData)[,2]
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
RET.EXCESS  = fread(paste0(jobFolder,"/TreeExcessRisk.csv"))
RET.EXCESS.avg  = RET.EXCESS[,list(excess_risk= mean(errorRate)),by=list(sampleSize,noiseRate,treeDepth)]
RET.AE = fread(paste0(jobFolder,"/TreeApproximationError.csv"))
RET.AE.minimal = RET.AE[,list(approximation_error= min(errorRate)),by=treeDepth]

RET.merged =  merge(RET.AE.minimal,RET.EXCESS.avg,by = 'treeDepth')
RET.merged[,estimation_error:=excess_risk - approximation_error]
write.table(RET.merged,file = paste0(jobFolder,"/TreeAllThreeErrors.csv"),sep =",",col.names = T,row.names = F)

# plots
for(noise in noiseRateVec){
  RET.merged.tmp = RET.merged[noiseRate == noise]

  ## Plot
  plotFolder.sub = paste0(jobFolder,"/noiseRate",noise)
  dir.create(plotFolder.sub)

  for (s in sampleSizeVec){
    toplot = RET.merged.tmp[sampleSize == s]
    toplot[estimation_error<0,estimation_error:=0]
    toplot = melt(toplot,idvars = 'treeDepth',measure.vars = c('approximation_error','excess_risk','estimation_error'))
    g = ggplot(toplot,aes(x = treeDepth, y = value,color = as.factor(variable)))+geom_line()+
    ylim(c(0,0.3))+ggtitle(paste0("sample size = ",s))+
    xlab("tree depth") + ylab("")+theme(legend.title=element_blank())
    png(paste0(plotFolder.sub,"/sampleSize",s,".png"))
    print(g)
    dev.off()
  }
}

