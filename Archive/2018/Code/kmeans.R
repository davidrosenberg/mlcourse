library(ggplot2)
library(data.table)
library(MASS)

jobFolder = "~/Dropbox/NYU.ML.Class/Lectures/Figures/clustering"

assignClass <- function(x, centers) {
  x = as.matrix(x)
  ## x is a matrix with data in rows
  ## centers is a matrix with centers in rows
  xx = rbind(centers, x)
  dd = as.matrix(dist(xx))
  dataRows = nrow(centers)+1 : nrow(xx)
  dists = dd[(nrow(centers)+1):nrow(xx),c(1,2)]
  list(closest = as.integer(apply(dists, 1, which.min)),
       dist = as.numeric(apply(dists, 1, min)))
}

## eruptions is duration in minutes
## waiting
d = as.data.table(faithful)
##setnames(faithful, c("eruptions","waiting"),c("duration","wait"))

p = ggplot(d, aes(y=waiting, x=eruptions))
p = p + geom_point() + labs(title="Old Faithful Geyser Eruptions") +ylab("Wait Time Since Last Eruption (minutes)") + xlab("Duration (minutes)")
fname = path.expand(paste0(jobFolder,"/oldfaithful.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)


dd = copy(d)
centers = matrix(c(-2.75, 80, -3.75, 50), byrow=TRUE, nrow=2)
dd[, c("class", "dist") := assignClass(as.matrix(d), centers)]
centers = as.data.table(centers)
setnames(centers, c("V1","V2"), c("waiting","eruptions"))
centers[,class:=c(1,2)]

p = ggplot(dd, aes(y=waiting, x=eruptions, col=class))
p = p + geom_point() + labs(title="Old Faithful Geyser Eruptions") +ylab("Wait Time Since Last Eruption (minutes)") + xlab("Duration (minutes)")
p + geom_point(centers,  aes(x=waiting, y=eruptions, col=class))
fname = path.expand(paste0(jobFolder,"/oldfaithful.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

class(dd)
kk = kmeans(d, centers=2, trace=FALSE)
kk$iter

## Do this without rescaling
xx = as.matrix(d)
x = xx
colnames(x) <- c("x", "y")
cl <- kmeans(x, centers=2, algorithm="MacQueen", iter.max=1000)
dd = as.data.table(x)
dd[, cluster := cl$cluster]
p = ggplot(dd, aes(x=x,y=y,col=cluster))
p = p + geom_point() + labs(title="Old Faithful Geyser Eruptions") +ylab("Wait Time Since Last Eruption (minutes)") + xlab("Duration (minutes)") + theme(legend.position="none")
cc = as.data.table(cl$centers)
p = p + geom_point(data=cc, aes(x=x,y=y), colour = "red", size = 3)
fname = path.expand(paste0(jobFolder,"/oldfaithful-clusterNoRescale.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

xx = as.matrix(d)
x = scale(xx)
colnames(x) <- c("x", "y")
cl <- kmeans(x, centers=2, algorithm="MacQueen", iter.max=1000)
dd = as.data.table(x)
dd[, cluster := cl$cluster]
p = ggplot(dd, aes(x=x,y=y,col=3-cluster))
p = p + geom_point() + labs(title="Old Faithful Geyser Eruptions") +ylab("Wait Time [standardized]") + xlab("Duration [standardized]") + theme(legend.position="none") + xlim(-2,2) + ylim(-2,2)
cc = as.data.table(cl$centers)
p = p + geom_point(data=cc, aes(x=x,y=y), colour = "red", size = 3)
fname = path.expand(paste0(jobFolder,"/oldfaithful-clusterStandardize.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

p
## Sum of squares
ss <- function(x) sum(scale(x, scale = FALSE)^2)

     ## cluster centers "fitted" to each obs.:
fitted.x <- fitted(cl);  head(fitted.x)
resid.x <- x - fitted(cl)

## Equalities : ----------------------------------
cbind(cl[c("betweenss", "tot.withinss", "totss")], # the same two columns
      c(ss(fitted.x), ss(resid.x),    ss(x)))
stopifnot(all.equal(cl$ totss,        ss(x)),
          all.equal(cl$ tot.withinss, ss(resid.x)),
          ## these three are the same:
          all.equal(cl$ betweenss,    ss(fitted.x)),
          all.equal(cl$ betweenss, cl$totss - cl$tot.withinss),
          ## and hence also
          all.equal(ss(x), ss(fitted.x) + ss(resid.x))
          )

kmeans(x,1)$withinss # trivial one-cluster, (its W.SS == ss(x))

## random starts do help here with too many clusters
## (and are often recommended anyway!):
(cl <- kmeans(x, 5, nstart = 25))
plot(x, col = cl$cluster)
points(cl$centers, col = 1:5, pch = 8)


