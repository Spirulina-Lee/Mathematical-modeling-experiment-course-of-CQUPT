% 微分方程 (1) y' = 3y + 2
% 定义符号变量和函数
syms symbolicY1(symbolicX)
% 定义微分方程
differentialEquation1 = diff(symbolicY1, symbolicX) == 3*symbolicY1 + 2;
% 求解微分方程的解析解
solution1 = dsolve(differentialEquation1);
% 显示方程 (1) 的解析解
disp('方程 (1) 的解析解：');
disp(solution1);

% 微分方程 (2) y' + 2xy = x*e^{-x^2}
% 定义符号变量和函数
syms symbolicY2(symbolicX)
% 定义微分方程
differentialEquation2 = diff(symbolicY2, symbolicX) + 2*symbolicX*symbolicY2 == symbolicX*exp(-symbolicX^2);
% 求解微分方程的解析解
solution2 = dsolve(differentialEquation2);
% 显示方程 (2) 的解析解
disp('方程 (2) 的解析解：');
disp(solution2);

% 微分方程 (3) y'' = sin(2x) - y, y(0) = 0, y'(0) = 1
% 定义符号变量和函数
syms symbolicY3(symbolicX)
% 定义一阶导数
symbolicY3Prime = diff(symbolicY3, symbolicX);
% 定义微分方程
differentialEquation3 = diff(symbolicY3, symbolicX, 2) == sin(2*symbolicX) - symbolicY3;
% 定义初始条件
initialCondition1 = symbolicY3(0) == 0;
initialCondition2 = symbolicY3Prime(0) == 1;
% 将初始条件组合成一个向量
initialConditions = [initialCondition1, initialCondition2];
% 求解带初始条件的微分方程的解析解
solution3 = dsolve(differentialEquation3, initialConditions);
% 显示方程 (3) 的解析解
disp('方程 (3) 的解析解：');
disp(solution3);
