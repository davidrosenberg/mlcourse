if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="9-GBM-Slides-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
import plain;
size(12cm);
//defaultpen(fontsize(22));
draw((-3,-2)--(5,-2)--(5,7)--(19,7),p=blue+2);
label("5",(5,0),SE);
label("-2",(0,-2),SE);
label("7",(0,7),W);
ytick(7);
label("$x\leq 5$",(10,4),NW);
label("$x> 5$",(14,4),NE);
draw(Circle((12,5),1));
label("-2",(9,3));
draw(Circle((9,3),1));
label("7",(15,3));
draw(Circle((15,3),1));

draw( ( (12,5)+(-3,-2)/length((-3,2)) ) -- ( (9,3)+(3,2)/length((3,2)) ) );
draw( ( (12,5)+(3,-2)/length((3,2)) ) -- ( (15,3)+(-3,2)/length((-3,2)) ) );
xaxis('$x$',red,EndArrow,above=true);
yaxis('$y$',ymin=-4,ymax=9,red,EndArrow,above=true);

