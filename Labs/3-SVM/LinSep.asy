import graph;
import plain;
srand(1);
size(8cm);
pair w = (1,2), v = (w+(.4,0))/length(w)^2*3;
real a = -4;
real d = .3;
void plus(real x, real y) { draw( (x-d,y)--(x+d,y), p=blue+1 ); draw( (x,y-d)--(x,y+d), p=blue+1 ); }
void minus(real x, real y) { draw( (x-d,y)--(x+d,y), p=red+1 ); }
real f(real x) { return -v.x/v.y*(x-v.x)+v.y; }
real mx=100,Mx=-100,my=100,My=-100;
for (int i = 0; i < 50; ++i) {
    real x = unitrand()*20-10, y = unitrand()*20-10;
    mx = min(x,mx); Mx = max(x,Mx); my = min(y,my); My = max(y,My);
    real v = dot(w,(x,y))+a;
    if (v >= length(w)) plus(x,y);
    else if (v <= -length(w)) minus(x,y);
}
minus(-5.25,3);
draw(graph(f,mx,Mx),p = green+2);
xaxis(EndArrow);
yaxis(EndArrow);
