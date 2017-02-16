import graph;
import plain;
size(12cm);
real f(real x) { return x^2/5+1; }
real g(real x) { return 2*(1.5)/5*(x-1.5)+(1.5)^2/5+1; }
draw(graph(f,-3,3),blue+1);
draw(graph(g,-2,3),green+1);
xaxis('$x$',xmin=-3.5,xmax=3.5,red,EndArrow);
yaxis('$y$',XEquals(0),ymin=-1,ymax=3,red,EndArrow);
label("$x_0$",(1.5,0),S);
draw((1.5,0)--(1.5,f(1.5)),dashed);
label("$f(x_0) + f'(x)(x-x_0)$",(-2,g(-2)),W);
