function x = solve_approx(A, b)
% x = solve_approx(A, b)
% 用最小二乘法求解方程Ax = b的近似解，即求一个x使得|Ax - b|^2最小

x = inv(A' * A) * A' * b;

