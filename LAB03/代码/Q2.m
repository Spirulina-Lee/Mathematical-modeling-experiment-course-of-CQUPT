% 定义目标函数
% 该匿名函数使用输入向量 x 来计算特定数学表达式的值
objectiveFunction = @(inputVector) -0.2 * inputVector(1)^4 * inputVector(2) * inputVector(3)^2 / 10^7;

% 设置变量的下界和上界
% 下界向量
lowerBounds = [0, 0, 0];
% 上界向量
upperBounds = [36, 5, 125];

% 初始猜测点
% 优化算法的初始搜索点
initialGuess = [18, 2.5, 62.5];

% 使用 fmincon 命令求解问题
% 'fmincon' 是 MATLAB 中用于求解带约束的非线性优化问题的函数
% 'objectiveFunction' 是目标函数
% 'initialGuess' 是初始搜索点
% 'lowerBounds' 是变量的下界向量
% 'upperBounds' 是变量的上界向量
% 'nonlinearConstraints' 是定义非线性约束的函数句柄
% 'optimizationOptions' 是优化选项，'Algorithm' 设置为 'sqp' 表示使用序列二次规划算法
optimizationOptions = optimoptions('fmincon', 'Algorithm', 'sqp');
[optimalSolution, optimalValue] = fmincon(objectiveFunction, initialGuess, [], [], [], [], lowerBounds, upperBounds, @nonlinearConstraints, optimizationOptions);

% 显示结果
% 使用 'fprintf' 打印格式化字符串
fprintf('找到的最优解为:\n');  % 打印最优解提示信息
fprintf('x1 = %.4f\n', optimalSolution(1));  % 显示 x1 的值
fprintf('x2 = %.4f\n', optimalSolution(2));  % 显示 x2 的值
fprintf('x3 = %.4f\n', optimalSolution(3));  % 显示 x3 的值
fprintf('z 的最大值 = %.4e\n', -optimalValue);  % 显示目标函数的最大值

% 定义非线性约束
% 该函数定义了优化问题中的非线性不等式约束
function [inequalityConstraints, equalityConstraints] = nonlinearConstraints(inputVector)
    % 非线性不等式约束 1: 675 - x1^2 * x2 >= 0
    inequalityConstraints(1) = - (675 - inputVector(1)^2 * inputVector(2));
    % 非线性不等式约束 2: 0.418 - x1^2 * x3^2 / 10^7 >= 0
    inequalityConstraints(2) = - (0.418 - inputVector(1)^2 * inputVector(3)^2 / 10^7);
    % 没有非线性等式约束
    equalityConstraints = [];
end
