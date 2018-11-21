function [k, b] = fit_line(x, y)
% [k, b] = fit_line(x, y)
% 其中x、y是两个向量，用其中的点拟合一条直线y = kx + b
% k是直线的斜率, b是截距

len = length(x);

%%%%%%%%%% Method 1 %%%%%%%%%%
%sum_x = sum(x);
%sum_y = sum(y);
%sum_x2 = sum(x .^ 2);
%sum_xy = sum(x .* y);

%denom = len * sum_x2 - sum_x ^ 2;
%k = (len * sum_xy - sum_x * sum_y) / denom;
%b = (sum_x2 * sum_y - sum_xy * sum_x) / denom;

%%%%%%%%%% Method 2 %%%%%%%%%%
A = [x; ones(1, len)]';
B = solve_approx(A, y');
k = B(1);
b = B(2);
