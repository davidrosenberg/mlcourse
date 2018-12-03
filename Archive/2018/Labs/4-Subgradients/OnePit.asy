settings.prc = false;

import three;
import graph3;
import plain;
size(12cm);

currentlight=(5,-2,4);

splinetype[] Notaknot={notaknot,notaknot,notaknot};
triple g(pair p) {
  real x = p.x, y = p.y;
  return (x,y,-exp(-(x^2+y^2)/.25)/.6);
}
draw(surface(g,(-.3,-.3),(.3,.3),50,Notaknot,Notaknot),surfacepen=lightblue+opacity(.75),black);
