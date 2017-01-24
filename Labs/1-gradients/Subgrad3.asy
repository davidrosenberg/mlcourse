settings.prc = false;
//settings.render = 20;
import three;
import graph3;
size(15cm);

currentprojection=orthographic(
camera=(12.4950473351339,-31.4137584659665,19.934620139627),
up=(-0.00749427576507822,0.0207673646459539,0.0374234577251916),
target=(2.82066037193829e-15,-6.44970188368177e-15,1.3314002678122e-15),
zoom=0.822702474791882);
//currentprojection=orthographic(
//camera=(16.5444101487281,-34.4638526126339,8.88053246734313),
//up=(-0.00320545899915848,0.0139375588501464,0.0600610827995927),
//target=(3.38618022510673e-15,-4.8468173918792e-15,6.54858112181245e-16),
//zoom=0.822702474791882);
//currentprojection=orthographic(4,2,3);
currentlight=(5,-2,4);
splinetype[] Notaknot={notaknot,notaknot,notaknot};
triple f(pair p) {
  real x = p.x, y = p.y;
  real z = abs(x)+2*abs(y);
  return (x,y,z);
}
draw(surface(f,(-6,-5),(7,5),30,Notaknot,Notaknot),surfacepen=lightblue+opacity(.75),black);
xaxis3("$x_1$",red+2,Arrow3);
yaxis3("$x_2$",red+2,Arrow3);
zaxis3("$f(x)$",red+2,Arrow3);
dot((3,0,0),black+5);
draw((3,0,0)--f((3,0)),dashed);
dot(f((3,0)),black+5);
draw((3,0,0)--(3+1,-1,0),green+2,Arrow3);
label("$v$",(3,0,0),S);
label("$g$",(3+1,-1,0),SE);
