import graph;
import plain;
import stats;
import contour;
srand(1);
size(8cm,10cm,false);
real m = 1/3, b = 1.5, d = 0.3;
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

real L(pair w) {
  real ret = 0;
  for (int i = 0; i < xs.length; ++i) ret += (w.y + w.x*xs[i]-ys[i])^2;
  return ret/xs.length;
}

pair dL(pair w) {
  pair ret = (0,0);
  for (int i = 0; i < xs.length; ++i) ret += 2*(w.y + w.x*xs[i]-ys[i])*(xs[i],1);
  return ret/xs.length;
}

real eta = 1;
pair w = (0,0);
pair[] ws = new pair[0];
ws.push(w);
real xm = -20, xM = 20;
int[] times = {0,1,2,3,4,5,10,15,20,25,50};
for (int i = 0; i <= 50; ++i) {
  pair g = dL(w);
  real l = L(w);
  write("("+string(w.x)+","+string(w.y)+"), "+string(l)+", ("+string(g.x)+","+string(g.y)+")");
  real s = eta;
  while (L(w-s*g) > l-0.8*s*length(g)^2) s *= 0.5;
  write("s="+string(s));
  w -= s*g;
  ws.push(w);
}
ws = ws[times];
for (int i = 0; i < times.length; ++i) {
  save();
  for (int j = 0; j < i; ++j)
    draw((xm,xm*ws[j].x+ws[j].y)--(xM,xM*ws[j].x+ws[j].y),darkgreen+0.25);
  draw((xm,xm*ws[i].x+ws[i].y)--(xM,xM*ws[i].x+ws[i].y),darkgreen+1);
  label("$T="+string(times[i])+"$",(-10,max(ys)));
  shipout("Data"+string(times[i]));
  restore();
}

erase();
size(8cm,10cm,false);
real[] vals = map(L,ws);
draw(contour(L,(-0.2,-0.5),(1,2),vals,nx=500,ny=500));
for (int i = 0; i < ws.length; ++i) {
  save();
  for (int j = 0; j < i; ++j) {
    dot(ws[j],black+3);
    if (j > 0) draw(ws[j-1]--ws[j],red+1);
  }
  dot(ws[i],black+3);
  if (i > 0) draw(ws[i-1]--ws[i],red+1,EndArrow);
  xaxis("$\theta_1$",EndArrow);
  yaxis("$\theta_2$",EndArrow);
  shipout("contour"+string(times[i]));
  restore();
}
