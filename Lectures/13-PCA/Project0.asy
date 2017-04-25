import graph;
import plain;
import stats;
size(12cm);
//defaultpen(fontsize(22));
int n = 7;
srand(3);
real[] xs = new real[n], ys = new real[n];
real th = pi/12;
pair f(real t) { return (t,0)*expi(th); }
draw((0,0)--(1,0)*expi(th),EndArrow);
for (int i = 0; i < n; ++i) {
  real x = unitrand()*10-5, y = Gaussrand()*2;
  pair p = (x,y)*expi(th);
  pair pr = (x,0)*expi(th);
  xs[i] = p.x;
  ys[i] = p.y;
  label("$\tilde{x}_"+(string)(i+1)+"$",p,W);
  draw(Circle(p,.05),black);
}
xaxis('$x^1$',xmax=max(xs)+1,red,EndArrow);
yaxis('$x^2$',ymin=min(ys)-1,red,EndArrow);
label("$w$",(1,0)*expi(th),N);
