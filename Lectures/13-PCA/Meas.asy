import graph;
import plain;
import stats;
size(12cm);
//defaultpen(fontsize(22));
int n = 50;
srand(3);
real[] xs = new real[n], ys = new real[n];
real th = pi/12;
pair f(real t) { return (t,0)*expi(th); }
for (int i = 0; i < n; ++i) {
  real x = unitrand()*20-10;
  real xp = x + Gaussrand(), yp = 2.54*x+Gaussrand();
  pair p = (xp,yp);
  xs[i] = xp;
  ys[i] = yp;
  draw(Circle(p,.25),black);
}
real xm = mean(xs), ym = mean(ys), xv = variance(xs), yv = variance(ys), cov=0;
for (int i = 0; i < n; ++i) cov += (xs[i]-xm)*(ys[i]-ym);
cov /= n;
write((string)(xv)+","+(string)(cov)+";"+(string)(cov)+","+(string)(yv));

xaxis('Tester 1',red,EndArrow,ticks=LeftTicks(OmitTick(0)));
yaxis('Tester 2',ymin=min(ys)-1,red,EndArrow,ticks=LeftTicks(OmitTick(0)),autorotate=false);
