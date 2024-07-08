% 定义数列通项公式
% 预分配数组以存储计算结果
sequenceF = zeros(1, 20);
% 设置初始条件
sequenceF(1) = 1; % 初始条件
sequenceF(2) = 1; % 初始条件

% 计算前20项
% 使用 for 循环迭代计算数列的每一项
for termIndex = 3:20
    sequenceF(termIndex) = 2 * sequenceF(termIndex-2) + sequenceF(termIndex-1);
end

% 显示前20项
% 使用 disp 函数显示数列的前20项
disp('数列的前20项为：')
disp(sequenceF)

% 绘制数列图形
% 使用 figure 函数创建新的图形窗口
figure;
% 使用 stem 函数绘制数列的离散图形
stem(1:20, sequenceF, 'filled');
title('数列 F_n 的前20项'); % 设置图形标题
xlabel('n'); % 设置 x 轴标签
ylabel('F_n'); % 设置 y 轴标签
