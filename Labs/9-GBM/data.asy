import graph;
import plain;
size(12cm);
//defaultpen(fontsize(22));
real[] X = {1,2,3,4,8,9,10,11,15,16,17,18};
real[] Y = {1,1,10,2,-4,-5,-10,-3,0,1,-1,5};
real r = .25;
void drawX(pair p) {
  draw((p.x-r,p.y-r)--(p.x+r,p.y+r),p=black+2);
  draw((p.x+r,p.y-r)--(p.x-r,p.y+r),p=black+2);
}

for (int i = 0; i < X.length; ++i) {
  //dot((X[i],Y[i]),p=black+3);
  drawX((X[i],Y[i]));
}

xaxis('$x$',red,EndArrow,above=true);
yaxis('$y$',red,EndArrow,above=true);
