function k = fit_slope(x, y)
% k = fit_slope(x, y)
% 其中x、y是两个向量，用其中的点拟合一条过原点的直线y = kx
% k是过原点直线的斜率

k = sum(x .* y) / sum(x .^ 2);