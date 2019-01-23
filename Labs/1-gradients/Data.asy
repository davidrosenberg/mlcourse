import graph;
import plain;
import stats;
srand(1);
size(8cm);
real m = 1/3, b = 0, d = 0.3;
real[] xs = new real[0];
real[] ys = new real[0];
void ex(real x, real y) { draw( (x-d,y-d)--(x+d,y+d), p=blue+1 ); draw( (x-d,y+d)--(x+d,y-d), p=blue+1 ); }

for (int i = 0; i < 50; ++i) {
  real x = unitrand()*40-20, y = b + m*x + 3*Gaussrand();
  xs.push(x);
  ys.push(y);
  ex(x,y);
}
xaxis("$x$",EndArrow);
yaxis("$y$",EndArrow);
shipout("Data");

real L(real[] xs, real[] ys, pair w) {
  real ret = 0;
  for (int i = 0; i < xs.length; ++i) ret += (w.y + w.x*xs[i]-ys[i])^2;
  return ret/xs.length;
}

pair dL(real[] xs, real[] ys, pair w) {
  pair ret = (0,0);
  for (int i = 0; i < xs.length; ++i) ret += 2*(w.y + w.x*xs[i]-ys[i])*(xs[i],0);
  return ret/xs.length;
}

real eta = 1;
pair w = (0,0);
pair[] ws = new pair[0];
ws.push(w);
real xm = -20, xM = 20;
int T = 50;
for (int i = 0; i < T; ++i) {
  save();
  for (int j = 0; j < i; ++j) draw((xm,xm*ws[j].x+ws[j].y)--(xM,xM*ws[j].x+ws[j].y),lightgreen+0.1);
  pair g = dL(xs,ys,w);
  real l = L(xs,ys,w);
  write("("+string(w.x)+","+string(w.y)+"), "+string(l)+", ("+string(g.x)+","+string(g.y)+")");
  draw((xm,xm*ws[i].x+ws[i].y)--(xM,xM*ws[i].x+ws[i].y),darkgreen+1);
  real s = eta;
  while (L(xs,ys,w-s*g) > l-0.8*s*length(g)^2) s *= 0.5;
  write("s="+string(s));
  w -= s*g;
  ws.push(w);
  label("$T="+string(i)+"$",(-10,max(ys)));
  if (i%5==0 || i < 5) shipout("Data"+string(i));
  restore();
}
