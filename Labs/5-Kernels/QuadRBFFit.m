xs = linspace(-2,2,1000);
n = length(xs);
ys = xs.^2;
k = @(x,y) exp(-(x-y).^2/2);
K = zeros(n,n);
for i = 1:n
    for j = 1:n
        K(i,j) = k(xs(i),xs(j));
    end
end
lambda = 0;
alpha = (lambda*eye(n,n) + K)\ys'
mesh = linspace(-8,8,1000);
g = zeros(1,length(mesh));
for i = 1:n
    g = g + alpha(i)*k(mesh,xs(i));
end
plot(mesh,g);
hold on
plot(mesh,mesh.^2);
%stem(xs,ys,'o');
hold off