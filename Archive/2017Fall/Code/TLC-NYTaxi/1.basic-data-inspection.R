BBGblue = rgb(13,157,219, maxColorValue=255)
BBGgreen = rgb(77,170,80, maxColorValue=255)

cnts[, length(unique(gridid)) ]  # number of unique grid cells
cnts[, max(cnt)] # max number of counts in an hour 

## Identify interesting grid cells
sgc = list() 
sgc["PennStation"] = 7750
sgc["CourantInstitute"] = 21272   #21273, 13624 nearby

#### PENN STATION PLOTS
## Fill in 0's
a = cnts[J(sgc[["PennStation"]],1075)]
all = a[, CJ(gridid=unique(gridid), week=unique(week), wkhr=0:167)]
a = a[all]
a[is.na(cnt), cnt:=0]
## Plot
p = ggplot(a, aes(wkhr,cnt))
p = p + xlab("Week Hour (0 = Sunday 00:00-00:59)")
p = p + ylab("Taxi Pickups (Per Hour)")
p = p + labs(title = "Taxi Pickups by Week-Hour (Week 1075)")
p = p + geom_line(alpha=.5) + geom_point(size=1)
p = p + geom_vline(xintercept = (0:7)*24, colour="red", linetype = "longdash")
p = p + annotate("text", x = 12+(0:6)*24, y = 140, label = c('Sun','Mon','Tues','Wed','Thurs','Fri','Sat'),color="blue")
fname = paste0(figFolder,"/pennStationWeek1075.png")
ggsave(filename=fname,plot=p, units="in", width=10, height = 6)
cat(fname)

## Multiple weeks
a = cnts[.(gridid=sgc[["PennStation"]],week=c(1071:1074)), on=c("gridid", "week")]
all = a[, CJ(gridid=unique(gridid), week=unique(week), wkhr=0:167)]
a = a[all]
a[is.na(cnt), cnt:=0]
a[, Week := as.factor(week)]
p = ggplot(a, aes(wkhr,cnt, col=Week))
p = p + xlab("Week Hour (0 = Sunday 00:00-00:59)")
p = p + ylab("Taxi Pickups (Per Hour)")
p = p + labs(title = "Taxi Pickups by Week Hour (Weeks 1071-1074)")
p = p + geom_line() + geom_point(size=1)
p = p + geom_vline(xintercept = (0:7)*24, colour="red", linetype = "longdash")
p = p + annotate("text", x = 12+(0:6)*24, y = 155, label = c('Sun','Mon','Tues','Wed','Thurs','Fri','Sat'),color="blue")
p = p + annotate("rect", xmin = 16.5, xmax = 21.5, ymin = 115, ymax = 145, alpha = .2)
p = p + annotate("rect", xmin = 29.5, xmax = 35, ymin = 0, ymax = 20, alpha = .2)
p = p + annotate("rect", xmin = 41, xmax = 47, ymin = 110, ymax = 145, alpha = .2)
p = p + annotate("rect", xmin = 161, xmax = 166, ymin = 90, ymax = 130, alpha = .2)
p
fname = paste0(figFolder,"/pennStationWeek1071-1074.png")
ggsave(filename=fname,plot=p, units="in", width=11, height = 6)
cat(fname)

## Look at Variation for particular times of week across multiple weeks
## Box plots
a = cnts[gridid == sgc[["PennStation"]]][wkhr < 72]
a = a[CJ(gridid=gridid, week=week, wkhr=0:71, unique=TRUE), on=c("gridid", "week", "wkhr")]
a[is.na(cnt), cnt:=0]

a[, Week := as.factor(week)]
p = ggplot(a, aes(factor(wkhr),cnt))
p = p + xlab("Week Hour (0 = Sunday 00:00-00:59)")
p = p + ylab("Taxi Pickups (Per Hour)")
p = p + labs(title = "Taxi Pickups by Week-Hour (Sunday - Tuesday, 27 Weeks)")
p = p + geom_boxplot()
p = p + geom_vline(xintercept = 1+(0:3)*24, colour="red", linetype = "longdash")
p = p + annotate("text", x = 13+(0:2)*24, y = 155, label = c('Sun','Mon','Tues'),color="blue")
fname = paste0(figFolder,"/pennStationWeek-72Hrs-AllWeeks.png")
ggsave(filename=fname,plot=p, units="in", width=18, height = 12)
cat(fname)
p

