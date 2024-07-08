% 数据输入
% 定义碳含量数据 (%)
carbonContentData = [0.10, 0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18]; 
% 定义合金强度数据
alloyStrengthData = [42.0, 41.5, 45.0, 45.5, 45.0, 47.5, 49.0, 55.0, 50.0]; 

% 线性回归计算
% 使用 polyfit 函数进行线性回归拟合，拟合阶数为1
linearRegressionCoefficients = polyfit(carbonContentData, alloyStrengthData, 1);

% 打印线性回归系数
fprintf('线性回归系数 a (斜率): %.4f\n', linearRegressionCoefficients(1)); % 打印斜率
fprintf('线性回归系数 b (截距): %.4f\n', linearRegressionCoefficients(2)); % 打印截距

% 生成线性空间用于画图
% 在碳含量数据的最小值和最大值之间生成100个等间距点
linearSpaceCarbonContent = linspace(min(carbonContentData), max(carbonContentData), 100); 
% 计算这些点对应的合金强度值
linearSpaceAlloyStrength = polyval(linearRegressionCoefficients, linearSpaceCarbonContent); 

% 画出散点图和回归直线
figure; % 创建新的图形窗口
% 画出原始数据的散点图 (蓝色圆圈) 和回归直线 (绿色实线)
plot(carbonContentData, alloyStrengthData, 'ob', linearSpaceCarbonContent, linearSpaceAlloyStrength, 'g'); 
xlabel('碳含量 (%)'); % 设置 X 轴标签
ylabel('合金强度'); % 设置 Y 轴标签
title('合金强度与碳含量的线性回归'); % 设置图形标题
legend('原始数据', '拟合直线'); % 添加图例
grid on; % 打开网格
