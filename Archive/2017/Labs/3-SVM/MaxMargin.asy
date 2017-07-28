import graph;
import plain;
srand(1);
size(14cm);
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
func f = fmake(-w.x/w.y,-1.25*a*v);
func f1 = fmake(-w.x/w.y,(-1.25*a+4.3)*v);
func f2 = fmake(-w.x/w.y,(-1.25*a-4.3)*v);
draw(graph(f,mx,Mx),p=green+2+opacity(.5));
draw(graph(f1,mx,Mx),p=green+1+opacity(.5));
draw(graph(f2,mx,Mx),p=green+1+opacity(.5));
draw(((1,f(1))-v*4.3)--((1,f(1))+v*4.3),p=purple+1);
draw(brace(((1,f(1))+v*4.3),(1,f(1)),.5),p=purple);
draw(brace((1,f(1)),((1,f(1))-v*4.3),.5),p=purple);
label("$M$",(1,f(1))+v*2.65+(0,-.45),E);
label("$M$",(1,f(1))-v*2.65+(.25,0),E);
label("$\frac{w^Tv+a}{\|w\|_2} = -M$",(Mx,f2(Mx)-.5),E);
label("$\frac{w^Tv+a}{\|w\|_2} = 0$",(Mx,f(Mx)-.5),E);
label("$\frac{w^Tv+a}{\|w\|_2} = M$",(Mx,f1(Mx)-.5),E);
xaxis(xmax=Mx,EndArrow);
yaxis(EndArrow);
