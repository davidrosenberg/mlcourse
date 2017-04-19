if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="4-Subgradients-Notes_sol-9";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
import plain;
size(12cm);
real r = 5;
real f(real x) { return x^2/5-1; }
draw(graph(f,-1,3),green+1);
xaxis('$x$',xmin=-1.5,xmax=3.5,red,EndArrow);
yaxis('$f_0$',XEquals(0),ymin=-3,ymax=3,red,EndArrow);
label("$f_0(x)$",(2,2));
real g(real x) { return -(x-10)^2/5-2; }
draw(graph(g,9,13),green+1);
xaxis('$\lambda$',xmin=8,xmax=13,red,EndArrow);
yaxis('$g$',XEquals(9),ymin=-3,ymax=3,red,EndArrow);
label("$g(\lambda)$",(10,-3));
draw((-1.5,-1)--(13,-1),dashed+blue+1);
draw((-1.5,-2)--(13,-2),dashed+blue+1);
label("$p^*$",(-1.5,-1),W);
label("$d^*$",(-1.5,-2),W);

