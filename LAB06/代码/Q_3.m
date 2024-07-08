% 邻接矩阵表示矿点之间的距离
adjacencyMatrix = [
    inf 3 inf inf inf inf inf;    % 矿点 1 的距离
    3 inf 2 inf inf 4 inf;        % 矿点 2 的距离
    inf 2 inf 6 2 inf inf;        % 矿点 3 的距离
    inf inf 6 inf 1 inf inf;      % 矿点 4 的距离
    inf inf 2 1 inf 4 inf;        % 矿点 5 的距离
    inf 4 inf inf 4 inf 1.5;      % 矿点 6 的距离
    inf inf inf inf inf 1.5 inf   % 矿点 7 的距离
];

% 每个矿点的生产量（单位：千吨）
productionVolume = [3, 2, 7, 1, 6, 1, 4];

% 使用 Floyd-Warshall 算法计算每对矿点之间的最短路径
numPoints = size(adjacencyMatrix, 1); % 矿点数量
shortestDistances = adjacencyMatrix;  % 初始化最短距离矩阵

for intermediatePoint = 1:numPoints
    for startPoint = 1:numPoints
        for endPoint = 1:numPoints
            % 更新最短路径
            if shortestDistances(startPoint, intermediatePoint) + shortestDistances(intermediatePoint, endPoint) < shortestDistances(startPoint, endPoint)
                shortestDistances(startPoint, endPoint) = shortestDistances(startPoint, intermediatePoint) + shortestDistances(intermediatePoint, endPoint);
            end
        end
    end
end

% 计算每个矿点作为矿厂的总运力
totalTransportationCost = zeros(1, numPoints); % 初始化总运力数组

for factoryPoint = 1:numPoints
    for minePoint = 1:numPoints
        if factoryPoint ~= minePoint
            % 累加从矿点到矿厂的运力
            totalTransportationCost(factoryPoint) = totalTransportationCost(factoryPoint) + shortestDistances(factoryPoint, minePoint) * productionVolume(minePoint);
        end
    end
end

% 找到总运力最小的矿点
[~, optimalMinePoint] = min(totalTransportationCost); % 最优矿点

% 输出结果
fprintf('最佳的矿点是: 矿点%d\n', optimalMinePoint);
fprintf('对应的总运力（千吨公里）是: %.2f\n', totalTransportationCost(optimalMinePoint));

% 输出每个矿点到最佳矿点的运力
fprintf('每个矿点到最佳矿点的运力（千吨公里）：\n');
for minePoint = 1:numPoints
    if minePoint ~= optimalMinePoint
        % 计算从矿点到最佳矿点的运力
        transportCost = shortestDistances(optimalMinePoint, minePoint) * productionVolume(minePoint);
        fprintf('矿点%d到最佳矿点的运力: %.2f\n', minePoint, transportCost);
    end
end
