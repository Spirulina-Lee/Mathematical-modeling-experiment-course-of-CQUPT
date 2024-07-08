% 目标函数系数
objectiveFunctionCoefficients = [-70 -120];

% 不等式约束矩阵
inequalityConstraintsMatrix = [9 4;
                               4 5;
                               3 10];

% 不等式约束向量
inequalityConstraintsVector = [3600; 2000; 3000];

% 变量的下界
lowerBoundsVector = zeros(2,1);

% 求解线性规划问题
% 使用线性规划求解器求解线性规划问题，'linprog' 是 MATLAB 中用于求解线性规划问题的函数
% 'objectiveFunctionCoefficients' 是目标函数的系数向量
% 'inequalityConstraintsMatrix' 是不等式约束的系数矩阵
% 'inequalityConstraintsVector' 是不等式约束的常数项向量
% 'lowerBoundsVector' 是变量的下界向量
% 求解后，'solutionVector' 将包含最优解，'optimalValue' 将包含最优值
[solutionVector, optimalValue] = linprog(objectiveFunctionCoefficients, ...
                                         inequalityConstraintsMatrix, ...
                                         inequalityConstraintsVector, [], [], ...
                                         lowerBoundsVector, []);

% 显示求解结果
% 使用 'fprintf' 打印格式化字符串
fprintf('最优解 x:\n');  % 打印最优解提示信息
% 使用 'disp' 显示最优解向量
disp(solutionVector);

% 打印最优值提示信息
fprintf('最优值 f:\n');
% 使用 'disp' 显示最优值并将其取反，因为 linprog 求的是最小值
disp(-optimalValue);
