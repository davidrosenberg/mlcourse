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

## Create hypothetical conditional probability distribution for number of taxicab pickups at a particular place in a particular one-hour time interval
x = 0:100
y = dpois(x, lambda=40, log=FALSE)
y = dnbinom(x, size=8.54, mu=27.48, log=FALSE)
p = stem.ggplot(x,y, linecol=BBGblue)
p = p + xlab("Taxi Pickups (in hour)")
p = p + ylab("Probability")
p = p + labs(title = "Predicted Probability Distribution for Taxi Pickup Count ()")
p
