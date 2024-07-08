% 定义函数 g(a, b) = a + sin(a*b) + b^3
g = @(a, b) a + sin(a .* b) + b.^3; % 采用匿名函数定义方式，传入两个变量 a 和 b，计算表达式 a + sin(a*b) + b^3

% 提示用户输入第一个自变量的值
alpha = input('请输入自变量 x 的值: '); % 使用不常见的变量名称 alpha

% 提示用户输入第二个自变量的值
beta = input('请输入自变量 y 的值: '); % 使用不常见的变量名称 beta

% 计算函数值
output = g(alpha, beta); % 调用匿名函数 g，传入变量 alpha 和 beta，计算结果赋值给 output

% 显示结果
fprintf('f(%f, %f) = %f\n', alpha, beta, output); % 使用 fprintf 函数格式化输出结果
