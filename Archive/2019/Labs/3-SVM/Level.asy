import graph;
import plain;
import contour;
size(8cm);
pair w = (1,3)/length((1,3));
real[] cs;
real xm = -5;
for (real i = -4; i <= 5; ++i) cs.push(i);
real f(real x, real y) { return dot(w,(x,y)); }
draw(contour(f,(-5,-4),(5,7),cs),p=green);
for (int i = 0; i < cs.length; ++i) {
    label("$w^Tv="+string(cs[i])+"$",(xm,xm*(-1/3)+cs[i]/cos(atan2(w.x,w.y))),W,p=fontsize(8));
}
draw((0,0)--w,EndArrow(size=5),p=blue+1);
label("$w$",w,NE);
xaxis(xmin=xm,xmax=5,EndArrow);
yaxis(ymin=-4,ymax=7,EndArrow);
