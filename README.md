# 第六周作业 模型拟合

完成以下题目，注意不能使用Matlab自带的[polyfit][]函数。

1. 完成[fit_slope](./fit_slope.m)中的代码，根据点集x、y拟合一条过原点的直线y = kx
2. 完成[fit_line](./fit_line.m)中的代码，根据点集x、y拟合一条直线y = kx + b
3. 完成[fit_quadratic](./fit_quadratic.m)中的代码，根据点集x、y拟合一条二次曲线y = ax<sup>2</sup> + bx + c
4. 完成[solve_approx](./solve_approx.m), 用最小二乘法求解方程Ax = b的近似解，即求一个x使得|Ax - b|<sup>2</sup>最小
5. 完成[my_polyfit](./my_polyfit.m)，该函数实现和Matlab的[polyfit][]类似的功能
6. polyfit有一个缺点，它不能指定拟合多项式中某些项为0（如果无法拟合一个不包含常数项的多项式），请你写一个新的函数[polyfit_mask](./polyfit_mask.m)，用最小二乘法求一个多项式y = p(1)*m(1)*x<sup>N</sup> + p(2)*m(2)*x<sup>N-1</sup> + ... + p(N)*m(N)*x + p(N+1)*m(N+1)，其中的m是一个由0和1组成的向量，如果对应的项为0，则拟合出的多项式不包含该项。
7. 利用上面的几个函数，完成[test](./test.m)中描述的功能。

[polyfit]: https://www.mathworks.com/help/matlab/ref/polyfit.html
