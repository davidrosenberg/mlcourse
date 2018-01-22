library(plyr)
http://www.rforscience.com/rpackages/visualisation/plot3d/
http://www.rforscience.com/rpackages/visualisation/oceanview/

beale <- function(xx)
{
  ##########################################################################
  #
  # BEALE FUNCTION
  #
  # Authors: Sonja Surjanovic, Simon Fraser University
  #          Derek Bingham, Simon Fraser University
  # Questions/Comments: Please email Derek Bingham at dbingham@stat.sfu.ca.
  #
  # Copyright 2013. Derek Bingham, Simon Fraser University.
  #
  # THERE IS NO WARRANTY, EXPRESS OR IMPLIED. WE DO NOT ASSUME ANY LIABILITY
  # FOR THE USE OF THIS SOFTWARE.  If software is modified to produce
  # derivative works, such modified software should be clearly marked.
  # Additionally, this program is free software; you can redistribute it
  # and/or modify it under the terms of the GNU General Public License as
  # published by the Free Software Foundation; version 2.0 of the License.
  # Accordingly, this program is distributed in the hope that it will be
  # useful, but WITHOUT ANY WARRANTY; without even the implied warranty
  # of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  # General Public License for more details.
  #
  # For function details and reference information, see:
  # http://www.sfu.ca/~ssurjano/
  #
  ##########################################################################
  #
  # INPUT:
  #
  # xx = c(x1, x2)
  #
  ##########################################################################

  x1 <- xx[1]
  x2 <- xx[2]

  term1 <- (1.5 - x1 + x1*x2)^2
  term2 <- (2.25 - x1 + x1*x2^2)^2
  term3 <- (2.625 - x1 + x1*x2^3)^2

  y <- term1 + term2 + term3
  return(y)
}

f <- function(xx) {
#    return(xx[1]+xx[2])
2
}
ff <- function(xxx,yyy) {
    return(f(c(xxx,yyy)))
}
x
y
outer(x,y, "*")
f(c(3,2))
log

"
ff
ff
f
y
x
ff(3,4)
numPts = 4
x <- seq(-4.5 , 4.5, length.out=numPts)
y <- x
(M <- mesh(x, y))
aaply(mesh(x,y), 3, print)

## 2-D mesh


## calculate with this mesh
V <- with(M, x/2 * sin(y))

     # same as:
