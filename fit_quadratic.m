function [a, b, c] = fit_quadratic(x, y)
% [a, b, c] = fit_quadratic(x, y)
% 其中x、y是两个向量，用其中的点拟合一条二次曲线y = ax^2 + bx + c

len = length(x);
A = [x .^ 2; x; ones(1, len)]';
B = solve_approx(A, y');
a = B(1);
b = B(2);
c = B(3);

