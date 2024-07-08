% 定义时间范围
% 该时间范围用于求解微分方程组，从 0 到 10
timeSpan = [0 10];

% 定义初始条件
% 初始条件为 x(0) = 1 和 y(0) = 0
initialConditions = [1; 0];

% 使用 ode45 求解微分方程组
% 'ode45' 是 MATLAB 中用于求解常微分方程的数值解函数
% '@differentialEquationSystem' 是包含微分方程组的函数句柄
% 'timeSpan' 是求解时间范围
% 'initialConditions' 是初始条件向量
[timePoints, solutionMatrix] = ode45(@differentialEquationSystem, timeSpan, initialConditions);

% 显示初始条件下的特解
% 使用 disp 函数显示微分方程组的特解
disp('微分方程组的特解：');
disp(['x(0) = ', num2str(solutionMatrix(1, 1))]);  % 显示 x(0) 的值
disp(['y(0) = ', num2str(solutionMatrix(1, 2))]);  % 显示 y(0) 的值

% 绘制解函数的图形
% 使用 figure 函数创建新的图形窗口
figure;
% 使用 plot 函数绘制解函数的图形
plot(timePoints, solutionMatrix(:, 1), 'b-', ...  % 绘制 x(t) 的图形，蓝色实线
     timePoints, solutionMatrix(:, 2), 'r--');    % 绘制 y(t) 的图形，红色虚线
xlabel('t');  % 设置 x 轴标签
ylabel('解');  % 设置 y 轴标签
legend('x(t)', 'y(t)');  % 添加图例
title('微分方程组的解函数图形');  % 设置图形标题
grid on;  % 打开网格

% 微分方程组定义
% 该函数定义了微分方程组的右侧部分
function dYdt = differentialEquationSystem(time, stateVector)
    % 提取状态向量中的 x 和 y
    stateX = stateVector(1);
    stateY = stateVector(2);
    % 定义 dx/dt
    dxdt = exp(time) - 5*stateX - stateY;
    % 定义 dy/dt
    dydt = stateX + 3*stateY;
    % 返回微分方程组的导数
    dYdt = [dxdt; dydt];
end
