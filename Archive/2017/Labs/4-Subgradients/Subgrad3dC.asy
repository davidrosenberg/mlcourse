import graph;
import plain;
import contour;
size(15cm);
real f(real x, real y) { return abs(x)+2*abs(y); }
real g(real x, real y) { return 3*(x-3)+(y-0); }
real[] c = new real[20];
for (int i = 0; i < 20; ++i) c[i]=12.0*(i+1)/8;
draw(contour(f,(-7,-5),(7,5),c),blue);
//draw(contour(g,(-7,-5),(7,5),new real[]{0}),green);
for (int i = 0; i <= 20; ++i) {
  draw((3,0)--(3+1,2-i/5),p=green,EndArrow);
}
xaxis("$x_1$",xmin = -8,xmax=8,EndArrow,p=red);
yaxis("$x_2$",ymin=-6,ymax=6,EndArrow,p=red);
//label("$f(x)=|x_1|+2|x_2|$",(-7,6),E);
//label("$v=(3,0),~x^*=(0,0)$",(-7,5.4),E);
dot((0,0),p=black+3);
dot((3,0),p=black+3);
//label("$x^*$",(0,0),NE);
label("$v$",(3.2,-.15),SW);
//label("$f(x)=|x_1|+2|x_2|$",(-7,6),E);
label("$\partial f(3,0)=\{(1,b)^T\mid b\in[-2,2]\}$",(7,7),W);
