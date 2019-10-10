function y = kG(x, h)
%x: vector
%h: scalar, parameter, positive
%y: vector
y = 1 / sqrt(2 * pi * h) * exp(-1 / (2 * h) * x.^2);
