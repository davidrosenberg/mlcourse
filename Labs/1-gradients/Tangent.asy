settings.prc = false;
settings.render = 30;
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

pair c = (0,.1);
triple g(pair p) {
  real x = p.x, y = p.y;
  return (x,y,1+exp(-(x^2+y^2)/(5*.1))/(2*pi*.1));
}
pair dg(pair p) {
  real x = p.x, y = p.y;
  real z = g(p).z-1;
  return (-2*x,-2*y)*(1/.5*z);
}
triple h(pair p) {
  real x = p.x, y = p.y;
  return (x,y,g(c).z + dot(dg(c),p-c));
}
draw(surface(g,(-1,-1),(1,1),50,Notaknot,Notaknot),surfacepen=lightblue,black+0.5);
draw(surface(h,(-1,-1),(1.2,1.2),50,Notaknot,Notaknot),surfacepen=lightgreen+opacity(.8));
dot(g((0,.1)),red+5);
real r = 2;
triple cc = (0,.1,.3);
draw(cc--g((0,.1)),dashed+2);
for (int i = 0; i < 8; ++i) {
  draw(cc--(cc+r*(cos(i*pi/4),sin(i*pi/4),0)),p=red+2,Arrow3);
  pair tmp = (c.x,c.y) + r/2*(cos(i*pi/4),sin(i*pi/4));
  draw((c.x,c.y,h((c.x,c.y)).z)--(tmp.x,tmp.y,h(tmp).z),p=red+1,Arrow3);
}
