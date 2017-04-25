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
  draw(p--pr,dashed);
  xs[i] = p.x;
  ys[i] = p.y;
  draw(Circle(p,.05),black);
  label("$\tilde{x}_"+(string)(i+1)+"$",p,W);
  dot(pr,black+3);
}
real v = min(ys)-2;
for (int i = 0; i < n; ++i) {
  pair pr = (xs[i],ys[i])*expi(-th);
  dot((pr.x,v),black+3);
  draw((0,v-1)--(pr.x,v-.25),EndArrow);
}
draw( (min(xs)-1,v)--(max(xs)+1,v),darkgreen,EndArrow);
draw( (0,v-.25)--(0,v+.25), red );
draw(graph(f,min(xs)-1,max(xs)+1),darkgreen);
xaxis('$x^1$',xmax=max(xs)+1,red,EndArrow);
yaxis('$x^2$',ymin=min(ys)-1,red,EndArrow);
label("$w^T\tilde{x}_i$-values",(0,v-1),S);
label("$w$",(1,0)*expi(th),N);
