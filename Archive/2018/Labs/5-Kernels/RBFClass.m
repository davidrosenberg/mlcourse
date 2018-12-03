close all
clear all
%xs = [1,1;1,-1;-1,1;-1,-1];
%ys = [-1,1,1,-1];
rng(1);
rs = [5*rand(50,1);6+5*rand(50,1)]/10;
ts = 2*pi*rand(100,1);
xs = [rs.*cos(ts),rs.*sin(ts)];
ys = [ones(50,1)*-1;ones(50,1)];
n = length(xs);
k = @(x,y) exp(-norm(x-y)^2/2);
K = zeros(n,n);
for i = 1:n
    for j = 1:n
        K(i,j) = k(xs(i),xs(j));
    end
end
c = 10;
lambda = 1;
cvx_begin 
    variable alp(n,1);
    variable b;
    minimize( lambda*alp'*K*alp + c/n*sum(max(1-diag(ys)*(K*alp+b),0)) )
cvx_end
[X,Y] = meshgrid(-2:.25:2);
M = zeros(length(X),length(X));
for i = 1:length(X)
    for j = 1:length(X)
        for t = 1 : length(xs)
            M(i,j) = M(i,j) + alp(t)*k(xs(t,:)',[X(i,j);Y(i,j)]);
        end
        M(i,j) = M(i,j)+b;
    end
end
scatter(xs(1:50,1),xs(1:50,2),'MarkerFaceColor',[1,0,0]);
hold on
scatter(xs(51:100,1),xs(51:100,2),'MarkerFaceColor',[0,0,1]);
contour(X,Y,M,10);
hold off
figure();
contourf(X,Y,M,10);
hold on
colorbar();
hold off
b
