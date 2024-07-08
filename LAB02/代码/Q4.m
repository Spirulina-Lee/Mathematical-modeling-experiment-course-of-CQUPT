% 定义成本函数系数
costCoefficients = [3, 7, 5, 6];

% 定义不等式约束矩阵和向量
inequalityConstraintsMatrix = [
    -0.4, -1.5, -1.0, -0.7;  % 蛋白质需求
    -0.06, -0.2, -0.1, -0.9; % 维生素需求
    -0.5, -0.3, -0.4, -0.6;  % 脂肪需求
     1, 1, 1, 1              % 总量限制
];
inequalityConstraintsVector = [-80; -20; -10; 200];

% 定义变量的下界
lowerBoundsVector = [0, 0, 0, 0];

% 求解线性规划问题
% 使用线性规划求解器求解线性规划问题，'linprog' 是 MATLAB 中用于求解线性规划问题的函数
% 'costCoefficients' 是目标函数的系数向量
% 'inequalityConstraintsMatrix' 是不等式约束的系数矩阵
% 'inequalityConstraintsVector' 是不等式约束的常数项向量
% 'lowerBoundsVector' 是变量的下界向量
% 求解后，'optimalFeedAmounts' 将包含最优解，'minimalCost' 将包含最优值
[optimalFeedAmounts, minimalCost] = linprog(costCoefficients, ...
                                            inequalityConstraintsMatrix, ...
                                            inequalityConstraintsVector, [], [], ...
                                            lowerBoundsVector, []);

% 显示求解结果
% 使用 'disp' 函数显示结果
disp('每天应该购买的饲料量分别为（公斤）：');  % 打印最优解提示信息
disp(optimalFeedAmounts);  % 显示每天购买的饲料量
disp('每日最小成本为：');  % 打印最优值提示信息
disp(minimalCost);  % 显示每日最小成本
