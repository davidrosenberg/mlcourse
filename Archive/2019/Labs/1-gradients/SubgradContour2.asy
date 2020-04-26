import graph;
import plain;
import contour;
size(14cm);
real f(real x, real y) { return abs(x)+2*abs(y); }
real g(real x, real y) { return 3*(x-3)+(y-0); }
real[] c = new real[20];
for (int i = 0; i < 20; ++i) c[i]=12.0*(i+1)/8;
draw(contour(f,(-7,-5),(7,5),c),blue);
draw(contour(g,(-7,-5),(7,5),new real[]{0}),green+2);
draw((3,0)--(3*2,1),p=green,EndArrow);
filldraw((-7,-5)--(-7,5)--(4/3.0,5)--(3+5/3.0,-5)--cycle,purple+opacity(.25),invisible);
xaxis("$x_1$",xmin=-8,xmax=8,EndArrow,p=red);
yaxis("$x_2$",ymin=-6,ymax=6,EndArrow,p=red);
label("$f(x)=|x_1|+2|x_2|$",(-7,6),E);
label("$x_0=(3,0),~x^*=(0,0)$",(-7,5.4),E);
label("$g = (3,1)^T\in\partial f(x_0)$",(7,6),W);
label("$g^T(x^*-x_0)<0$",(7,5.4),W);
label("$g$",(6,1),E);
dot((0,0),p=black+3);
dot((3,0),p=black+3);
label("$x^*$",(0,0),NE);
label("$x_0$",(3.2,-.15),SW);