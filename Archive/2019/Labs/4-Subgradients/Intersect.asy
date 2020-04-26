import graph;
import plain;
size(8cm);
filldraw(ellipse((0,0),7,3),green+opacity(.5),black+1);
filldraw(rotate(45)*ellipse((0,0),7,3),blue+opacity(.5),black+1);
label("$S\cap T$",(0,0));
label("$S$",(-6,0));
label("$T$",(3,4));
