library(data.table)

figFolder = "~/Dropbox/repos/mlcourse/Code/TLC-NYTaxi/Figures"

load("~/Dropbox/NYU.ML.Class/2015/Demos/NY-TLC/tlc-data.RData")
## Data into cnts data.table

## Drop first and last weeks (potentially incomplete)
cntByWeek = cnts[,sum(cnt),by=week][order(week)]
minmaxweek = cntByWeek[,c(min(week),max(week))]
cnts = cnts[!(week %in% minmaxweek)]

## Reaggregate counts.  There are some counts broken up into multiple entries.
cnts = cnts[, list(cnt = sum(cnt)), by=list(gridid,week,wkhr)]
setkey(cnts, gridid, week, wkhr)

BBGblue = rgb(13,157,219, maxColorValue=255)
BBGgreen = rgb(77,170,80, maxColorValue=255)

stem.ggplot <- function(x,y,linecol=1,clinecol=1,main = ""){
## From  Ningshan Zhang
  require(ggplot2,quietly = T)
  if (missing(y)){
    y = x
    x = 1:length(x)
  }
  stemdata= data.frame(x,y)
  g = ggplot(stemdata,aes(x,y))+geom_point(col = linecol) + # points
    geom_segment(xend = x,yend = 0,col = linecol) + # vertical lines
      geom_segment(x = x[1]-2,xend = x[length(x)]+2,y=0,yend = 0,col = clinecol) +# horizontal lines
        labs(title = main)
  return(g)
### Demo
  library(gridExtra)
  x <- seq(0, 2*pi, by = 0.2)
  q1 = stem.ggplot(x,sin(x), main = 'Default style')
  q2 = stem.ggplot(x,sin(x), main='With MATLAB colors', linecol=4,clinecol=2)
  grid.arrange(q1,q2,nrow = 2 )
}
