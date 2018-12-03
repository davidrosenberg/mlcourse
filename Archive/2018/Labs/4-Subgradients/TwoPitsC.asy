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
guide[][] cg = contour(f,(-2,-2),(5,3),new real[]{-1});
draw(cg,p=black+2);
fill(cg,interior(cg,array(cg.length+1,green)));
label("$f(x)\leq -1$",(3.5,2.5));
draw((3.25,2.25)--(0,0),red,EndArrow);
draw((3.25,2.25)--(1.5,1.5),red,EndArrow);
draw((3.25,2.25)--(3,0),red,EndArrow);

