% 定义函数
g = @(u) 2 * sin(3 * u + pi / 3); % 使用匿名函数 g 定义函数表达式

% 生成 u 值范围从 -2π 到 2π
u = linspace(-2*pi, 2*pi, 1000); % 使用 linspace 函数生成 1000 个在 -2π 到 2π 之间均匀分布的点
v = g(u); % 计算对应的函数值

% 使用 plot 绘制图像
figure; % 创建一个新的图形窗口
subplot(2, 1, 1); % 创建一个 2 行 1 列的子图，并激活第一个子图
plot(u, v); % 绘制 u 和 v 之间的关系图
title('使用 plot() 绘制图像'); % 为图形添加标题
xlabel('x'); % 为 x 轴添加标签
ylabel('y'); % 为 y 轴添加标签
grid on; % 启用网格

% 使用 fplot 绘制图像
subplot(2, 1, 2); % 激活第二个子图
fplot(g, [-2*pi, 2*pi]); % 使用 fplot 函数绘制 g 在 [-2π, 2π] 区间上的图像
title('使用 fplot() 绘制图像'); % 为图形添加标题
xlabel('x'); % 为 x 轴添加标签
ylabel('y'); % 为 y 轴添加标签
grid on; % 启用网格