## Plot all weeks by week hour
a = cnts[gridid == sgc[["PennStation"]]]
a = a[CJ(gridid=gridid, week=week, wkhr=0:167, unique=TRUE), on=c("gridid", "week", "wkhr")]
a[is.na(cnt), cnt:=0]

a[, Week := as.factor(week)]
p = ggplot(a, aes(wkhr,cnt))
p = p + xlab("Week Hour (0 = Sunday 00:00-00:59)")
p = p + ylab("Taxi Pickups (Per Hour)")
p = p + labs(title = "Penn Station Taxi Pickups, by Hour-of-Week (27 Weeks)")
p = p + annotate("text", x = 13+(0:6)*24, y = 155, label = c('Sun','Mon','Tues','Wed','Thurs','Fri','Sat'),color=BBGblue)
p = p + geom_vline(xintercept = (0:7)*24, colour="slategrey", linetype = "longdash")
p = p + geom_point(size=.5, col="grey44")
p
fname = paste0(figFolder,"/pennStation27Weeks.png")
ggsave(filename=fname,plot=p, units="in", width=10, height = 4.5)
cat(fname)
## Run loess smooths
library(msir)
l <- loess.sd(a[,wkhr],a[,cnt], nsigma=1, span=.1)
p = p + geom_line(aes(x=l$x, y=l$y), col="deeppink3", size=1)
fname = paste0(figFolder,"/pennStation27Weeks-pred.png")
ggsave(filename=fname,plot=p, units="in", width=8.5, height = 3.5 )
cat(fname)
p = p + geom_line(aes(x=l$x, y=l$lower), col="deeppink3", size=.6)
p = p + geom_line(aes(x=l$x, y=l$upper), col="deeppink3", size=.6)
p
fname = paste0(figFolder,"/pennStation27Weeks-pred-interval.png")
ggsave(filename=fname,plot=p, units="in", width=10, height = 4.5)
cat(fname)

## 
ll = as.data.table(l)[,.SD[1,list(y,sd,upper,lower)],by=x]
ll[x==10]
library(MASS)



## Drill in to see the shape of the distributions
## Penn Station, Monday 7pm-8pm
a = cnts[J(sgc[["PennStation"]])][wkhr==43]
a = cnts[gridid == sgc[["PennStation"]]][wkhr==43]
## Here we impute the zeros
a = a[CJ(gridid=gridid, week=week, wkhr=43, unique=TRUE), on=c("gridid","week","wkhr")]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(x=cnt, y=..density..))
p = p + xlab("Number of Pickups Per Hour")
p = p + labs(title="Penn Station, Monday 7pm-8pm, 27 Weeks")
##p = p + geom_histogram(binwidth=5,color = "cornsilk", fill = "darkblue")
p = p + geom_histogram(binwidth=8,color = "cornsilk", fill = "darkblue")
p

## Aggregate across week days
## Mon-Fri 7pm-8pm
monFri7pm=c(19 + 24 * c(1:5))
a =  cnts[J(sgc[["PennStation"]])][wkhr %in% c(monFri7pm) ]
all = a[, CJ(gridid=unique(gridid), week=weeks, wkhr=monFri7pm)]
a = a[all]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(x=cnt, y=..density..))
p = p + xlab("Number of Pickups in Hour")
p = p + labs(title="Taxi Pickups, Mon-Fri 7pm-8pm, 27 Weeks (135 Obs)")
p = p + geom_histogram(binwidth=7,color = "cornsilk", fill = "darkblue")
p + geom_density(color = "purple")

## Aggregate acros week days and 2 hours
## Mon-Fri 6pm-8pm
monFri7pm=c(19 + 24 * c(1:5))
wkhrs = c((monFri7pm-1),monFri7pm)
a =  cnts[J(sgc[["PennStation"]])][wkhr %in% wkhrs ]
all = a[, CJ(gridid=unique(gridid), week=weeks, wkhr=wkhrs)]
a = a[all]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(x=cnt, y=..density..))
p = p + xlab("Number of Pickups in Hour")
p = p + labs(title="Taxi Pickups, Mon-Fri 6pm-8pm, 27 Weeks (270 Obs)")
p = p + geom_histogram(binwidth=5,color = "cornsilk", fill = "darkblue")
p + geom_density(color = "purple")


