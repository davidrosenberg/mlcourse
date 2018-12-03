import graph;
import plain;
import contour;
size(12cm);
defaultpen(fontsize(12));
pair w = (1,3), x1 = (-3,5), x2 = (3,8);
real f(real x) { return -w.x/w.y * (x-2*w.x) + 2*w.y; }
real f1(real x) { return -w.x/w.y * (x-x1.x) + x1.y; }
real f2(real x) { return -w.x/w.y * (x-x2.x) + x2.y; }
real xm = -5, xM = 5;
draw(graph(f,xm,xM),p=green+1);
draw(graph(f1,xm,xM),p=green+dashed);
draw(graph(f2,xm,xM),p=green+dashed);
draw(brace(w,(0,0)),p=purple);
draw((0,0)--w,EndArrow(size=5),p=blue+1);
label("$w$",w,NE);
//dot(x1+(a,b),w) = 20 => x1.x+t + 3(x1.y+3t)=20 => t = (20-x1.x-3*x1.y)/10
real t = (20-x1.x-3*x1.y)/10;
real t2 = (20-x2.x-3*x2.y)/10;
//draw(brace(x1,x1+t*w),p=purple);
draw(x1--(x1 + t*w),p=red+dashed);
draw(x2--(x2 + t2*w),p=red+dashed);
dot(x1,p=black+3); dot(x2,p=black+3);
label("$\displaystyle{\frac{w^Tx_1-20}{\|w\|_2}=-\frac{8}{\sqrt{10}}}$",(-4,2));
label("$\displaystyle{\frac{w^Tx_2-20}{\|w\|_2}=\frac{7}{\sqrt{10}}}$",(2.5,10));
draw((-4,2.55)..(-4,5)..((x1+t/2*w)+(-3,1)*.11),EndArrow,p=purple);
draw((3,9.6)..(2.2,8)..((x2+t2/2*w)+(-3,1)*.11),EndArrow,p=purple);
label("$x_1$",x1,SW); label("$x_2$",x2,NE);
label("$\|w\|_2=\sqrt{10}$",(1.25,1.5),E);
label("$w^Tv = 20$",(xm,8.5),W);
label("$w^Tv = 12$",(xm,5.8),W);
label("$w^Tv = 27$",(xm,10.8),W);
xaxis(xmin=xm,xmax=5,EndArrow);
yaxis(ymin=-2,EndArrow);
