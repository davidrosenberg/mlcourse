import graph;
import plain;
import contour;
size(12cm);
defaultpen(fontsize(12));
pair w = (1,3);
real f(real x) { return -w.x/w.y * (x-1.5*w.x) + 1.5*w.y; }
real xm = -5, xM = 5, yM = 10, ym=-2;
draw((0,0)--w,EndArrow(size=5),p=blue+1);
label("$w$",w,NE);
label("$w^Tv = 15$",(xm,f(xm)),NE);
filldraw((xm,f(xm))--(xM,f(xM))--(xM,yM)--(xm,yM)--cycle,fillpen=red+opacity(.5),drawpen=invisible);
filldraw((xm,f(xm))--(xM,f(xM))--(xM,ym)--(xm,ym)--cycle,fillpen=purple+opacity(.5),drawpen=invisible);
label("$w^Tv-15 > 0$",(2.5,8));
label("$w^Tv-15 < 0$",(-3,3));
draw(graph(f,xm,xM),p=green+3);
xaxis(xmin=xm,xmax=xM,EndArrow);
yaxis(ymin=ym,ymax=yM,EndArrow);