#### COURANT PLOTS
## Fill in 0's

## Week 1075
a = cnts[J(sgc[["CourantInstitute"]],c(1075))]
all = a[, CJ(gridid=unique(gridid), week=unique(week), wkhr=0:167)]
a = a[all, on=c('gridid', 'week', 'wkhr')]
a[is.na(cnt), cnt:=0]

p = ggplot(a, aes(wkhr,cnt))
p = p + xlab("Week-Hour")
p = p + ylab("Taxi Pickups (Per Hour)")
p = p + labs(title = "Taxi Pickups by Week-Hour (Week 1075)")
p = p + geom_line(alpha=.3) + geom_point(size=2)
p = p + geom_vline(xintercept = (0:7)*24, colour="red", linetype = "longdash")
p = p + annotate("text", x = 12+(0:6)*24, y = 2.1, label = c('Sun','Mon','Tues','Wed','Thurs','Fri','Sat'),color="blue")
fname = paste0(figFolder,"/courant-Week1075.png")
ggsave(filename=fname,plot=p, units="in", width=11, height = 6)
cat(fname)
p

## Box plots
a = cnts[J(sgc[["CourantInstitute"]])][wkhr<72]
all = a[, CJ(gridid=unique(gridid), week=unique(week), wkhr=0:71)]
a = a[all]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(factor(wkhr),cnt))
p = p + xlab("Week-Hour")
p = p + ylab("Taxi Pickups (Per Hour)")
p = p + labs(title = "Taxi Pickups by Week-Hour (Sunday - Tuesday, 28 Weeks)")
p = p + geom_boxplot()
p = p + geom_vline(xintercept = 1+(0:3)*24, colour="red", linetype = "longdash")
p = p + annotate("text", x = 13+(0:2)*24, y = 5, label = c('Sun','Mon','Tues'),color="blue")
fname = paste0(figFolder,"/CourantInstitute-72Hrs-AllWeeks.png")
ggsave(filename=fname,plot=p, units="in", width=18, height = 12)
cat(fname)
p

## DRill in for distribution shapes

## Histograms for Courant
a =  cnts[J(sgc[["CourantInstitute"]])][wkhr==43]
all = a[, CJ(gridid=unique(gridid), week=weeks, wkhr=43)]
a = a[all]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(x=cnt, y=..density..))
p = p + xlab("Number of Pickups in Hour")
p = p + labs(title="Taxi Pickups, Monday 7pm-8pm, 27 Weeks")
##p = p + geom_histogram(binwidth=5,color = "cornsilk", fill = "darkblue")
p = p + geom_histogram(binwidth=1,color = "cornsilk", fill = "darkblue")
p

## Mon-Fri 7pm-8pm
monFri7pm=c(19 + 24 * c(1:5))
a =  cnts[J(sgc[["CourantInstitute"]])][wkhr %in% c(monFri7pm) ]
all = a[, CJ(gridid=unique(gridid), week=weeks, wkhr=monFri7pm)]
a = a[all]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(x=cnt, y=..density..))
p = p + xlab("Number of Pickups in Hour")
p = p + labs(title="Taxi Pickups, Mon-Fri 7pm-8pm, 27 Weeks")
p = p + geom_histogram(binwidth=1,color = "cornsilk", fill = "darkblue")
p

## Mon-Fri 6pm-8pm
monFri7pm=c(19 + 24 * c(1:5))
wkhrs = c((monFri7pm-1),monFri7pm)
a =  cnts[J(sgc[["CourantInstitute"]])][wkhr %in% wkhrs ]
all = a[, CJ(gridid=unique(gridid), week=weeks, wkhr=wkhrs)]
a = a[all]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(x=cnt, y=..density..))
p = p + xlab("Number of Pickups in Hour")
p = p + labs(title="Taxi Pickups, Mon-Fri 6pm-8pm, 27 Weeks")
p = p + geom_histogram(binwidth=1,color = "cornsilk", fill = "darkblue")
p
