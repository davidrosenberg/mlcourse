import graph;
import plain;
import contour;
size(8cm);
real k(real x, real y) { return exp(-(x-y)^2/2); }
real[] xs = uniform(-2,2,10-1);
real[] ys = new real[xs.length];
for (int i = 0; i < xs.length; ++i) ys[i] = xs[i]*xs[i];
for (int i = 0; i < xs.length; ++i) dot((xs[i],ys[i]),black+4);
//real[] alphas = { 12.2755,-11.8287,1.6387,4.5700,-2.7220,-2.7220,4.5700,1.6387,-11.8287,12.2755 };
real[] alphas = {5.5685,-1.3711,-1.4518,-0.0785,0.4866,0.4866,-0.0785,-1.4518,-1.3711,5.5685};
for (int i = 0; i < xs.length; ++i) {
  real f(real x) { return k(x,xs[i])*alphas[i]; }
  draw(graph(f,-5,5),green);
  draw((xs[i],0)--(xs[i],f(xs[i])),red+dashed);
}
real g(real x) {
  real y = 0;
  for (int i = 0; i < xs.length; ++i) y += k(x,xs[i])*alphas[i];
  return y;
}
draw(graph(g,-5,5),blue+1);
xaxis("$x$",EndArrow);
yaxis("$y$",EndArrow);
