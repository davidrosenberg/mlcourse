import graph;
import plain;
size(8cm);
label("Convex Set",(0,13),N);
filldraw(ellipse((0,10),5,3),green,red+1);
label("Non-convex Set",(0,5));
filldraw(shift(-3,-3)*((0,5)..(3,7)..(5,3)..(3,2)..(5,1)..(1,-2)..cycle),green,red+1);
draw(shift(-3,-3)*( (4,6)--(4,0) ), blue+1);
dot((1,3),blue+4); dot((1,-3),blue+4);
real f(real x) { return (x-15)^2/2+8; }
draw(graph(f,12,18),green+1);
draw((11.5,7)--(18.5,7),red,EndArrow);
draw((11.75,6.75)--(11.75,13),red,EndArrow);
label("Convex Function",(15,13),N); 
real g(real x) { return sin(x-6); }
draw(graph(g,12,18),green+1);
draw((13,sin(7))--(17.5,sin(11.5)),blue+1);
draw((11.5,-2)--(18.5,-2),red,EndArrow);
draw((11.75,-2.5)--(11.75,4),red,EndArrow);
label("Non-convex Function",(15,5));
