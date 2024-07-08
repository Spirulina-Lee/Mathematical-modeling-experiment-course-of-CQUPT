% 定义成本系数矩阵（利率）
% 每家银行的贷款利率
interestRatesMatrix = [
    0.061, 0.050, 0.065; % 银行1的利率
    0.062, 0.052, 0.062; % 银行2的利率
    0.065, 0.055, 0.058  % 银行3的利率
];

% 展平为一维向量
% 将利率矩阵转换为列向量
interestRatesVector = interestRatesMatrix(:);

% 定义不等式约束矩阵和向量
% 不等式约束矩阵，用于限制每家商店的借贷需求和每家银行的贷款额度
inequalityConstraintsMatrix = [
    -1,  0,  0, -1,  0,  0, -1,  0,  0; % 北京店需求
     0, -1,  0,  0, -1,  0,  0, -1,  0; % 上海店需求
     0,  0, -1,  0,  0, -1,  0,  0, -1; % 重庆店需求
     1,  1,  1,  0,  0,  0,  0,  0,  0; % 银行1额度
     0,  0,  0,  1,  1,  1,  0,  0,  0; % 银行2额度
     0,  0,  0,  0,  0,  0,  1,  1,  1  % 银行3额度
];
% 不等式约束向量，用于限制商店的借贷需求和银行的贷款额度
inequalityConstraintsVector = [-170; -250; -100; 300; 300; 300];

% 定义变量的下界和上界
% 变量的下界为0
lowerBoundsVector = zeros(9, 1);
% 变量的上界为空，表示没有上限
upperBoundsVector = [];

% 使用 linprog 求解线性规划问题
% 'linprog' 是 MATLAB 中用于求解线性规划问题的函数
% 'interestRatesVector' 是目标函数的系数向量
% 'inequalityConstraintsMatrix' 是不等式约束的系数矩阵
% 'inequalityConstraintsVector' 是不等式约束的常数向量
% 'lowerBoundsVector' 是变量的下界向量
% 'upperBoundsVector' 是变量的上界向量
% 'optimizationOptions' 是优化选项，'Display' 设置为 'iter' 表示每次迭代都显示输出
optimizationOptions = optimoptions('linprog', 'Display', 'iter');
[optimalLoanAmounts, minimalTotalInterest] = linprog(interestRatesVector, ...
    inequalityConstraintsMatrix, inequalityConstraintsVector, [], [], ...
    lowerBoundsVector, upperBoundsVector, optimizationOptions);

% 显示结果
% 检查优化结果的数量是否符合预期
if numel(optimalLoanAmounts) == 9
    disp('每个银行为每个商店的借贷金额分别为（万元）：');  % 打印借贷金额提示信息
    % 将结果重塑为3x3矩阵，并转置以方便查看
    disp(reshape(optimalLoanAmounts, 3, 3)');
else
    disp('优化结果的数量不符合预期。');  % 打印错误信息
    disp(optimalLoanAmounts);  % 显示优化结果
end
disp('最小总利息支出为（万元）：');  % 打印最小总利息提示信息
disp(minimalTotalInterest);  % 显示最小总利息支出
