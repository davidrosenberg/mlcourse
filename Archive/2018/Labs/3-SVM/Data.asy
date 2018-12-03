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
    real x = unitrand()*20-10, y = unitrand()*20-10;
    real v = dot(w,(x,y))+a;
    if (v >= length(w)) plus(x,y);
    else if (v <= -length(w)) minus(x,y);
}
minus(-5.25,3);
xaxis(EndArrow);
yaxis(EndArrow);
