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
dot((d,h(d)),p=black+5);
dot(g(d),p=black+5);
draw(f(d)--g(d),p=blue+1);
pair cen = (f(d)+g(d))/2;
draw( cen..(cen+(.03,-.005))..(cen+(.05,-.02))..(cen+(.1,-.05)));
label("$f(x+h)-(f(x)+hf'(x))$",cen+(.1,-.05),S);
draw((c,-.05)--(c,h(c)));
label("$(x,f(x))$",(c,-.07));
label("$f$",f(.5),NE);
//label("$f(x)+hf'(x)$",g(.5)+(.02,.02),E);
label("$(x+h,f(x+h))$",(d-.05,h(d)+.1),N);
draw((d,h(d))--(d-.05,h(d)+.1));
draw(g(d)--(g(d)+(-0.05,-.1)));
label("$(x+h,f(x)+hf'(x))$",(g(d)+(-.05,-.1)),S);
