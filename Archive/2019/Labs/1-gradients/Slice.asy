settings.prc = false;
settings.render = 5;
import three;
import graph3;
size(12cm);
defaultpen(fontsize(20));
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
triple h(pair p) {
  real y = p.x, t = p.y, x = 0;
  return (x,y,1+t*(exp(-(x^2+y^2)/(5*.1))/(2*pi*.1)));
}
triple f(real t) { return h((t,1)); }
triple q(real t) {
  real x = 0, y = .1;
  real v = (1+exp(-(x^2+y^2)/(5*.1))/(2*pi*.1)) + (t-y)*(-2*y)*exp(-(x^2+y^2)/(5*.1))/(2*pi*.1);
  return (0,t,v);
}
draw(surface(g,(-1,-1),(0,1),50,Notaknot,Notaknot),surfacepen=lightblue,black+0.5);
draw(surface(h,(-1,0),(1,1),50,Notaknot,Notaknot),surfacepen=green+opacity(.3));
draw(graph(f,-1,1),p=black+2);
draw(graph(q,-1,1),p=black+2);
real r = 2;
dot(g((0,.1)),red+5);
draw((0,.1,.7)--(0,.1,.7)+r*(0,1,0),p=red+2,Arrow3);
label("$u$",(0,.1,.7)+(r+.2)*(0,1,0));
