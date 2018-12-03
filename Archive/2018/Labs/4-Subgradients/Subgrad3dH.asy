settings.prc = false;
//settings.render = 20;
import three;
import graph3;
size(15cm);
currentprojection=orthographic(
camera=(18.5706097078564,-21.7435661117414,26.882864397526),
up=(-0.0140722494991699,0.014495755728924,0.0214456232887482),
target=(7.29451221648247e-16,-4.27956281523478e-15,2.92821322744885e-15),
zoom=0.822702474791882);
currentlight=(5,-2,4);
splinetype[] Notaknot={notaknot,notaknot,notaknot};
triple f(pair p) {
  real x = p.x, y = p.y;
  real z = abs(x)+2*abs(y);
  return (x,y,z);
}
triple g(pair p) {
  real x = p.x, y = p.y;
  real z = dot( (x-3,y), (1,-1)) + f((3,0)).z;
  return (x,y,z);
}
//draw(surface(f,(-4.5,-2),(4.5,2),30,Notaknot,Notaknot),surfacepen=lightblue+opacity(.75),black);
draw(surface(f,(-4.5,-2),(4.5,2),30),surfacepen=lightblue+opacity(.75),black);
draw(surface(g,(0,-2),(4,4),30),surfacepen=lightgreen+opacity(.75),black);
xaxis3("$x_1$",xmax=6,red+2,Arrow3);
yaxis3("$x_2$",red+2,Arrow3);
zaxis3("$f(x)$",red+2,Arrow3);
dot((3,0,0),black+5);
draw((3,0,0)--f((3,0)),dashed);
dot(f((3,0)),black+5);
draw((3,0,0)--(3+1,-1,0),green+2,Arrow3);
label("$v$",(2.5,-.5,0),S);
label("$g$",(3+1,-1,0),SE);
