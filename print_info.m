function print_info(fname, y, yfit)
% fname: 所拟合函数的名字
% y: 真实的y值
% yfit: 拟合的y值

abs_diff = abs(y - yfit);
fprintf('拟合 %s\n', fname);
fprintf('\t绝对偏差之和: %f\n', sum(abs_diff));
fprintf('\t最小二乘: %f\n', sum(abs_diff .^ 2));
fprintf('\t切比雪夫: %f\n', max(abs_diff));


