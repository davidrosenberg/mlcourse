import graph;
import plain;
import contour;
defaultpen(fontsize(10));
size(15cm);
real f(real x, real y) { return abs(x)+2*abs(y); }
real g(real x, real y) { return (x-3)-(y-0); }
real[] c = new real[20];
for (int i = 0; i < 20; ++i) c[i]=12.0*(i+1)/8;
draw(contour(f,(-7,-5),(7,5),c),blue);
draw(contour(g,(-7,-5),(7,5),new real[]{0}),green+2);
draw((3,0)--(3+1,-1),p=green,EndArrow);
filldraw((-7,-5)--(-7,5)--(7,5)--(7,4)--(-2,-5)--cycle,purple+opacity(.5),invisible);
filldraw((7,4)--(7,-5)--(-2,-5)--cycle,magenta+opacity(.5),invisible);
xaxis("$x_1$",xmin=-8,xmax=8,EndArrow,p=red);
yaxis("$x_2$",ymin=-6,ymax=6,EndArrow,p=red);
//label("$f(x)=|x_1|+2|x_2|$",(-7,6),E);
//label("$v=(3,0),~x^*=(0,0)$",(-7,5.4),E);
//label("$g = (1,-1)^T\in\partial f(v)$",(7,6),W);
//label("$g^T(x^*-v)<0$",(7,5.4),W);
label("$g$",(3+1,-1),SE);
dot((0,0),p=black+3);
dot((3,0),p=black+3);
label("$x^*$",(0,0),NE);
label("$v$",(3.2,-.15),SW);
label("$f(y) \geq f(v)+g^T(y-v) > f(v)$",(4.5,-5.5));
label("$g^T(y-v) < 0$",(-4,5.75));
