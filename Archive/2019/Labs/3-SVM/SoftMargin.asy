import graph;
import plain;
srand(1);
size(14cm);
defaultpen(fontsize(8));
pair w = (1,2), v = w/length(w)^2;
real a = -4;
real d = .3;
void plus(real x, real y) { draw( (x-d,y)--(x+d,y), p=blue+1 ); draw( (x,y-d)--(x,y+d), p=blue+1 ); }
void minus(real x, real y) { draw( (x-d,y)--(x+d,y), p=red+1 ); }
typedef real func(real);
func fmake(real m, pair u) { return new real(real x) { return m*(x-u.x)+u.y; }; }
real mx = -10, Mx = 10;
func f = fmake(-w.x/w.y,-a*v);
func f1 = fmake(-w.x/w.y,(-a+6)*v);
func f2 = fmake(-w.x/w.y,(-a-6)*v);
draw(graph(f,mx,Mx),p=green+1+opacity(.5));
draw(graph(f1,mx,Mx),p=green+1+opacity(.5));
draw(graph(f2,mx,Mx),p=green+1+opacity(.5));
//w.((x,y)+v*t) = 6-a => w.(x,y)=6-a-t => t = 6-a-w.(x,y)
pair p1 = (-4,2.5), p2 = (-3,-2.5);
plus(p1.x,p1.y); plus(p2.x,p2.y);
label("$\xi_i=1.5$",p1-d,W);
label("$\xi_i=3$",p2-d,W);
plus(-5,7.5); plus(4,3); plus(-1,8); plus(4,8); plus(5.5,6.5);
draw(p1--(6-a-dot(w,p1))*v+p1,p=purple+1+dashed);
draw(p2--(6-a-dot(w,p2))*v+p2,p=purple+1+dashed);
pair m1 = (2.5,2.25), m2 = (6,2);
minus(m1.x,m1.y); minus(m2.x,m2.y);
label("$\xi_i=1.5$",m1-d,W);
label("$\xi_i=2$",m2+d,E);
minus(-7,2.5); minus(7,-4.5); minus(-7,-4); minus(1,-3); minus(-9,-2);
draw(m1--(-6-a-dot(w,m1))*v+m1,p=purple+1+dashed);
draw(m2--(-6-a-dot(w,m2))*v+m2,p=purple+1+dashed);
xaxis(xmax=Mx,EndArrow);
yaxis(EndArrow);