V2 <- outer(x, y, FUN = function(x, y) beale(c(x,y)

x = lin-4.5, 4.5


# save plotting parameters
 pm <- par("mfrow")

## =======================================================================
## Ribbon, persp, color keys, facets
## =======================================================================



 par(mfrow = c(2, 2))
# simple, no scaling, use breaks to set colors
 persp3D(z = volcano, main = "volcano", clab = c("height", "m"),
   breaks = seq(80,200, by = 10))

# keep ratios between x- and y (scale = FALSE)
# change ratio between x- and z (expand)
 persp3D(z = volcano, x = 1: nrow(volcano), y = 1:ncol(volcano),
       expand = 0.3, main = "volcano", facets = FALSE, scale = FALSE,
       clab = "height, m", colkey = list(side = 1, length = 0.5))

# ribbon, in x--direction
 V <- volcano[, seq(1, ncol(volcano), by = 3)]  # lower resolution
 ribbon3D(z = V, colkey = list(width = 0.5, length = 0.5,
          cex.axis = 0.8, side = 2), clab = "m")

# ribbon, in y-direction
 Vy <- volcano[seq(1, nrow(volcano), by = 3), ]
 ribbon3D(z = Vy, expand = 0.3, space = 0.3, along = "y",
          colkey = list(width = 0.5, length = 0.5, cex.axis = 0.8))

## =======================================================================
## Several ways to visualise 3-D data
## =======================================================================

 x <- seq(-pi, pi, by = 0.2)
 y <- seq(-pi, pi, by = 0.3)
 grid <- mesh(x, y)

 z    <- with(grid, cos(x) * sin(y))

 par(mfrow = c(2,2))

 persp3D(z = z, x = x, y = y)

 persp3D(z = z, x = x, y = y, facets = FALSE, curtain = TRUE)

# ribbons in two directions and larger spaces
 ribbon3D(z = z, x = x, y = y, along = "xy", space = 0.3)

 hist3D(z = z, x = x, y = y, border = "black")

## =======================================================================
## Contours and images added
## =======================================================================

 par(mfrow = c(2, 2))
 x <- seq(1, nrow(volcano), by = 3)
 y <- seq(1, ncol(volcano), by = 3)

 Volcano <- volcano [x, y]
 ribbon3D(z = Volcano, contour = TRUE, zlim= c(-100, 200),
          image = TRUE)

 persp3D(z = Volcano, contour = TRUE, zlim= c(-200, 200), image = FALSE)

 persp3D(z = Volcano, x = x, y = y, scale = FALSE,
       contour = list(nlevels = 20, col = "red"),
       zlim = c(-200, 200), expand = 0.2,
       image = list(col = grey (seq(0, 1, length.out = 100))))

 persp3D(z = Volcano, contour = list(side = c("zmin", "z", "350")),
       zlim = c(-100, 400), phi = 20, image = list(side = 350))

## =======================================================================
## Use of inttype
## =======================================================================

 par(mfrow = c(2, 2))
 persp3D(z = Volcano, shade = 0.5, colkey = FALSE)
 persp3D(z = Volcano, inttype = 2, shade = 0.5, colkey = FALSE)

 x <- y <- seq(0, 2*pi, length.out = 10)
 z <- with (mesh(x, y), cos(x) *sin(y)) + runif(100)
 cv <- matrix(nrow = 10, 0.5*runif(100))
 persp3D(x, y, z, colvar = cv)              # takes averages of z
 persp3D(x, y, z, colvar = cv, inttype = 2) # takes averages of colvar

## =======================================================================
## Use of inttype with NAs
## =======================================================================

 par(mfrow = c(2, 2))
 VV <- V2 <- volcano[10:15, 10:15]
 V2[3:4, 3:4] <- NA
 V2[4, 5] <- NA

 image2D(V2, border = "black")  # shows true NA region

# averages of V2, including NAs, NA region larger
 persp3D(z = VV, colvar = V2, inttype = 1, theta = 0,
       phi = 20, border = "black", main = "inttype = 1")

# extension of VV; NAs unaffected
 persp3D(z = VV, colvar = V2, inttype = 2, theta = 0,
       phi = 20, border = "black", main = "inttype = 2")

# average of V2, ignoring NA; NA region smaller
 persp3D(z = VV, colvar = V2, inttype = 3, theta = 0,
       phi = 20, border = "black", main = "inttype = 3")

## =======================================================================
## Use of panel.first
## =======================================================================

 par(mfrow = c(1, 1))

# A function that is called after the axes were drawn
 panelfirst <- function(trans) {
    zticks <- seq(100, 180, by = 20)
    len <- length(zticks)
    XY0 <- trans3D(x = rep(1, len), y = rep(1, len), z = zticks,
                   pmat = trans)
    XY1 <- trans3D(x = rep(1, len), y = rep(61, len), z = zticks,
                   pmat = trans)
    segments(XY0$x, XY0$y, XY1$x, XY1$y, lty = 2)

    rm <- rowMeans(volcano)
    XY <- trans3D(x = 1:87, y = rep(ncol(volcano), 87),
                  z = rm, pmat = trans)
    lines(XY, col = "blue", lwd = 2)
 }
 persp3D(z = volcano, x = 1:87, y = 1: 61, scale = FALSE, theta = 10,
       expand = 0.2, panel.first = panelfirst, colkey = FALSE)

## =======================================================================
## with / without colvar / facets
## =======================================================================

 par(mfrow = c(2, 2))
 persp3D(z = volcano, shade = 0.3, col = gg.col(100))

# shiny colors - set lphi for more brightness
 persp3D(z = volcano, lighting = TRUE, lphi = 90)

 persp3D(z = volcano, col = "lightblue", colvar = NULL,
   shade = 0.3, bty = "b2")

# this also works:
#  persp3D(z = volcano, col = "grey", shade = 0.3)

# tilted x- and y-coordinates of 'volcano'
 volcx <- matrix(nrow = 87, ncol = 61, data = 1:87)
 volcx <- volcx + matrix(nrow = 87, ncol = 61,
        byrow = TRUE, data = seq(0., 15, length.out = 61))

 volcy <- matrix(ncol = 87, nrow = 61, data = 1:61)
 volcy <- t(volcy + matrix(ncol = 87, nrow = 61,
        byrow = TRUE, data = seq(0., 15, length.out = 87)))

 persp3D(volcano, x = volcx, y = volcy, phi = 80)

## =======================================================================
## Several persps on one plot
## =======================================================================

 par(mfrow = c(1, 1))
 clim <- range(volcano)
 persp3D(z = volcano, zlim = c(100, 600), clim = clim,
   box = FALSE, plot = FALSE)

 persp3D(z = volcano + 200, clim = clim, colvar = volcano,
       add = TRUE, colkey = FALSE, plot = FALSE)

 persp3D(z = volcano + 400, clim = clim, colvar = volcano,
       add = TRUE, colkey = FALSE)    # plot = TRUE by default

## =======================================================================
## hist3D
## =======================================================================

 par(mfrow = c(2, 2))
 VV   <- volcano[seq(1, 87, 15), seq(1, 61, 15)]
 hist3D(z = VV, scale = FALSE, expand = 0.01, border = "black")

# transparent colors
 hist3D(z = VV, scale = FALSE, expand = 0.01,
   alpha = 0.5, opaque.top = TRUE, border = "black")

 hist3D(z = VV, scale = FALSE, expand = 0.01, facets = FALSE, lwd = 2)

 hist3D(z = VV, scale = FALSE, expand = 0.01, facets = NA)

## =======================================================================
## hist3D and ribbon3D with greyish background, rotated, rescaled,...
## =======================================================================

 par(mfrow = c(2, 2))
 hist3D(z = VV, scale = FALSE, expand = 0.01, bty = "g", phi = 20,
        col = "#0072B2", border = "black", shade = 0.2, ltheta = 90,
        space = 0.3, ticktype = "detailed", d = 2)

# extending the ranges
 plotdev(xlim = c(-0.2, 1.2), ylim = c(-0.2, 1.2), theta = 45)

 ribbon3D(z = VV, scale = FALSE, expand = 0.01, bty = "g", phi = 20,
        col = "lightblue", border = "black", shade = 0.2, ltheta = 90,
        space = 0.3, ticktype = "detailed", d = 2, curtain = TRUE)

 ribbon3D(z = VV, scale = FALSE, expand = 0.01, bty = "g", phi = 20, zlim = c(95,183),
        col = "lightblue", lighting = TRUE, ltheta = 50, along = "y",
        space = 0.7, ticktype = "detailed", d = 2, curtain = TRUE)

## =======================================================================
## hist3D for a 1-D data set
## =======================================================================

 par(mfrow = c(2, 1))
 x <- rchisq(1000, df = 4)
 hs <- hist(x, breaks = 15)

 hist3D(x = hs$mids, y = 1, z = matrix(ncol = 1, data = hs$density),
  bty = "g", ylim = c(0., 2.0), scale = FALSE, expand = 20,
  border = "black", col = "white", shade = 0.3, space = 0.1,
  theta = 20, phi = 20, main = "3-D perspective")


# reset plotting parameters
 par(mfrow = pm)



library(plot3D)

  persp3D(z = Hypsometry$z[ii,jj], add = TRUE, resfac = 2,
        contour = list(col = "grey", side = c("zmin", "z")),
        zlim = zlim, clab = "depth, m",
       colkey = list(side = 1, length = 0.5, dist = -0.1))


image2D(volcano, shade = 0.2, rasterImage = TRUE, main = "volcano",
    contour = list(col = "white", labcex = 0.8, lwd = 3, alpha = 0.5),
    colkey = list(length = 0.5, width = 0.5)  )

volcano
?plot3D
      example(surf3D)
