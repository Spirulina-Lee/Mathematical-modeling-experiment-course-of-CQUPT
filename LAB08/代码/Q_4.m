% 练习4：海域水深插值和等高线图

% 定义数据
% X 坐标数据
xCoordinates = [129 140 103.5 88 185.5 195 105 157.5 107.5 77 81 162 162 117.5];
% Y 坐标数据
yCoordinates = [7.5 141.5 23 147 22.5 137.5 85.5 -6.5 -81 3 56.5 -66.5 84 -33.5];
% 水深数据 (英尺)
depthData = [4 8 6 8 6 8 8 9 9 8 8 9 4 9];

% 定义矩形区域的网格
% X 轴范围
gridXRange = 75:0.5:200;
% Y 轴范围
gridYRange = -50:0.5:150;
% 创建 X 和 Y 坐标的网格点
[gridX, gridY] = meshgrid(gridXRange, gridYRange);

% 三次插值
% 使用三次插值法估计网格点的水深
interpolatedDepths = griddata(xCoordinates, yCoordinates, depthData, gridX, gridY, 'cubic');

% 绘制海域水深插值图
% 创建新的图形窗口
figure;
% 使用 mesh 函数绘制插值后的三维网格图
mesh(gridX, gridY, interpolatedDepths);
title('海域水深插值图'); % 设置图形标题
xlabel('X 坐标'); % 设置 X 轴标签
ylabel('Y 坐标'); % 设置 Y 轴标签
zlabel('水深'); % 设置 Z 轴标签

% 绘制海域水深等高线图
% 创建新的图形窗口
figure;
% 使用 contour 函数绘制等高线图，并设置等高线值为 5.2 英尺
contour(gridX, gridY, interpolatedDepths, [5.2 5.2]);
title('船需避免进入区域（吃水深度5.2英尺）'); % 设置图形标题
xlabel('X 坐标'); % 设置 X 轴标签
ylabel('Y 坐标'); % 设置 Y 轴标签
hold on;
% 使用 plot 函数绘制原始数据点，标记为红色加号
plot(xCoordinates, yCoordinates, 'r+');

% 使用 fill 函数绘制浅蓝色区域，表示不能进入的地方
% 首先确定等高线为 5.2 的区域
[C, h] = contour(gridX, gridY, interpolatedDepths, [5.2 5.2]);
% 提取等高线坐标
xAvoid = C(1, 2:end);
yAvoid = C(2, 2:end);
% 使用 fill 函数填充等高线包围区域
fill(xAvoid, yAvoid, 'c', 'FaceAlpha', 0.3);

hold off;
