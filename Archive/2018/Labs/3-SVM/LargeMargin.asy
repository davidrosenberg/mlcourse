import graph;
import plain;
srand(1);
size(12cm);
real d = .3;
real Mx = -100, mx = 100;
void plus(real x, real y) { Mx = max(Mx,x); mx = min(mx,x);
  draw( (x-d,y)--(x+d,y), p=blue+1 ); draw( (x,y-d)--(x,y+d), p=blue+1 ); }
void minus(real x, real y) { Mx = max(Mx,x); mx = min(mx,x); draw( (x-d,y)--(x+d,y), p=red+1 ); }
plus(1,3); plus(4.5,1); plus(1.5,6); plus(2,4.5); plus(3,3.75); plus(3,6); plus(4.5,5.5); plus(6,8);
minus(5.2,2); minus(8,1.7); minus(8.5,3.3); minus(10,1.5); minus(11,2.5); minus(11.2,4);
typedef real func(real);
func fmake(real m, pair u) { return new real(real x) { return m*(x-u.x)+u.y; }; }
//pair w = (-538.0180,95.9613);
pair w = (-.4617,.1800);
//real a = 2492.7;
real a = 2.3304;
draw((-a/w.x,0)--(-a/w.x,0)+3.3*(1,-w.x/w.y),green+2+opacity(.5));
draw(((-a-1)/w.x,0)--((-a-1)/w.x,0)+3.3*(1,-w.x/w.y),green+1+opacity(.5)+dashed);
draw(((-a+1)/w.x,0)--((-a+1)/w.x,0)+3.3*(1,-w.x/w.y),green+1+opacity(.5)+dashed);
label("Large margin",(7.8,1),E);
//draw(graph(fmake(-w.x/w.y,a/w.y),3.8,5));
xaxis(xmax=Mx,EndArrow);
yaxis(EndArrow);
