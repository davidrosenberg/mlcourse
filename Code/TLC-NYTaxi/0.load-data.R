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

