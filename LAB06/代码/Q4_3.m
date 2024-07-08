% 邻接矩阵表示矿点之间的距离
distanceMatrix = [
    inf, 5, 3, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf; % 节点1的距离
    5, inf, inf, 1, 3, 6, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf;    % 节点2的距离
    3, inf, inf, inf, 8, 7, 6, inf, inf, inf, inf, inf, inf, inf, inf, inf;    % 节点3的距离
    inf, 1, inf, inf, inf, inf, inf, 6, 8, inf, inf, inf, inf, inf, inf, inf;  % 节点4的距离
    inf, 3, 8, inf, inf, inf, inf, 3, 5, inf, inf, inf, inf, inf, inf, inf;    % 节点5的距离
    inf, 6, 7, inf, inf, inf, inf, inf, 3, 3, inf, inf, inf, inf, inf, inf;    % 节点6的距离
    inf, inf, 6, inf, inf, inf, inf, inf, 8, 4, inf, inf, inf, inf, inf, inf;  % 节点7的距离
    inf, inf, inf, 6, 3, inf, inf, inf, inf, inf, 2, 2, inf, inf, inf, inf;    % 节点8的距离
    inf, inf, inf, 8, 5, 3, 8, inf, inf, inf, inf, 1, 2, inf, inf, inf;        % 节点9的距离
    inf, inf, inf, inf, inf, 3, 4, inf, inf, inf, inf, 3, 3, inf, inf, inf;    % 节点10的距离
    inf, inf, inf, inf, inf, inf, inf, 2, inf, inf, inf, inf, inf, 2, 5, inf;  % 节点11的距离
    inf, inf, inf, inf, inf, inf, inf, 2, 1, 3, inf, inf, inf, 5, 2, inf;      % 节点12的距离
    inf, inf, inf, inf, inf, inf, inf, inf, 2, 3, inf, inf, inf, 6, 6, inf;    % 节点13的距离
    inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, 3, 5, 6, inf, inf, 4;    % 节点14的距离
    inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, 5, 2, 6, inf, inf, 3;    % 节点15的距离
    inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, 4, 3, inf % 节点16的距离
];

numNodes = size(distanceMatrix, 1); % 获取节点数
shortestDistances = distanceMatrix; % 初始化最短距离矩阵
routingMatrix = zeros(numNodes, numNodes); % 初始化路由矩阵

% 初始化路由矩阵
for startNode = 1:numNodes
    for endNode = 1:numNodes
        routingMatrix(startNode, endNode) = endNode; % 设置初始路由矩阵
    end
end

% Floyd算法计算最短路径
for intermediateNode = 1:numNodes
    for startNode = 1:numNodes
        for endNode = 1:numNodes
            % 如果通过中间节点可以缩短路径，则更新路径
            if shortestDistances(startNode, intermediateNode) + shortestDistances(intermediateNode, endNode) < shortestDistances(startNode, endNode)
                shortestDistances(startNode, endNode) = shortestDistances(startNode, intermediateNode) + shortestDistances(intermediateNode, endNode);
                routingMatrix(startNode, endNode) = routingMatrix(startNode, intermediateNode); % 更新路由矩阵
            end
        end
    end
end

% 输出结果
disp('最短距离矩阵:');
disp(shortestDistances); % 显示最短距离矩阵
disp('路由矩阵:');
disp(routingMatrix); % 显示路由矩阵
