% 定义边和权重
% 边的定义和对应的权重
edgeList = [
    1 2 5;   % 边 1-2, 权重 5
    1 3 6;   % 边 1-3, 权重 6
    1 4 1;   % 边 1-4, 权重 1
    2 3 7;   % 边 2-3, 权重 7
    2 4 2;   % 边 2-4, 权重 2
    3 4 5;   % 边 3-4, 权重 5
    4 5 3;   % 边 4-5, 权重 3
    4 6 4;   % 边 4-6, 权重 4
    5 6 4    % 边 5-6, 权重 4
];

% 获取边的数量和顶点的数量
numEdges = size(edgeList, 1); % 边的数量
numVertices = 6; % 顶点的数量

% 初始化父节点和秩
global vertexParent; % 使用全局变量保存父节点信息
global vertexRank; % 使用全局变量保存秩信息
vertexParent = 1:numVertices; % 初始化父节点为自身
vertexRank = zeros(1, numVertices); % 初始化秩为0

% Kruskal算法主程序
mstEdges = []; % 最小生成树的边集合
totalWeight = 0; % 最小生成树的总权重

% 按权重对边排序
sortedEdges = sortrows(edgeList, 3); % 按第三列（权重）对边排序

for i = 1:numEdges
    u = sortedEdges(i, 1); % 获取边的起点
    v = sortedEdges(i, 2); % 获取边的终点
    edgeWeight = sortedEdges(i, 3); % 获取边的权重

    % 如果u和v不在同一个集合中，加入这条边
    if findSet(u) ~= findSet(v)
        unionSets(u, v); % 合并两个集合
        mstEdges = [mstEdges; u v edgeWeight]; % 将边加入最小生成树
        totalWeight = totalWeight + edgeWeight; % 累加权重
    end
end

% 输出结果
disp('最小生成树的边:'); % 显示最小生成树的边
disp(mstEdges); % 显示最小生成树的边集合
disp(['最小生成树的总权重: ', num2str(totalWeight)]); % 显示最小生成树的总权重

% 嵌套函数: 找到顶点的根节点
function root = findSet(vertex)
    global vertexParent; % 使用全局变量访问父节点信息
    if vertexParent(vertex) ~= vertex % 如果当前顶点不是根节点
        vertexParent(vertex) = findSet(vertexParent(vertex)); % 路径压缩
    end
    root = vertexParent(vertex); % 返回根节点
end

% 嵌套函数: 合并两个集合
function unionSets(vertex1, vertex2)
    global vertexParent; % 使用全局变量访问父节点信息
    global vertexRank; % 使用全局变量访问秩信息
    root1 = findSet(vertex1); % 找到顶点1的根节点
    root2 = findSet(vertex2); % 找到顶点2的根节点
    if root1 ~= root2 % 如果两个顶点的根节点不同
        if vertexRank(root1) > vertexRank(root2)
            vertexParent(root2) = root1; % 将root2的父节点设置为root1
        elseif vertexRank(root1) < vertexRank(root2)
            vertexParent(root1) = root2; % 将root1的父节点设置为root2
        else
            vertexParent(root2) = root1; % 将root2的父节点设置为root1
            vertexRank(root1) = vertexRank(root1) + 1; % 增加root1的秩
        end
    end
end
