%load data
load('D:\Users\endlesstory\Desktop\data3-2.mat')
X = [stars; circles];
Y = [ones(size(stars, 1), 1); -ones(size(circles, 1), 1)];

%calculate K
K = zeros(size(X, 1)); 
for j = 1 : size(X, 1) % I think there should be an approch to calculate K using matrix multiplication
    K(:,j) = kS(X, X(j,:));
end

%calculate A
lambda = [1e0, 1e-1, 1e-5];
I = eye(size(X, 1));
A = zeros(size(X, 1), size(lambda, 2));
for i = 1 : size(lambda, 2)
    A(:,i) = (lambda(i) * I + K) \ Y;
end

%find g(x) = 0 boundary
[x, y] = meshgrid(-1.5: 0.01: 1.5);
z = zeros([size(x), size(lambda, 2)]);
for i = 1 : size(x, 1)
    for j = 1 : size(y, 1)
        for k = 1 : size(lambda, 2)
            z(i,j,k) = sum((A(:,k))' * kS(X, [x(i,j), y(i,j)]));
        end
    end
end

%plot boundary
[~, c] = contour(x, y, z(:,:,1), [0,0], 'b--', 'DisplayName', 'lambda = 1e0');
c.LineWidth = 2;
hold on
a1 = A(:,1)'
[~, c] = contour(x, y, z(:,:,2), [0,0], 'k-', 'DisplayName', 'lambda = 1e-1');
c.LineWidth = 2;
a2 = A(:,2)'
[~, c] = contour(x, y, z(:,:,3), [0,0], 'm:', 'DisplayName', 'lambda = 1e-5');
c.LineWidth = 2;
a3 = A(:,3)'
s = scatter(circles(:,1), circles(:,2), 'o', 'DisplayName', 'circles');
s.LineWidth = 1;
s = scatter(stars(:, 1), stars(:, 2), '*', 'DisplayName', 'stars');
s.LineWidth = 1;