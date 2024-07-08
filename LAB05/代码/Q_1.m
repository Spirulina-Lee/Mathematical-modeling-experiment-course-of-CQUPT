% 定义初始条件和方程参数
% 定义初始条件 y0
initialConditionY0 = 1; % 可以选择任意初始值
% 定义计算的项数
numberOfTerms = 20; % 计算的项数
% 预分配数组以存储计算结果
solutionSequence = zeros(1, numberOfTerms); % 预分配数组
% 设置初始条件
solutionSequence(1) = initialConditionY0;

% 迭代计算通解
% 使用 for 循环迭代计算通解的每一项
for termIndex = 1:numberOfTerms-1
    solutionSequence(termIndex+1) = (solutionSequence(termIndex) + 4) / 3;
end

% 显示前 numberOfTerms 项
% 使用 disp 函数显示差分方程的前20项
disp('差分方程的前20项为：')
disp(solutionSequence)

% 绘制数列图形
% 使用 figure 函数创建新的图形窗口
figure;
% 使用 stem 函数绘制数列的离散图形
stem(1:numberOfTerms, solutionSequence, 'filled');
title('差分方程的通解的前20项'); % 设置图形标题
xlabel('n'); % 设置 x 轴标签
ylabel('y_n'); % 设置 y 轴标签
