function k = kS(x, y)
%x: vector
%y: scalar, I think there should be an approch to calculate K using matrix multiplication
%k: vector
k = (1 + x(:,1) * y(1) + x(:,2) * y(2)).^2;