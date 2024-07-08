% Floyd-Warshall 算法用于寻找所有顶点对之间的最短路径

% 定义邻接矩阵表示城市区域之间的距离
adjMatrix = [
    inf 3 inf inf inf inf inf;       % 区域 1 的距离
    3 inf 2 inf 1.8 2.5 inf;         % 区域 2 的距离
    inf 2 inf 6 2 inf inf;           % 区域 3 的距离
    inf inf 6 3 inf inf inf;         % 区域 4 的距离
    inf 1.8 2 3 inf 4 inf;           % 区域 5 的距离
    inf 2.5 inf inf 4 inf 1.5;       % 区域 6 的距离
    inf inf inf inf inf 1.5 inf      % 区域 7 的距离
];

% 获取区域的数量
numDistricts = size(adjMatrix, 1); % 区域数量

% Floyd-Warshall 算法
for intermediateVertex = 1:numDistricts
    for startVertex = 1:numDistricts
        for endVertex = 1:numDistricts
            % 如果通过中间顶点可以缩短起点和终点之间的距离，则更新距离
            if adjMatrix(startVertex, endVertex) > adjMatrix(startVertex, intermediateVertex) + adjMatrix(intermediateVertex, endVertex)
                adjMatrix(startVertex, endVertex) = adjMatrix(startVertex, intermediateVertex) + adjMatrix(intermediateVertex, endVertex);
            end
        end
    end
end

% 寻找消防站的最佳位置
% 计算每个区域到最远区域的最短距离
maxDistances = max(adjMatrix, [], 2); 
% 找到最小的最大距离及其对应的区域
[minMaxDistance, bestDistrict] = min(maxDistances);

% 显示结果
disp(['设置消防站的最优区: ', num2str(bestDistrict)]); % 显示最佳区域
disp(['至最远区的最短路径: ', num2str(minMaxDistance)]); % 显示最小的最大距离
