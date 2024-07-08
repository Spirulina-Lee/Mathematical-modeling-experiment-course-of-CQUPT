% 定义数据
% 温度数据 (摄氏度)
temperatureData = [100 200 300 400 500 600 700 800 900 1000]; 
% 对应的浓度数据 (乘以 1e3)
concentrationData = [4.54 4.99 5.35 5.65 5.90 6.10 6.26 6.39 6.50 6.59] * 1e3; 

% 使用 polyfit 进行二次多项式拟合
% 'polyfit' 函数用于进行多项式拟合
% 'temperatureData' 是自变量数据
% 'concentrationData' 是因变量数据
% 2 表示拟合二次多项式
polynomialCoefficients = polyfit(temperatureData, concentrationData, 2);

% 提取拟合参数
% a 是二次项系数
coefficientA = polynomialCoefficients(1); 
% b 是一次项系数
coefficientB = polynomialCoefficients(2); 
% k 是常数项
coefficientK = polynomialCoefficients(3); 

% 显示拟合参数
disp('拟合参数:');
disp(['a = ', num2str(coefficientA)]);
disp(['b = ', num2str(coefficientB)]);
disp(['k = ', num2str(coefficientK)]);
