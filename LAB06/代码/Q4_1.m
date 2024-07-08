s = [1,1,2,2,2,2,3,3,3,3,4,4,5,5,5,5,6,6,6,6,7,7,7,8,8,8,8,9,9,9,9,9,9,10,10,10,10,11,11,11,12,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15,16,16] ;
t = [2,3,1,4,5,6,1,5,6,7,2,8,2,8,9,3,2,3,9,10,3,9,10,4,5,11,12,4,5,6,7,12,13,6,7,12,13,8,14,15,8,9,10,14,15,9,10,14,15,11,12,13,16,11,12,13,16,14,15];
w = [5,3,5,1,3,6,3,8,7,6,1,6,3,3,5,8,6,7,3,3,6,8,4,6,3,2,2,8,5,3,8,1,2,3,4,3,3,2,3,5,2,1,3,5,2,2,3,6,6,3,5,6,4,5,2,6,3,4,3];
G = graph(s,t,w);
figure(1)
plot(G, 'EdgeLabel', G.Edges.Weight, 'linewidth', 2) 
set( gca, 'XTick', [], 'YTick', [] );  
[P,d] = shortestpath(G, 1, 16) 
 
% 在图中高亮我们的最短路径
myplot = plot(G, 'EdgeLabel', G.Edges.Weight, 'linewidth', 2);  %首先将图赋给一个变量
highlight(myplot, P, 'EdgeColor', 'r')   %对这个变量即我们刚刚绘制的图形进行高亮处理（给边加上r红色）
 

% 定义边的起点、终点和权重
startNodes = [1,1,2,2,2,2,3,3,3,3,4,4,5,5,5,5,6,6,6,6,7,7,7,8,8,8,8,9,9,9,9,9,9,10,10,10,10,11,11,11,12,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15,16,16];
endNodes = [2,3,1,4,5,6,1,5,6,7,2,8,2,8,9,3,2,3,9,10,3,9,10,4,5,11,12,4,5,6,7,12,13,6,7,12,13,8,14,15,8,9,10,14,15,9,10,14,15,11,12,13,16,11,12,13,16,14,15];
edgeWeights = [5,3,5,1,3,6,3,8,7,6,1,6,3,3,5,8,6,7,3,3,6,8,4,6,3,2,2,8,5,3,8,1,2,3,4,3,3,2,3,5,2,1,3,5,2,2,3,6,6,3,5,6,4,5,2,6,3,4,3];

% 创建图对象
graphObject = graph(startNodes, endNodes, edgeWeights);

% 绘制图形
figure(1);
plotHandle = plot(graphObject, 'EdgeLabel', graphObject.Edges.Weight, 'linewidth', 2); 
set(gca, 'XTick', [], 'YTick', []);  % 移除坐标轴刻度

% 计算从节点1到节点16的最短路径
[pathNodes, totalDistance] = shortestpath(graphObject, 1, 16); 

% 在图中高亮最短路径
highlight(plotHandle, pathNodes, 'EdgeColor', 'r');  % 对图形进行高亮处理，给边加上红色
