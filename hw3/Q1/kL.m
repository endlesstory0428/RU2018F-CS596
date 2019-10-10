function y = kL(x, h)
%x: vector
%h: scalar, parameter, positive
%y: vector
y = 1 / (2 * h) * exp(-1 / h * abs(x));
