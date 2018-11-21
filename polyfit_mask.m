function p = polyfit_mask(x, y, m)
% p = polyfit_mask(x, y, m)
% 其中的m是一个由0和1组成的向量，其中包含N+1个元素
% 用N阶多项式进行数据拟合，x和y是两个向量，返回值p是一个多项式
% 用最小二乘法求一个多项式y = p(1)*m(1)*x^N + p(2)*m(2)*x^N-1 + ... + p(N)*m(N)*x + p(N+1)*m(N+1)
% 即，如果m中对应项为0，则拟合出的多项式不包含该项。

len = length(x);
N = length(m) - 1;
n = sum(m);

A = zeros(len, n);

j = 1;
for i = 1:N+1
    if m(i)
        A(:, j) = x .^ (N+1-i);
        j = j + 1;
    end
end

q = solve_approx(A, y');

p = zeros(1, N+1);
j = 1;
for i = 1:N+1
    if m(i)
        p(i) = q(j);
        j = j + 1;
    end
end
