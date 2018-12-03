import graph;
import plain;
size(7cm,6cm,IgnoreAspect);
pair f(real t) { return (2/sqrt(3)*cos(2*pi*t),2*sin(2*pi*t)); }
draw(graph(f,0,1),p=green+1);
xaxis(xmin=-2.5,xmax=2.5,Ticks(OmitTick(0,2.5)),EndArrow);
yaxis(ymin=-2.5,ymax=2.5,Ticks(OmitTick(0,2.5)),EndArrow);
label("$\{(x,y)\mid 3x^2+y^2=4\}$",(-2.5,2.5),N);
draw((-2.5,2.5)--(-1,1),EndArrow,p=red);
