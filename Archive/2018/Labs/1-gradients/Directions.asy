settings.prc = false;
settings.render = 5;
import three;
import graph3;
size(12cm);

currentprojection=orthographic(
camera=(6.62203780548222,3.37617776300693,2.37564492689527),
up=(-0.00306094018461684,-0.00148823274902149,0.0106472981925521),
target=(3.33934269125535e-16,2.1987620058006e-16,-7.42895328587068e-16),
zoom=0.822702474791882);
currentlight=(5,4,4);
splinetype[] Notaknot={notaknot,notaknot,notaknot};

triple g(pair p) {
  real x = p.x, y = p.y;
  return (x,y,1+exp(-(x^2+y^2)/(5*.1))/(2*pi*.1));
}

draw(surface(g,(-1,-1),(1,1),50,Notaknot,Notaknot),surfacepen=lightblue,black+0.5);
real r = 2;
triple c = (0,.1,.3);
dot(g((0,.1)),red+5);
draw(c--g((0,.1)),dashed+2);
for (int i = 0; i < 8; ++i) {
  draw(c--(c+r*(cos(i*pi/4),sin(i*pi/4),0)),p=red+2,Arrow3);
}
