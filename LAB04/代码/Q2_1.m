% 定义符号变量
syms symbolicY(symbolicX)

% 定义微分方程
% 该微分方程表示 x*dy/dx + y = exp(x)
differentialEquation = symbolicX*diff(symbolicY, symbolicX) + symbolicY == exp(symbolicX);

% 定义初始条件
% 该初始条件表示 y(1) = 2*exp(1)
initialCondition = symbolicY(1) == 2*exp(1);

% 求解微分方程
% 使用 dsolve 函数求解微分方程并应用初始条件
solution = dsolve(differentialEquation, initialCondition);

% 显示解析解
% 使用 disp 函数显示微分方程的解析解
disp('微分方程 (1) 的解析解：');
disp(solution);

% 计算并显示初始条件下的特解
% 使用 subs 函数计算在初始条件 x = 1 时的特解
specificSolutionAtInitialCondition = subs(solution, symbolicX, 1);
disp('在初始条件 x = 1 时的特解：');
disp(specificSolutionAtInitialCondition);

% 绘制解函数的图形
% 使用 fplot 函数绘制解函数在区间 [0, 5] 内的图形
fplot(solution, [0, 5]);
xlabel('x'); % 设置 x 轴标签
ylabel('y'); % 设置 y 轴标签
title('解函数 y(x) 的图形'); % 设置图形标题
grid on; % 打开网格
