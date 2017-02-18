if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="4-Subgradients-Slides-4";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

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

size(342.2953pt,124.7067pt,keepAspect=true);
