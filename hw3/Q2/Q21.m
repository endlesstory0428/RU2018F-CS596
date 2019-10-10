%load data
load('D:\Users\endlesstory\Desktop\data3-2.mat')
X = [stars; circles];
Y = [ones(size(stars, 1), 1); -ones(size(circles, 1), 1)];

%calculate K
h = [0.01, 0.005, 0.001];
K = zeros(size(X, 1)); 
for j = 1 : size(X, 1) % I think there should be an approch to calculate K using matrix multiplication
    for k = 1 : size(h, 2)
        K(:,j,k) = kG(X, X(j,:), h(k));
    end
end

%calculate A
lambda = [1e1, 1e0, 1e-3];
I = eye(size(X, 1));
A = zeros([size(X, 1), size(lambda, 2), size(h, 2)]);
for k = 1 : size(lambda, 2)
    for l = 1 : size(h, 2)
        A(:,k, l) = (lambda(k) * I + K(:,:,l)) \ Y;
    end
end

%find g(x) = 0 boundary
[x, y] = meshgrid(-2: 0.01: 2);
z = zeros([size(x), size(lambda, 2), size(h, 2)]);
for i = 1 : size(x, 1)
    for j = 1 : size(y, 1)
        for k = 1 : size(lambda, 2)
            for l = 1 : size(h, 2)
                z(i,j,k,l) = sum((A(:,k,l))' * kG(X, [x(i,j), y(i,j)], h(l)));
            end
        end
    end
end

%plot boundary
figure(1)
[~, c] = contour(x, y, z(:,:,1,1), [0,0], 'b--', 'DisplayName', 'lambda = 1e1, h = 0.01');
c.LineWidth = 2;
a11 = A(:,1,1)'
hold on
[~, c] = contour(x, y, z(:,:,1,2), [0,0], 'k-', 'DisplayName', 'lambda = 1e1, h = 0.005');
c.LineWidth = 2;
a12 = A(:,1,2)'
[~, c] = contour(x, y, z(:,:,1,3), [0,0], 'm:', 'DisplayName', 'lambda = 1e1, h = 0.0001');
c.LineWidth = 2;
a13 = A(:,1,3)'
s = scatter(circles(:,1), circles(:,2), 'o', 'DisplayName', 'circles');
s.LineWidth = 1;
s = scatter(stars(:, 1), stars(:, 2), '*', 'DisplayName', 'stars');
s.LineWidth = 1;

figure(2)
[~, c] = contour(x, y, z(:,:,2,1), [0,0], 'b--', 'DisplayName', 'lambda = 1e0, h = 0.01');
c.LineWidth = 2;
hold on
a21 = A(:,2,1)'
[~, c] = contour(x, y, z(:,:,2,2), [0,0], 'k-', 'DisplayName', 'lambda = 1e0, h = 0.005');
c.LineWidth = 2;
a22 = A(:,2,2)'
[~, c] = contour(x, y, z(:,:,2,3), [0,0], 'm:', 'DisplayName', 'lambda = 1e0, h = 0.001');
c.LineWidth = 2;
a23 = A(:,2,3)'
s = scatter(circles(:,1), circles(:,2), 'o', 'DisplayName', 'circles');
s.LineWidth = 1;
s = scatter(stars(:, 1), stars(:, 2), '*', 'DisplayName', 'stars');
s.LineWidth = 1;

figure(3)
[~, c] = contour(x, y, z(:,:,3,1), [0,0], 'b--', 'DisplayName', 'lambda = 1e-3, h = 0.01');
c.LineWidth = 2;
hold on
a31 = A(:,3,1)'
[~, c] = contour(x, y, z(:,:,3,2), [0,0], 'k-', 'DisplayName', 'lambda = 1e-3, h = 0.005');
c.LineWidth = 2;
a32 = A(:,3,2)'
[~, c] = contour(x, y, z(:,:,3,3), [0,0], 'm:', 'DisplayName', 'lambda = 1e-3, h = 0.001');
c.LineWidth = 2;
a33 = A(:,3,3)'
s = scatter(circles(:,1), circles(:,2), 'o', 'DisplayName', 'circles');
s.LineWidth = 1;
s = scatter(stars(:, 1), stars(:, 2), '*', 'DisplayName', 'stars');
s.LineWidth = 1;