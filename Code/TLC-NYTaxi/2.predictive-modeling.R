## Drill in to week hour 10
## Join in missing 0's
a = cnts[gridid == sgc[["PennStation"]]]
a = a[CJ(gridid=gridid, week=week, wkhr=10, unique=TRUE), on=c("gridid", "week", "wkhr")]
a[is.na(cnt), cnt:=0]

## Fit negative binomial distribution to counts
negBinomCoeffFits = as.list(coef(fitdistr(a[,cnt],"negative binomial")))

## Plot fitted distribution
x = 0:100
y = do.call(dnbinom, c(list(x=x), negBinomCoeffFits))
p = stem.ggplot(x,y, linecol=BBGblue)
p = p + xlab("Taxi Pickups")
p = p + ylab("Probability")
p = p + labs(title = "Predicted Distribution for Pickup Count (Penn Station, Week Hour = 10)")
p
fname = paste0(figFolder,"/pennStation-pred-dist-wkhr10.png")
ggsave(filename=fname,plot=p, units="in", width=10, height = 4.5)
cat(fname)

#####

d[, NegBinom := do.call(dnbinom,  c(list(x = d[,cnt]), as.list(coef(fitdistr(a[,cnt],"negative binomial")))))]

cntRange = a[,min(cnt)]:(a[,max(cnt)]+2)
setkey(a, cnt)
d = a[J(cntRange), list(empProb = .N/numCnts), by=.EACHI]
d[, Poisson := do.call(dpois, list(d[,cnt], coef(fitdistr(a[,cnt],"poisson"))))]
d[, NegBinom := do.call(dnbinom,  c(list(x = d[,cnt]), as.list(coef(fitdistr(a[,cnt],"negative binomial")))))]
dd = melt(d, id.vars="cnt")
p = ggplot(dd, aes(x=cnt,y=value, color=variable))
p = p + geom_point() + geom_line()


## Split weeks into train / test
weeks = cnts[, sort(unique(week))]
fracWeeksForTraining = 0.5
trainWeeks = weeks[1]:quantile(weeks,probs=fracWeeksForTraining)
testWeeks = setdiff(weeks,trainWeeks)


