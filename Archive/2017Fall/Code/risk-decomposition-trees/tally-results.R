setwd("~/Dropbox/repos/mlcourse/Code/risk-decomposition-trees")

##d.approx  = fread("TreeApproximationError.csv")
d  = fread("TreeExcessRisk.csv")
d[ noiseRate == .1 & sampleSize==1024][, list(mean=mean(errorRate),sd=sd(errorRate)), by=list(treeDepth)]
d[ noiseRate == .1 & treeDepth==8][, list(mean=mean(errorRate),sd=sd(errorRate)), by=list(sampleSize)]
.
