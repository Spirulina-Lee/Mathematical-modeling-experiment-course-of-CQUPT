% 初始条件
% 定义微分方程组的初始条件
initialConditions = [1; 0.5];

% 时间范围
% 定义求解微分方程组的时间范围
timeSpan = [0 30];

% 使用 ode45 求解方程组
% 'ode45' 是 MATLAB 中用于求解常微分方程的数值解函数
% '@differentialEquationSystem' 是包含微分方程组的函数句柄
% 'timeSpan' 是求解时间范围
% 'initialConditions' 是初始条件向量
[timePoints, solutionMatrix] = ode45(@differentialEquationSystem, timeSpan, initialConditions);

% 绘制解的图形
% 使用 figure 函数创建新的图形窗口
figure;
% 使用 plot 函数绘制 x(t) 的图形
plot(timePoints, solutionMatrix(:,1), '-', 'DisplayName', 'x(t)');
hold on;
% 使用 plot 函数绘制 y(t) 的图形
plot(timePoints, solutionMatrix(:,2), '-', 'DisplayName', 'y(t)');
xlabel('时间 t'); % 设置 x 轴标签
ylabel('解 x(t) 和 y(t)'); % 设置 y 轴标签
legend; % 显示图例
title('微分方程组的解'); % 设置图形标题
grid on; % 打开网格
hold off;

% 定义微分方程组
% 该函数定义了微分方程组的右侧部分
function dydt = differentialEquationSystem(time, stateVector)
    % 初始化导数列向量
    derivatives = zeros(2,1);
    % 定义 dx/dt
    derivatives(1) = -stateVector(1)^3 - stateVector(2); % dx/dt = -x^3 - y
    % 定义 dy/dt
    derivatives(2) = stateVector(1) - stateVector(2)^3;  % dy/dt = x - y^3
    % 返回导数向量
    dydt = derivatives;
end
