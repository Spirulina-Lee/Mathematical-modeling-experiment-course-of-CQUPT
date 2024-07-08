% 定义函数
% 该匿名函数使用输入变量 x1 和 x2 来计算特定数学表达式的值
complexFunction = @(inputX1, inputX2) -20*exp(-0.2*sqrt(0.5*(inputX1.^2 + inputX2.^2))) - exp(0.5*(cos(2*pi*inputX1) + cos(2*pi*inputX2))) + 21.731;

% 创建网格数据
% 使用 meshgrid 函数生成从 -5 到 5，步长为 0.1 的网格点
[gridX1, gridX2] = meshgrid(-5:0.1:5, -5:0.1:5);

% 计算函数值
% 使用定义的匿名函数计算每个网格点对应的函数值
functionValues = complexFunction(gridX1, gridX2);

% 绘制曲面图
% 创建一个新的图形窗口
figure;
% 绘制三维曲面图，X 轴和 Y 轴分别为网格数据，Z 轴为函数值
surf(gridX1, gridX2, functionValues);
% 设置图形标题
title('函数曲面图');
% 设置 X 轴标签
xlabel('x_1');
% 设置 Y 轴标签
ylabel('x_2');
% 设置 Z 轴标签
zlabel('f(x_1, x_2)');
