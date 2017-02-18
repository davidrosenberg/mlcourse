if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="4-Subgradients-Slides-5";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
import plain;
import contour;
size(12cm);
real f(pair p) {
  real x = p.x, y = p.y;
  return -exp(-(x^2+y^2)/.25)/.6;
}
triple g(pair p) {
  real x = p.x, y = p.y;
  return (x,y,-exp(-(x^2+y^2)/.25)/.6);
}
real[] c = uniform(-2,0,20);
draw(contour(f,(-.75,-.75),(.75,.75),c));
//draw(contour(f,(-.75,-.75),(.75,.75),uniform(-.1,0,10)));
guide[][] cg = contour(f,(-.75,-.75),(.75,.75),new real[]{-1});
draw(cg,p=black+2);
fill(cg,interior(cg,array(cg.length+1,green)));
label("$f(x)\leq -1$",(0,0));


size(188.26346pt,124.7067pt,keepAspect=true);
