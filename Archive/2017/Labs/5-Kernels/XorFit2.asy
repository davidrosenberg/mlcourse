import graph;
import plain;
import contour;
size(8cm);
pair w = (1,2);
real a = -4;
real d = .3;
void plus(real x, real y) { draw( (x-d,y)--(x+d,y), p=blue+2 ); draw( (x,y-d)--(x,y+d), p=blue+2 ); }
void minus(real x, real y) { draw( (x-d,y)--(x+d,y), p=red+2 ); }

real k(pair p,pair q) { return exp(-length(p-q)^2/2); }
real f(pair p) { return k((-1,1),p)+k((1,-1),p); }
real f2(pair p) { return k((-1,1),p)+k((1,-1),p)-(k((1,1),p)+k((-1,-1),p)); }

guide[][] cg = contour(f2,(-3,-3),(3,3),new real[]{.7});
draw(cg,p=black+2);
fill(cg,interior(cg,array(cg.length+1,green)));

plus(-1,1); plus(1,-1);
minus(-1,-1); minus(1,1);
real k(pair p,pair q) { return exp(-length(p-q)^2/2); }
real f(pair p) { return k((-1,1),p)+k((1,-1),p); }
real f2(pair p) { return k((-1,1),p)+k((1,-1),p)-(k((1,1),p)+k((-1,-1),p)); }
real[] c = uniform(-1,1,20);
draw(contour(f2,(-3,-3),(3,3),c));
xaxis("$x_1$",EndArrow);
yaxis("$x_2$",EndArrow);
