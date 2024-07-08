% 定义函数
% 该匿名函数使用输入向量 x 来计算特定数学表达式的值
objectiveFunction = @(inputVector) -20*exp(-0.2*sqrt(0.5*(inputVector(1)^2 + inputVector(2)^2))) - exp(0.5*(cos(2*pi*inputVector(1)) + cos(2*pi*inputVector(2)))) + 21.731;

% 初始点
% 优化算法的初始搜索点
initialPoint = [0, 0];

% 设置优化选项
% 'optimset' 函数用于创建或修改优化选项结构体
% 'Display' 选项设置为 'iter'，表示每次迭代都显示输出
optimizationOptions = optimset('Display', 'iter');

% 使用 fminunc 命令求解
% 'fminunc' 是 MATLAB 中用于求解无约束非线性优化问题的函数
% 'objectiveFunction' 是目标函数
% 'initialPoint' 是初始搜索点
% 'optimizationOptions' 是优化选项
% 求解后，'optimalSolution' 将包含最优解，'optimalValue' 将包含最优值
[optimalSolution, optimalValue] = fminunc(objectiveFunction, initialPoint, optimizationOptions);

% 显示结果
% 使用 'fprintf' 打印格式化字符串
fprintf('最优解 x:\n');  % 打印最优解提示信息
% 使用 'disp' 显示最优解向量
disp(optimalSolution);

% 打印最优值提示信息
fprintf('最优值 f:\n');
% 使用 'disp' 显示最优值
disp(optimalValue);
