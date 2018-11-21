%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 胡克定律
%
% 加载数据： 弹簧受力f, 拉伸长度x
% 拟合一条直线f = kx，并打印出拟合的绝对偏差之和、最小二乘以及切比雪夫准则下的误差值
% 在图中画出拟合的直线、拟合点（蓝色圆）、实际点（红色方块）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
load('data/spring');

k = fit_slope(x, f);
print_info('f = kx', f, k*x);

subplot(2, 2, 1);
hold on;
t = linspace(0, max(x), 100);
plot(x, f, 'rs', 'MarkerFaceColor', 'r');
plot(x, k*x, 'bo', 'MarkerFaceColor', 'b');
plot(t, k*t, 'b-');
legend('实际值', '预测值', 'f = kx');
title('f = kx');
xlabel('x');
ylabel('f');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  y = kx^3
%
% 加载数据： x, y
% 拟合一条曲线y = kx^3，并打印出拟合的绝对偏差之和、最小二乘以及切比雪夫准则下的误差值
% 在图中画出拟合的曲线、拟合点（蓝色圆）、实际点（红色方块）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
load('data/x3');

% Insert your code here
m = [1 0 0 0];
k = fit_slope(x.^3, y);
print_info('y = kx^3', y, k*x.^3);

subplot(2, 2, 2);
hold on;
t = linspace(min(x), max(x), 100);
plot(x, y, 'rs', 'MarkerFaceColor', 'r');
plot(x, k*x.^3, 'bo', 'MarkerFaceColor', 'b');
plot(t, k*t.^3, 'b-');
legend('实际值', '预测值', 'f = kx^3');
title('y = kx^3');
xlabel('x');
ylabel('y');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  鱼的重量预测
%
% 加载数据： 鱼的重量W，长度l，腰围g
% 预测鱼的重量有两种方式：
%           (1) W = cl^3
%           (2) W = klg^2
% 分别用两种方法进行拟合，并打印出每种方法拟合的绝对偏差之和、最小二乘以及切比雪夫准则下的误差值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
load('data/fish');

% Insert your code here
c = fit_slope(l.^3, W);
print_info('W = cl^3', W, c*l.^3);

k = fit_slope(g.^2.*l, W);
print_info('W = klg^2', W, k*g.^2.*l);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  未知数据1
%
% 加载数据： x, y
% 我们获取了一组未知数据，现在要用这组数据来尝试拟合如下模型：
%       (1) y = ax
%       (2) y = ax + b
%       (3) y = ax^2
% 分别用上述三种模型进行拟合，并打印出每种方法拟合的绝对偏差之和、最小二乘以及切比雪夫准则下的误差值
% 在图中分别画出每种方法拟合的曲线、拟合点以及实际实际点
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
load('data/unknown');

% Insert your code here
a1 = fit_slope(x, y);
print_info('y = ax', y, a1*x);

[a2, b2] = fit_line(x, y);
print_info('y = ax + b', y, a2*x + b2);

a3 = fit_slope(x.^2, y);
print_info('y = ax^2', y, a3*x.^2);

subplot(2, 2, 3);
hold on;
t = linspace(min(x), max(x), 100);
h1 = plot(x, y, 'rs', 'MarkerFaceColor', 'r', 'DisplayName', '实际值');

plot(x, a1*x, 'go', 'MarkerFaceColor', 'g');
h2 = plot(t, a1*t, 'g-', 'DisplayName', 'y = ax');

plot(x, a2*x + b2, 'bo', 'MarkerFaceColor', 'b');
h3 = plot(t, a2*t + b2, 'b-', 'DisplayName', 'y = ax + b');

plot(x, a3*x.^2, 'mo', 'MarkerFaceColor', 'm');
h4 = plot(t, a3*t.^2, 'm-', 'DisplayName', 'y = ax^2');

title('Unknown data 1');
legend([h1, h2, h3, h4]);
xlabel('x');
ylabel('y');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  未知数据2
%
% 加载数据： x, y
% 我们获取了一组未知数据，现在要用这组数据来尝试拟合如下模型：
%       (1) y = ax + b
%       (2) y = ax^2
%       (3) y = ax^3
%       (4) y = ax^3 + bx^2 + c
% 分别用上述模型进行拟合，并打印出每种方法拟合的绝对偏差之和、最小二乘以及切比雪夫准则下的误差值
% 在图中分别画出每种方法拟合的曲线、拟合点以及实际实际点
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
load('data/unknown2');

% Insert your code here
[a1, b1] = fit_line(x, y);
print_info('y = ax + b', y, a1*x + b1);

a2 = fit_slope(x.^2, y);
print_info('y = ax^2', y, x.^2);

a3 = fit_slope(x.^3, y);
print_info('y = ax^3', y, x.^3);

p = polyfit_mask(x, y, [1 1 0 1]);
a4 = p(1);
b4 = p(2);
c4 = p(4);
print_info('y = ax^3 + bx^2 + c', y, a4*x.^3 + b4*x.^2 + c4);

subplot(2, 2, 4);
hold on;
t = linspace(min(x), max(x), 100);
h1 = plot(x, y, 'rs', 'MarkerFaceColor', 'r', 'DisplayName', '实际值');

plot(x, a1*x + b1, 'go', 'MarkerFaceColor', 'g');
h2 = plot(t, a1*t + b1, 'g-', 'DisplayName', 'y = ax + b');

plot(x, a2*x.^2, 'bo', 'MarkerFaceColor', 'b');
h3 = plot(t, a2*t.^2, 'b-', 'DisplayName', 'y = ax^2');

plot(x, a3*x.^3, 'mo', 'MarkerFaceColor', 'm');
h4 = plot(t, a3*t.^3, 'm-', 'DisplayName', 'y = ax^3');

plot(x, a4*x.^3 + b4*x.^2 + c4, 'co', 'MarkerFaceColor', 'c');
h5 = plot(t, a4*t.^3 + b4*t.^2 + c4, 'c-', 'DisplayName', 'y = ax^3 + bx^2 + c');

title('Unknown data 2');
legend([h1, h2, h3, h4, h5]);
xlabel('x');
ylabel('y');
