settings.prc = false;
settings.render = 5;
import three;
import graph3;
size(12cm);

//currentprojection=perspective((40,20,40));
//currentlight = light(lightgray,ambient=white,specular=lightblue,specularfactor=1,(30,25,20));
//currentprojection=orthographic(
//camera=(19.6469370505578,12.0191318511971,12.0572926894543),
//up=(-0.0290671504851431,-0.00808862932355455,0.0554269322465714),
//target=(-2.61249355482107e-15,-1.30624677741054e-15,7.0603245472256e-16),
//zoom=0.676839362028687);
currentprojection=orthographic(
camera=(24.3596199164748,12.1404305393425,11.7435407087249),
up=(-0.0258323267723462,-0.00380446254655486,0.0575170247301515),
target=(-2.17534323887492e-15,-3.1563293645398e-15,1.16053000542848e-15),
zoom=0.822702474791882);
//currentprojection=orthographic(4,2,3);
currentlight=(5,-2,4);
splinetype[] Notaknot={notaknot,notaknot,notaknot};
triple g(pair p) {
  real x = p.x, y = p.y;
  return (x,y,1+exp(-(x^2+y^2)/(5*.1))/(2*pi*.1));
}
triple f(pair p) {
  real x = p.x, y = p.y;
  real z = (.6*x^2-y^2)/10+ 6*g(p-(5,5)).z - 6*g(p+(5,5)).z;
  return (x,y,z);
}
draw(surface(f,(-8,-8),(8,8),100,Notaknot,Notaknot),surfacepen=lightblue+opacity(.75),black+0.5);
real low = f((-5,-5)).z, high = f((5,5)).z;
draw((-5,-10,low-1)--(-5,-5,low),red+1,Arrow3);
draw((5,15,high+1)--(5,5,high),red+1,Arrow3);
draw((0,0,low-1)--(0,0,0),red+1,Arrow3);
label("minimum",(-5,-10,low-1),S);
label("saddle",(0,0,low-1),S);
label("maximum",(5,15,high+1),N);
