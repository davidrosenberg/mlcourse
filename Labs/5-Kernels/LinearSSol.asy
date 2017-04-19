import graph;
import plain;
srand(1);
size(8cm);
pair w = (1,2);
real a = -4;
real d = .3;
void plus(real x, real y) { draw( (x-d,y)--(x+d,y), p=blue+1 ); draw( (x,y-d)--(x,y+d), p=blue+1 ); }
void minus(real x, real y) { draw( (x-d,y)--(x+d,y), p=red+1 ); }

for (int i = 0; i < 50; ++i) {
  real a = unitrand()*2*pi, r = unitrand()*5;
  real a2 = unitrand()*2*pi, r2 = unitrand()*5+5;
  pair p1 = r*expi(a), p2 = r2*expi(a2);
  minus(p1.x+1.25,p1.y-1.25);
  plus(p2.x+1.25,p2.y-1.25);
}
draw(Circle((1.25,-1.25),5),green+2);
xaxis("$x_1$",EndArrow);
yaxis("$x_2$",EndArrow);
