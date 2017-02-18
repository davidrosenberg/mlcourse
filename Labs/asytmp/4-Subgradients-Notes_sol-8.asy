if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="4-Subgradients-Notes_sol-8";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
import plain;
size(12cm);
defaultpen(fontsize(10));
real r = 5, s = 3;
draw((-r,-s)--(-r,s)--(r,s)--(r,-s)--cycle);
label("$\begin{array}{ll}\mathrm{minimize} & f_0(x)\\ \mathrm{subject~to}&f_i(x)\leq 0\end{array}$",(0,0));
draw((r,0)--(r+2,0),EndArrow);
draw(shift((2*r+2,0))*((-r,-s)--(-r,s)--(r,s)--(r,-s)--cycle));
label("Lagrange Dual",(2*r+2,0));
draw((3*r+2,0)--(3*r+4,0),EndArrow);
draw(shift((4*r+4,0))*((-r,-s)--(-r,s)--(r,s)--(r,-s)--cycle));
label("$\begin{array}{ll}\mathrm{maximize} & g(\lambda)\\ \mathrm{subject~to}&\lambda\geq 0\end{array}$",(4*r+4,0));

