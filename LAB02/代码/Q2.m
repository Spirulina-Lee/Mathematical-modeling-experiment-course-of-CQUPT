% 目标函数系数
objectiveCoefficients = [-2 -5];

% 不等式约束矩阵
inequalityConstraintMatrix = [1 0;
                              0 1;
                              1 1];
                              
% 不等式约束向量
inequalityConstraintVector = [4; 3; 8];

% 变量的下界
lowerBounds = zeros(2,1);

% 使用线性规划求解器求解线性规划问题
% 'linprog' 是 MATLAB 中的函数，用于求解线性规划问题
% 'objectiveCoefficients' 是目标函数的系数向量
% 'inequalityConstraintMatrix' 是不等式约束的系数矩阵
% 'inequalityConstraintVector' 是不等式约束的常数项向量
% 'lowerBounds' 是变量的下界向量
% 求解后，'optimalSolution' 将包含最优解，'optimalValue' 将包含最优值
[optimalSolution, optimalValue] = linprog(objectiveCoefficients, ...
                                          inequalityConstraintMatrix, ...
                                          inequalityConstraintVector, [], [], ...
                                          lowerBounds, []);

% 显示求解结果
% 使用 'fprintf' 打印格式化字符串
fprintf('最优解 x:\n');  % 打印最优解提示信息
% 使用 'disp' 显示最优解向量
disp(optimalSolution);

% 打印最优值提示信息
fprintf('最优值 f:\n');
% 使用 'disp' 显示最优值并将其取反，因为 linprog 求的是最小值
disp(-optimalValue);
