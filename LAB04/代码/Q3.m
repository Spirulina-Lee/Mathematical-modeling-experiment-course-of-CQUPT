% 初始条件
% 定义微分方程组的初始条件
initialConditions = [1; 1; 1]; % 可以根据具体情况调整初始条件

% 时间范围
% 定义求解微分方程组的时间范围
timeSpan = [0 10]; % 可以根据具体情况调整时间范围

% 使用 ode45 求解
% 'ode45' 是 MATLAB 中用于求解常微分方程的数值解函数
% '@linearDifferentialEquationSystem' 是包含线性微分方程组的函数句柄
% 'timeSpan' 是求解时间范围
% 'initialConditions' 是初始条件向量
[timePoints, solutionMatrix] = ode45(@linearDifferentialEquationSystem, timeSpan, initialConditions);

% 显示解
% 使用 disp 函数显示解的时间点和解
disp('解的时间点:');
disp(timePoints);
disp('解:');
disp(solutionMatrix);

% 绘图
% 使用 figure 函数创建新的图形窗口
figure;
% 使用 plot 函数绘制解的图形
plot(timePoints, solutionMatrix(:,1), '-', ...  % 绘制 x(t) 的图形，实线
     timePoints, solutionMatrix(:,2), '-', ...  % 绘制 y(t) 的图形，实线
     timePoints, solutionMatrix(:,3), '.');     % 绘制 z(t) 的图形，点
xlabel('时间 t'); % 设置 x 轴标签
ylabel('解 y'); % 设置 y 轴标签
legend('x(t)', 'y(t)', 'z(t)'); % 添加图例
title('线性微分方程组的解'); % 设置图形标题
grid on; % 打开网格

% 定义线性微分方程组
% 该函数定义了线性微分方程组的右侧部分
function dydt = linearDifferentialEquationSystem(time, stateVector)
    % 定义系数矩阵 A
    coefficientMatrix = [2 -3 2; 4 -5 3; 4 -4 2];
    % 计算导数 dydt
    dydt = coefficientMatrix * stateVector;
end
