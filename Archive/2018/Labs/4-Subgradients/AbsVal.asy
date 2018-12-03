import graph;
import plain;
size(12cm);
real f(real x) { return abs(x); }
real g2(real x) { return .25*(x-0)+f(0); }
real g3(real x) { return 0*(x-0)+f(0); }
real g4(real x) { return .5*(x-0)+f(0); }
draw(graph(g2,-7,7),green);
draw(graph(g4,-7,7),green);
draw(graph(f,-7,7),blue+1);
label("$f(x)=|x|$",(0,5),NE);
xaxis('$x$',red,EndArrow);
yaxis('$y$',red,EndArrow);
