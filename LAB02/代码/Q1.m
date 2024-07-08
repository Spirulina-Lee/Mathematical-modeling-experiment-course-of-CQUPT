% 目标函数的系数向量
objectiveFunctionCoefficients = [5 1 2 3 1];

% 不等式约束的系数矩阵
inequalityConstraintMatrix = [-2 1 -1 1 -3;
                              2 3 -1 2 1];
                              
% 不等式约束的常数项向量
inequalityConstraintVector = [1; -2];

% 变量的下界向量，表示每个变量的最小值
lowerBounds = zeros(5,1);

% 变量的上界向量，表示每个变量的最大值
upperBounds = 2*ones(5,1);

% 使用线性规划求解器求解线性规划问题
% 其中，'linprog' 是 MATLAB 中用于求解线性规划问题的函数
% 'objectiveFunctionCoefficients' 是目标函数的系数向量
% 'inequalityConstraintMatrix' 是不等式约束的系数矩阵
% 'inequalityConstraintVector' 是不等式约束的常数项向量
% 'lowerBounds' 是变量的下界向量
% 'upperBounds' 是变量的上界向量
% 求解后，'solutionVector' 将包含最优解，'optimalValue' 将包含最优值
[solutionVector, optimalValue] = linprog(objectiveFunctionCoefficients, ...
                                         inequalityConstraintMatrix, ...
                                         inequalityConstraintVector, [], [], ...
                                         lowerBounds, upperBounds);

% 显示求解结果
% 'fprintf' 用于打印格式化字符串
% 打印最优解的提示信息
fprintf('最优解 x:\n');
% 使用 'disp' 函数显示最优解向量
disp(solutionVector);

% 打印最优值的提示信息
fprintf('最优值 f:\n');
% 使用 'disp' 函数显示最优值
disp(optimalValue);
