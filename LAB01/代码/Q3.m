% 初始化求和值
total_sum = 0; % 使用不常见的变量名称 total_sum 作为累加和的初始值

% 计算 m^2 的和，m 从 1 到 10
for m = 1:10
    total_sum = total_sum + m^2; % 在每次循环中，将 m^2 加到 total_sum 中
end

% 显示结果
fprintf('1 到 10 的 n^2 的和为: %d\n', total_sum); % 使用 fprintf 函数格式化输出结果
