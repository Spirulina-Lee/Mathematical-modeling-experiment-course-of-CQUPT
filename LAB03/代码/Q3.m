% 参数定义
% 定义成本系数 a
costCoefficientA = 40;
% 定义成本系数 b
costCoefficientB = 0.2;
% 定义成本系数 c
costCoefficientC = 4;
% 定义季度需求 D
quarterlyDemand = [40, 60, 80];
% 定义最大生产量
maximumProduction = 100;

% 目标函数
% 该匿名函数使用输入向量 x 来计算总成本
objectiveFunction = @(productionLevels) ...
    (costCoefficientA*productionLevels(1) + costCoefficientB*productionLevels(1)^2) + ...
    (costCoefficientA*productionLevels(2) + costCoefficientB*productionLevels(2)^2) + ...
    (costCoefficientA*productionLevels(3) + costCoefficientB*productionLevels(3)^2) + ...
    costCoefficientC*(productionLevels(1) - quarterlyDemand(1)) + ...
    costCoefficientC*(productionLevels(2) + (productionLevels(1) - quarterlyDemand(1)) - quarterlyDemand(2)) + ...
    costCoefficientC*(productionLevels(3) + (productionLevels(2) + (productionLevels(1) - quarterlyDemand(1)) - quarterlyDemand(2)) - quarterlyDemand(3));

% 初始猜测
% 优化算法的初始搜索点
initialGuess = [0, 0, 0];

% 线性不等式约束
linearInequalityMatrix = [];
linearInequalityVector = [];

% 线性等式约束
linearEqualityMatrix = [];
linearEqualityVector = [];

% 下界和上界
% 定义变量的下界向量
lowerBounds = [0, 0, 0];
% 定义变量的上界向量
upperBounds = [maximumProduction, maximumProduction, maximumProduction];

% 非线性约束
% 定义非线性约束函数
nonlinearConstraints = @(productionLevels) deal([], ...
    [productionLevels(1) - quarterlyDemand(1); ...
    productionLevels(2) + (productionLevels(1) - quarterlyDemand(1)) - quarterlyDemand(2); ...
    productionLevels(3) + (productionLevels(2) + (productionLevels(1) - quarterlyDemand(1)) - quarterlyDemand(2)) - quarterlyDemand(3)]);

% 求解
% 使用 fmincon 命令求解问题
% 'fmincon' 是 MATLAB 中用于求解带约束的非线性优化问题的函数
% 'objectiveFunction' 是目标函数
% 'initialGuess' 是初始搜索点
% 'linearInequalityMatrix' 是线性不等式约束的系数矩阵
% 'linearInequalityVector' 是线性不等式约束的常数向量
% 'linearEqualityMatrix' 是线性等式约束的系数矩阵
% 'linearEqualityVector' 是线性等式约束的常数向量
% 'lowerBounds' 是变量的下界向量
% 'upperBounds' 是变量的上界向量
% 'nonlinearConstraints' 是定义非线性约束的函数句柄
% 'optimizationOptions' 是优化选项，'Display' 设置为 'iter' 表示每次迭代都显示输出
optimizationOptions = optimoptions('fmincon', 'Display', 'iter');
[optimalProductionLevels, minimalTotalCost] = fmincon(objectiveFunction, initialGuess, ...
    linearInequalityMatrix, linearInequalityVector, ...
    linearEqualityMatrix, linearEqualityVector, ...
    lowerBounds, upperBounds, nonlinearConstraints, optimizationOptions);

% 显示结果
% 使用 'disp' 函数显示结果
disp('每季度的生产量分别为：');  % 打印每季度的生产量提示信息
disp(optimalProductionLevels);  % 显示每季度的生产量
disp('最小总成本为：');  % 打印最小总成本提示信息
disp(minimalTotalCost);  % 显示最小总成本
