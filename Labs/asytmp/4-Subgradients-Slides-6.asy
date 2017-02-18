if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="4-Subgradients-Slides-6";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
import plain;
size(8cm);
filldraw(ellipse((0,0),7,3),green+opacity(.5),black+1);
filldraw(rotate(45)*ellipse((0,0),7,3),blue+opacity(.5),black+1);
label("$S\cap T$",(0,0));
label("$S$",(-6,0));
label("$T$",(3,4));

size(342.2953pt,199.53146pt,keepAspect=true);
