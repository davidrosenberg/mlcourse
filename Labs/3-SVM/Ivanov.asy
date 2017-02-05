import graph;
import plain;
srand(1);
size(12cm);
pair w = (1,2), v = w/length(w)^2;
real a = -4;
real d = .3;
void plus(real x, real y) { draw( (x-d,y)--(x+d,y), p=blue+1 ); draw( (x,y-d)--(x,y+d), p=blue+1 ); }
void minus(real x, real y) { draw( (x-d,y)--(x+d,y), p=red+1 ); }
typedef real func(real);
func fmake(real m, pair u) { return new real(real x) { return m*(x-u.x)+u.y; }; }
real mx=100,Mx=-100,my=100,My=-100;
for (int i = 0; i < 50; ++i) {
    real x = unitrand()*20-10, y = unitrand()*20-10;
    mx = min(x,mx); Mx = max(x,Mx); my = min(y,my); My = max(y,My);
    real v = dot(w,(x,y))+a;
    if (v >= length(w)) plus(x,y);
    else if (v <= -length(w)) minus(x,y);
}
++Mx;
minus(-5.25,3);
pair[] ws = {w,w-(3,0),w-(1,0)};
real[] rs = {8.7,30,7};
real[] bs = {-1.9,-1.25,-2};
for (int i = 0; i < 2; ++i) {
  w = ws[i];
  real r = rs[i], b = bs[i];
  func f = fmake(-w.x/w.y,b*a*v);
  func f1 = fmake(-w.x/w.y,(b*a+r)*v);
  func f2 = fmake(-w.x/w.y,(b*a-r)*v);
  draw(graph(f,mx,Mx),p=green+1+opacity(.5));
  draw(graph(f1,mx,Mx),p=green+dashed+1+opacity(.5));
  draw(graph(f2,mx,Mx),p=green+dashed+1+opacity(.5));
}

xaxis(xmax=Mx,EndArrow);
yaxis(EndArrow);
