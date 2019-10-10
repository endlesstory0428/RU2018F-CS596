%get 1000 realizations
X = rand(1000, 1);
figure(1)
hist(X, 100)

% approximate
h = [1, 0.01, 0.0001];
x = -1 : 0.001 : 2;
f = zeros(size(x, 2), size(h, 2));
for i = 1 : size(h, 2)
    f(:,i) = sum(kG((X-x), h(i))) / 1000;
end

%plot approximations
figure(2)
p = plot(x, f(:,1), '--', x, f(:,2), '-', x, f(:,3), ':');
for i = 1 : size(p, 1)
    p(i).LineWidth = 2;
end
legend('h = 1', 'h = 0.01', 'h = 0.0001')

%the constant value of the pdf 
index = (x >= 0) & (x < 1);
data = f(index,:);
variance = var(data)

%capturing the support
valid = f > 0.001;
support = zeros(1,3);
for i = 1 : 3
    support(i) = max(x(valid(:,i))) - min(x(valid(:,i)));
end
support
