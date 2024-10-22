% 数据输入
% 定义气温数据 (°C)
temperatureData = [24.32, 31.75, 18.95, 17.65, 24.44, 27.06, 22.77, 25.10, 15.27, 29.18, 30.20, 5.17, 23.15, 41.10, 7.04, 20.53, 37.98, 45.20, 16.80, 23.68, 21.54, 13.80, 16.71, 35.20, 6.30, 23.61, 21.49, 30.81, 46.97, 11.39, 38.68, 13.65, 33.74, 27.12, 17.22, 13.57, 19.20, 26.51, 16.19, 6.73, 21.74, 25.84, 1.30, 21.66, 16.08, 11.02, 33.11, 16.28, 21.56, 15.27, 21.95, 11.59, 18.94, 4.87, 11.13, 27.16, 33.47, 5.63, 11.23, 0.08, 21.32, 1.24, 9.91, 33.01, 7.21, 16.63, 6.60, 24.43, 12.56, 21.89, 12.18, 23.16, 15.00, 31.43, 22.61, 15.57, 30.91, 21.06, 16.40, 30.77, 14.47, 22.56, 32.03, 17.73, 22.00, 36.85, 43.25, 41.04, 20.20, 20.70, 29.42, 26.83, 26.79, 23.01, 17.15, 31.93, 35.00, 14.14, 16.61, 17.51];
% 定义热饮杯数数据
hotDrinkCounts = [55, 22, 76, 67, 55, 46, 44, 55, 57, 34, 31, 89, 63, 25, 108, 57, 17, 9, 65, 43, 62, 65, 51, 13, 77, 71, 69, 43, 2, 68, 16, 66, 29, 58, 68, 79, 46, 52, 90, 97, 51, 49, 108, 61, 68, 78, 35, 69, 49, 54, 57, 65, 56, 119, 87, 26, 56, 84, 94, 108, 58, 105, 79, 14, 113, 62, 86, 50, 66, 61, 85, 58, 53, 43, 62, 72, 35, 85, 68, 47, 59, 45, 29, 53, 60, 28, 20, 16, 49, 53, 43, 43, 36, 54, 67, 46, 34, 54, 71, 74];

% 线性回归计算
% 使用 polyfit 函数进行线性回归拟合，拟合阶数为1
linearRegressionCoefficients = polyfit(temperatureData, hotDrinkCounts, 1);

% 打印线性回归系数
fprintf('线性回归系数 a (斜率): %.4f\n', linearRegressionCoefficients(1)); % 打印斜率
fprintf('线性回归系数 b (截距): %.4f\n', linearRegressionCoefficients(2)); % 打印截距

% 生成线性空间用于画图
% 在气温数据的最小值和最大值之间生成100个等间距点
linearSpaceTemperature = linspace(min(temperatureData), max(temperatureData), 100); 
% 计算这些点对应的热饮杯数值
linearSpaceHotDrinks = polyval(linearRegressionCoefficients, linearSpaceTemperature); 

% 画出散点图和回归直线
figure; % 创建新的图形窗口
% 画出原始数据的散点图 (蓝色圆圈) 和回归直线 (绿色实线)
plot(temperatureData, hotDrinkCounts, 'ob', linearSpaceTemperature, linearSpaceHotDrinks, 'g'); 
xlabel('气温 (°C)'); % 设置 X 轴标签
ylabel('热饮杯数'); % 设置 Y 轴标签
title('气温与热饮杯数的线性回归'); % 设置图形标题
legend('原始数据', '拟合直线'); % 添加图例
grid on; % 打开网格
