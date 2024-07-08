% 定义函数
g = @(u, v) 2*u.^2 + v.^2; % 使用匿名函数 g 定义函数表达式

% 创建网格
[U, V] = meshgrid(-10:0.5:10, -10:0.5:10); % 使用 meshgrid 函数生成从 -10 到 10，每隔 0.5 间隔的网格

% 计算函数值
W = g(U, V); % 计算对应的函数值

% 使用 surf 绘制曲面图
figure; % 创建一个新的图形窗口
subplot(1, 2, 1); % 创建一个 1 行 2 列的子图，并激活第一个子图
surf(U, V, W); % 使用 surf 函数绘制曲面图
title('使用 surf 绘制曲面图'); % 为图形添加标题
xlabel('x'); % 为 x 轴添加标签
ylabel('y'); % 为 y 轴添加标签
zlabel('z'); % 为 z 轴添加标签

% 使用 mesh 绘制网格图
subplot(1, 2, 2); % 激活第二个子图
mesh(U, V, W); % 使用 mesh 函数绘制网格图
title('使用 mesh 绘制网格图'); % 为图形添加标题
xlabel('x'); % 为 x 轴添加标签
ylabel('y'); % 为 y 轴添加标签
zlabel('z'); % 为 z 轴添加标签
