% 定义初始条件和方程参数
% 定义建筑面积 (平方米)
area = 130; 
% 定义单价 (元/平方米)
unitPrice = 5000; 
% 定义年利率
annualInterestRate = 0.0525; 
% 定义按揭贷款年限
loanYears = 20; 

% 计算房屋总价
% 房屋总价 = 建筑面积 * 单价
totalHousePrice = area * unitPrice;
disp(['房屋总价为：', num2str(totalHousePrice), ' 元']);

% 计算首付款金额
% 首付款金额 = 房屋总价 * 30%
initialPayment = totalHousePrice * 0.30;
disp(['首付款金额为：', num2str(initialPayment), ' 元']);

% 计算贷款金额
% 贷款金额 = 房屋总价 * 70%
loanPrincipal = totalHousePrice * 0.70;
disp(['贷款金额为：', num2str(loanPrincipal), ' 元']);

% 计算月利率
% 月利率 = 年利率 / 12
monthlyInterestRate = annualInterestRate / 12;
disp(['月利率为：', num2str(monthlyInterestRate)]);

% 计算按揭贷款的月供金额
% 总还款期数 (月)
totalPayments = loanYears * 12; 
% 月供金额计算公式
monthlyInstallment = loanPrincipal * monthlyInterestRate * (1 + monthlyInterestRate)^totalPayments / ((1 + monthlyInterestRate)^totalPayments - 1);
disp(['月供金额为：', num2str(monthlyInstallment), ' 元']);

% 定义方程和符号变量
syms symbolicArea symbolicUnitPrice symbolicInterestRate
% 定义符号表达式
symbolicTotalPrice = symbolicArea * symbolicUnitPrice;
symbolicInitialPayment = symbolicTotalPrice * 0.30;
symbolicLoanAmount = symbolicTotalPrice * 0.70;
symbolicMonthlyInterestRate = symbolicInterestRate / 12;
symbolicMonthlyPayment = symbolicLoanAmount * symbolicMonthlyInterestRate * (1 + symbolicMonthlyInterestRate)^(loanYears * 12) / ((1 + symbolicMonthlyInterestRate)^(loanYears * 12) - 1);

% 解析解
disp('房屋总价的符号解：');
disp(symbolicTotalPrice);
disp('首付款金额的符号解：');
disp(symbolicInitialPayment);
disp('贷款金额的符号解：');
disp(symbolicLoanAmount);
disp('月供金额的符号解：');
disp(symbolicMonthlyPayment);

% 求解当 S=130m2, P=5000 元/m2, r=5.25% 时三者的数值解
areaValue = 130;
unitPriceValue = 5000;
interestRateValue = 0.0525;
numericTotalPrice = double(subs(symbolicTotalPrice, [symbolicArea, symbolicUnitPrice], [areaValue, unitPriceValue]));
numericInitialPayment = double(subs(symbolicInitialPayment, [symbolicArea, symbolicUnitPrice], [areaValue, unitPriceValue]));
numericLoanAmount = double(subs(symbolicLoanAmount, [symbolicArea, symbolicUnitPrice], [areaValue, unitPriceValue]));
numericMonthlyPayment = double(subs(symbolicMonthlyPayment, [symbolicArea, symbolicUnitPrice, symbolicInterestRate], [areaValue, unitPriceValue, interestRateValue]));

disp(['当 S=130m2, P=5000 元/m2, r=5.25% 时，房屋总价为：', num2str(numericTotalPrice), ' 元']);
disp(['当 S=130m2, P=5000 元/m2, r=5.25% 时，首付款金额为：', num2str(numericInitialPayment), ' 元']);
disp(['当 S=130m2, P=5000 元/m2, r=5.25% 时，贷款金额为：', num2str(numericLoanAmount), ' 元']);
disp(['当 S=130m2, P=5000 元/m2, r=5.25% 时，月供金额为：', num2str(numericMonthlyPayment), ' 元']);

% 分析按月还款与按年还款哪个更有利
% 按年还款计算
annualInstallment = loanPrincipal * annualInterestRate / ((1 - (1 + annualInterestRate)^(-loanYears)));
disp(['按年还款的年供金额为：', num2str(annualInstallment), ' 元']);
disp(['按月还款的总支付金额为：', num2str(monthlyInstallment * totalPayments), ' 元']);
disp(['按年还款的总支付金额为：', num2str(annualInstallment * loanYears), ' 元']);

% 比较按月还款与按年还款的总支付金额
if monthlyInstallment * totalPayments < annualInstallment * loanYears
    disp('按月还款更有利。');
else
    disp('按年还款更有利。');
end
