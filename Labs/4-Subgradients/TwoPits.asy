settings.prc = false;

import three;
import graph3;
import plain;
size(12cm);

currentlight=(5,-2,4);
currentprojection=perspective(
camera=(-1.0745777388818,-7.00825698348675,2.77987318503903),
up=(-0.000549622553558881,0.0122234442812303,0.0233079474414336),
target=(1.79302602256465,0.351969889793307,-1.01244595473066),
zoom=1,
angle=29.74683363115,
autoadjust=false);

splinetype[] Notaknot={notaknot,notaknot,notaknot};
triple g(pair p) {
  real x = p.x, y = p.y;
  return (x,y,-exp(-(x^2+y^2)/.25)/.6 -exp(-((x-3)^2+(y)^2)/.25)/.6-exp(-((x-1.5)^2+(y-1.5)^2)/.25)/.6);
}
draw(surface(g,(-2,-2),(5,3),50,Notaknot,Notaknot),surfacepen=lightblue+opacity(.75),black);
