close all;
clear all;

ps =[1,3,1; 4.8,1,1; 1.5,6,1; 2,4.5,1; 3,3.75,1; 3,6,1; 4.5,5.5,1; 6,8,1;...
        5,2,-1; 8,1.7,-1; 8.5,3.3,-1; 10,1.5,-1; 11,2.5,-1; 11.2,4,-1];
[R,C] = size(ps);
r = 1; lambda = 1;
cvx_begin 
    variable xi(R,1);
    variable w(2,1);
    variable a;
    minimize( sum(xi) + lambda*sum_square_abs(w));
    subject to
       (ps(:,1:2)*w+a).*ps(:,3) >= ones(R,1)-xi;
       xi >= 0;
       %norm(w,2) <= r;
cvx_end
xs = linspace(0,12,100);
ys = (-w(1)*xs-a)/w(2);
ys2 = (-w(1)*xs-a-1)/w(2);
ys3 = (-w(1)*xs-a+1)/w(2);
scatter(ps(:,1),ps(:,2));
hold on
plot(xs,ys);
plot(xs,ys2);
plot(xs,ys3);
hold off
w
a