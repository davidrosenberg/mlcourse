#### Distribution Fits
### Penn Station
## Monday 7pm-8pm
a =  cnts[J(sgc[["PennStation"]])][wkhr==43]
all = a[, CJ(gridid=unique(gridid), week=trainWeeks, wkhr=43)]
a = a[all]
a[is.na(cnt), cnt:=0]
p = ggplot(a, aes(x=cnt, y=..density..))
p = p + xlab("Number of Pickups Per Hour")
p = p + labs(title="Penn Station, Monday 7pm-8pm, 14 Weeks (14 Obs)")
##p = p + geom_histogram(binwidth=5,color = "cornsilk", fill = "darkblue")
p = p + geom_histogram(binwidth=8,color = "cornsilk", fill = "darkblue")
p
##p + geom_density(color = "purple")

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
p
p + geom_density(color = "purple")

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
p
p + geom_density(color = "purple")

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

## Courant Mon-Fri 6pm-8pm
monFri7pm=c(19 + 24 * c(1:5))
wkhrs = c((monFri7pm-1),monFri7pm)
a =  cnts[J(sgc[["CourantInstitute"]])][wkhr %in% wkhrs ]
all = a[, CJ(gridid=unique(gridid), week=weeks, wkhr=wkhrs)]
a = a[all]
a[is.na(cnt), cnt:=0]

cntRange = a[,min(cnt)]:(a[,max(cnt)]+2)
setkey(a, cnt)
d = a[J(cntRange), list(empProb = .N/numCnts), by=.EACHI]
d[, Poisson := do.call(dpois, list(d[,cnt], coef(fitdistr(a[,cnt],"poisson"))))]
d[, NegBinom := do.call(dnbinom,  c(list(x = d[,cnt]), as.list(coef(fitdistr(a[,cnt],"negative binomial")))))]
dd = melt(d, id.vars="cnt")
p = ggplot(dd, aes(x=cnt,y=value, color=variable))
p = p + geom_point() + geom_line()
p = p + scale_colour_discrete(name="", breaks=c("empProb","Poisson", "NegBinom"), labels=c("Empirical Probability","Poisson Fit", "Negtive Binomial Fit"))
p = p + theme(legend.title=element_blank())
p = p + theme(legend.justification=c(1,1), legend.position=c(1,1))
p
p = p + geom_segment(data=dd[variable=="empProb"],aes(x=cnt, xend = cnt, y=0,yend = value),col = 'red',size = 3)  # vertical lines



### USE points to get all the points and the legend up there, then draw the lines second, manually.
