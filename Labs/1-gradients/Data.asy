import graph;
import plain;
import stats;
srand(1);
size(8cm);
real m = 1/3, b = 0, d = .3;
void ex(real x, real y) { draw( (x-d,y-d)--(x+d,y+d), p=blue+1 ); draw( (x-d,y+d)--(x+d,y-d), p=blue+1 ); }

for (int i = 0; i < 50; ++i) {
  real x = unitrand()*40-20, y = b + m*x + 3*Gaussrand();
  ex(x,y);
}
xaxis("$x$",EndArrow);
yaxis("$y$",EndArrow);
