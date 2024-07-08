% 数据输入
% 定义需求量数据
productDemand = [75, 80, 70, 50, 65, 90, 100, 110];
% 定义收入数据
consumerIncome = [600, 1200, 500, 300, 400, 1250, 1100, 1300];
% 定义价格数据
productPrice = [7, 6, 7, 8, 7, 5, 4, 3];

% 线性回归
% 构建线性回归模型矩阵
linearModelMatrix = [ones(length(consumerIncome), 1), consumerIncome', productPrice'];
% 计算线性回归系数
linearRegressionCoefficients = (linearModelMatrix' * linearModelMatrix) \ linearModelMatrix' * productDemand';
% 显示线性回归系数
disp('线性回归系数:');
disp(linearRegressionCoefficients);

% 多项式回归（二次回归）
% 构建多项式回归模型矩阵
polynomialModelMatrix = [ones(length(consumerIncome), 1), consumerIncome', productPrice', consumerIncome'.^2, productPrice'.^2];
% 计算多项式回归系数
polynomialRegressionCoefficients = (polynomialModelMatrix' * polynomialModelMatrix) \ polynomialModelMatrix' * productDemand';
% 显示多项式回归系数
disp('多项式回归系数:');
disp(polynomialRegressionCoefficients);

% 非线性回归（简单指数模型）
% 准备 X 和 Y 数据
% X 数据包含收入和价格
nonlinearXData = [consumerIncome', productPrice'];
% 对需求量取对数进行非线性拟合
logDemand = log(productDemand');
% 构建指数模型的矩阵
exponentialModelMatrix = [ones(size(nonlinearXData, 1), 1), nonlinearXData];
% 计算指数模型的回归系数
exponentialRegressionCoefficients = (exponentialModelMatrix' * exponentialModelMatrix) \ exponentialModelMatrix' * logDemand;

% 将回归系数转化回非线性模型的参数
interceptExp = exp(exponentialRegressionCoefficients(1));
incomeCoefficientExp = exponentialRegressionCoefficients(2);
priceCoefficientExp = exponentialRegressionCoefficients(3);
% 显示非线性回归系数 (指数模型)
disp('非线性回归系数 (指数模型):');
fprintf('y = %.2fe^(%.2fx1 + %.2fx2)\n', interceptExp, incomeCoefficientExp, priceCoefficientExp);

% 预测
% 测试数据
testIncome = 1000;
testPrice = 6;
% 线性回归预测
predictedDemandLinear = [1, testIncome, testPrice] * linearRegressionCoefficients;
% 多项式回归预测
predictedDemandPoly = [1, testIncome, testPrice, testIncome^2, testPrice^2] * polynomialRegressionCoefficients;
% 非线性回归预测
predictedDemandExp = interceptExp * exp(incomeCoefficientExp * testIncome + priceCoefficientExp * testPrice);
% 显示预测结果
fprintf('线性回归预测需求量: %.2f\n', predictedDemandLinear);
fprintf('多项式回归预测需求量: %.2f\n', predictedDemandPoly);
fprintf('非线性回归预测需求量: %.2f\n', predictedDemandExp);
