% 定义节点之间的距离矩阵
distanceMatrix = [
    inf, 5, 3, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf;   % 节点 1 的距离
    5, inf, inf, 1, 3, 6, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf;      % 节点 2 的距离
    3, inf, inf, inf, 8, 7, 6, inf, inf, inf, inf, inf, inf, inf, inf, inf;      % 节点 3 的距离
    inf, 1, inf, inf, inf, inf, inf, 6, 8, inf, inf, inf, inf, inf, inf, inf;    % 节点 4 的距离
    inf, 3, 8, inf, inf, inf, inf, 3, 5, inf, inf, inf, inf, inf, inf, inf;      % 节点 5 的距离
    inf, 6, 7, inf, inf, inf, inf, inf, 3, 3, inf, inf, inf, inf, inf, inf;      % 节点 6 的距离
    inf, inf, 6, inf, inf, inf, inf, inf, 8, 4, inf, inf, inf, inf, inf, inf;    % 节点 7 的距离
    inf, inf, inf, 6, 3, inf, inf, inf, inf, inf, 2, 2, inf, inf, inf, inf;      % 节点 8 的距离
    inf, inf, inf, 8, 5, 3, 8, inf, inf, inf, inf, 1, 2, inf, inf, inf;          % 节点 9 的距离
    inf, inf, inf, inf, inf, 3, 4, inf, inf, inf, inf, 3, 3, inf, inf, inf;      % 节点 10 的距离
    inf, inf, inf, inf, inf, inf, inf, 2, inf, inf, inf, inf, inf, 2, 5, inf;    % 节点 11 的距离
    inf, inf, inf, inf, inf, inf, inf, 2, 1, 3, inf, inf, inf, 5, 2, inf;        % 节点 12 的距离
    inf, inf, inf, inf, inf, inf, inf, inf, 2, 3, inf, inf, inf, 6, 6, inf;      % 节点 13 的距离
    inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, 3, 5, 6, inf, inf, 4;      % 节点 14 的距离
    inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, 5, 2, 6, inf, inf, 3;      % 节点 15 的距离
    inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, 4, 3, inf   % 节点 16 的距离
];

% 定义可能的中间站组合
possibleStations = {
    [2, 3],         % 第一组可能的中间站
    [4, 5, 6, 7],   % 第二组可能的中间站
    [8, 9, 10],     % 第三组可能的中间站
    [11, 12, 13],   % 第四组可能的中间站
    [14, 15]        % 第五组可能的中间站
};

% 初始化最短距离和路径
minTotalDistance = inf;  % 初始化最短总距离
optimalPath = [];        % 初始化最佳路径

% 遍历所有可能的中间站组合
allCombinations = combvec(possibleStations{1}, possibleStations{2}, possibleStations{3}, possibleStations{4}, possibleStations{5});
numCombinations = size(allCombinations, 2); % 组合数量

for combinationIndex = 1:numCombinations
    % 生成当前路径
    currentPath = [1, allCombinations(:, combinationIndex)', 16];
    
    % 计算当前路径的总距离
    currentTotalDistance = 0;
    for nodeIndex = 1:length(currentPath) - 1
        currentTotalDistance = currentTotalDistance + distanceMatrix(currentPath(nodeIndex), currentPath(nodeIndex + 1));
    end
    
    % 更新最短距离和最佳路径
    if currentTotalDistance < minTotalDistance
        minTotalDistance = currentTotalDistance;
        optimalPath = currentPath;
    end
end

% 输出结果
fprintf('最短距离：%d\n', minTotalDistance); % 显示最短距离
fprintf('最短路径：'); % 显示最短路径
disp(optimalPath); % 显示路径数组
