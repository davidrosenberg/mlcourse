import graph;
import plain;
size(16cm);
real h(real t) { return t^2; }
real dh(real t) { return 2*t; }
pair f(real t) { return (t,h(t)); }
real c = .15, d = .35;
pair g(real t) { return (t,h(c) + (t-c)*dh(c)); }
draw(graph(f,0,.5),p=green+1);
draw(graph(g,0,.5),p=red+1);
dot((c,h(c)),p=black+5);
draw(f(d)--g(d),p=blue+1);
pair cen = (f(d)+g(d))/2;
draw( cen..(cen+(.03,-.005))..(cen+(.05,-.02))..(cen+(.1,-.1)));
label("$f(t)-(f(x_0)+(t-x_0)f'(x_0))$",cen+(.1,-.1),S);
draw((c,-.05)--(c,h(c)));
label("$(x_0,f(x_0))$",(c,-.07));
label("$f(t)$",f(.5)+(.02,.02),E);
label("$f(x_0)+(t-x_0)f'(x_0)$",g(.5)+(.02,.02),E);
