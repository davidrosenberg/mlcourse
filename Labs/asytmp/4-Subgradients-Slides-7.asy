if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="4-Subgradients-Slides-7";
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
filldraw((-5,5)--(5,5)--(5,-5)--(-5,-5)--cycle,lightblue,invisible);
filldraw(Circle((0,0),3),green,black+2);
label("$f(x)<-1$",(0,0));
label("$f(x)>-1$",(3,4));
label("$f(x)=1$",(-3.75,-3));
draw((-4,-2.5)--(3,0)*expi(-3*pi/4),red,EndArrow);

size(342.2953pt,199.53146pt,keepAspect=true);
