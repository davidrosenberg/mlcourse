import graph;
import plain;
import contour;
size(12cm);
real f(pair p) {
  real x = p.x, y = p.y;
  return -exp(-(x^2+y^2)/.25)/.6 -exp(-((x-3)^2+(y)^2)/.25)/.6-exp(-((x-1.5)^2+(y-1.5)^2)/.25)/.6;
}
triple g(pair p) {
  real x = p.x, y = p.y;
  return (x,y,-exp(-(x^2+y^2)/.25)/.6 -exp(-((x-3)^2+(y)^2)/.25)/.6-exp(-((x-1.5)^2+(y-1.5)^2)/.25)/.6);
}
real[] c = uniform(-2,0,10);
draw(contour(f,(-2,-2),(5,3),c));
draw(contour(f,(-2,-2),(5,3),uniform(-.1,0,10)));
draw(contour(f,(-2,-2),(5,3),uniform(-.01,0,10)));
draw((2.015,2.015)--(3,3),green+1,EndArrow);
label("$\nabla f(x)$",(3,3),NE);
