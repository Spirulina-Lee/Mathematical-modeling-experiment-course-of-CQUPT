% 生成 v 值范围从 -4 到 12
v = linspace(-4, 12, 1000); % 使用 linspace 函数生成 1000 个在 -4 到 12 之间均匀分布的点

% 对 v 中的每一个值调用匿名函数 h，生成对应的 w 值
w = arrayfun(@h, v); % 使用 arrayfun 函数对数组 v 中的每个元素应用函数 h，结果存储在数组 w 中

% 绘制函数图像
figure; % 创建一个新的图形窗口
plot(v, w); % 绘制 v 和 w 之间的关系图
title('f(x) 的图像'); % 为图形添加标题
xlabel('x'); % 为 x 轴添加标签
ylabel('f(x)'); % 为 y 轴添加标签
grid on; % 启用网格

% 定义分段函数
function out = h(t)
    % 定义分段函数 h(t)
    if t < 0
        out = t^2 + t - 6; % 当 t < 0 时，计算 t^2 + t - 6
    elseif t < 10
        out = t^2 - 5*t + 6; % 当 0 <= t < 10 时，计算 t^2 - 5*t + 6
    else
        out = t^2 - t - 1; % 当 t >= 10 时，计算 t^2 - t - 1
    end
end
