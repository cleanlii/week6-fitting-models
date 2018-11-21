function p = my_polyfit(x, y, N)
% p = my_polyfit(x, y, N)
% 用N阶多项式进行数据拟合，x和y是两个向量，返回值p是一个多项式
% 用最小二乘法求一个多项式y = p(1)*x^N + p(2)*x^N-1 + ... + p(N)*x + p(N+1)

len = length(x);
A = zeros(len, N+1);

for i = 1:N+1
    A(:, i) = x .^ (N+1-i);
end

p = solve_approx(A, y');
p = p';
