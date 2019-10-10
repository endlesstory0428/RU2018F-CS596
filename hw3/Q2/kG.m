function k = kG(x, y, h)
%x: vector
%y: scalar, I think there should be an approch to calculate K using matrix multiplication
%k: vector
k = exp(-1 / h * ((x(:,1) - y(1)).^2 +(x(:,2) - y(2)).^2));
