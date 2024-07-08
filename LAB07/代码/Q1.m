% 数据输入
% 定义身高数据 (cm)
heightData = [145, 146, 147, 149, 150, 153, 154, 155, 156, 157, 158, 159, 160, 162];
% 定义腿长数据 (cm)
legLengthData = [88, 89, 91, 92, 93, 93, 85, 96, 98, 97, 96, 98, 99, 103];

% 线性回归计算
% 使用 polyfit 函数进行线性回归拟合，拟合阶数为1
linearFitCoefficients = polyfit(heightData, legLengthData, 1);

% 打印线性回归系数
% 打印斜率 (a)
fprintf('线性回归系数 a (斜率): %.4f\n', linearFitCoefficients(1));
% 打印截距 (b)
fprintf('线性回归系数 b (截距): %.4f\n', linearFitCoefficients(2));

% 生成线性空间用于画图
% 在身高数据的最小值和最大值之间生成100个等间距点
linearSpaceHeight = linspace(min(heightData), max(heightData), 100);
% 计算这些点对应的腿长值
linearSpaceLegLength = polyval(linearFitCoefficients, linearSpaceHeight);

% 画出散点图和回归直线
% 创建新的图形窗口
figure;
% 画出原始数据的散点图 (蓝色星号) 和回归直线 (红色实线)
plot(heightData, legLengthData, '*b', linearSpaceHeight, linearSpaceLegLength, 'r');
% 设置 X 轴标签
xlabel('身高 (cm)');
% 设置 Y 轴标签
ylabel('腿长 (cm)');
% 设置图形标题
title('身高与腿长的线性回归');
% 添加图例
legend('原始数据', '拟合直线');
% 打开网格
grid on;
