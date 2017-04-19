import graph;
import plain;
size(12cm);
real r = 5;
real f(real x) { return abs(x-5)+abs(x+5)+abs(x)-13; }
real g1(real x) { return 1.5*(x-5)+f(5); }
real g2(real x) { return .25*(x-0)+f(0); }
real g3(real x) { return 0*(x-0)+f(0); }
real g4(real x) { return -.25*(x-0)+f(0); }
draw(graph(g1,0,7),green);
draw(graph(g2,-7,7),green);
draw(graph(g3,-7,7),green);
draw(graph(g4,-7,7),green);
draw(graph(f,-7,7,n=200),blue+1);

xaxis('$x$',red,EndArrow);
yaxis('$y$',XEquals(-1),red,EndArrow);
label('$x_0$',(0,0),N);
label('$x_1$',(5,0),S);
draw((0,0)--(0,f(0)),dashed);
draw((5,0)--(5,f(5)),dashed);
