% 定义数据
% X 坐标数据
xCoordinates = [1200 1600 2000 2400 2800 3200 3600 4000];
% Y 坐标数据
yCoordinates = [1200 1600 2000 2400 2800 3200 3600];
% Z 坐标数据（高程）
elevationData = [
    1130 1250 1280 1230 1040 900 500 700;
    1320 1450 1420 1400 1300 700 900 850;
    1390 1500 1500 1400 900 1100 1060 950;
    1500 1200 1100 1350 1450 1200 1150 1010;
    1500 1200 1100 1550 1600 1550 1380 1070;
    1500 1550 1600 1550 1600 1600 1600 1550;
    1480 1500 1550 1510 1430 1300 1200 980
];

% 定义插值网格
% 创建 X 和 Y 坐标的网格点
[gridX, gridY] = meshgrid(1200:100:4000, 1200:100:3600);

% 进行最邻近点插值
% 使用最邻近点插值法估计网格点的高程
nearestInterpolatedElevations = interp2(xCoordinates, yCoordinates, elevationData, gridX, gridY, 'nearest');

% 进行双线性插值
% 使用双线性插值法估计网格点的高程
linearInterpolatedElevations = interp2(xCoordinates, yCoordinates, elevationData, gridX, gridY, 'linear');

% 进行双三次插值
% 使用双三次插值法估计网格点的高程
cubicInterpolatedElevations = interp2(xCoordinates, yCoordinates, elevationData, gridX, gridY, 'cubic');

% 绘制地貌图
% 创建新的图形窗口
figure;

% 绘制最邻近点插值的地貌图
subplot(1, 3, 1);
surf(gridX, gridY, nearestInterpolatedElevations);
title('最邻近点插值的地貌图');
xlabel('X 坐标');
ylabel('Y 坐标');
zlabel('高程');
axis equal;

% 绘制双线性插值的地貌图
subplot(1, 3, 2);
surf(gridX, gridY, linearInterpolatedElevations);
title('双线性插值的地貌图');
xlabel('X 坐标');
ylabel('Y 坐标');
zlabel('高程');
axis equal;

% 绘制双三次插值的地貌图
subplot(1, 3, 3);
surf(gridX, gridY, cubicInterpolatedElevations);
title('双三次插值的地貌图');
xlabel('X 坐标');
ylabel('Y 坐标');
zlabel('高程');
axis equal;

% 绘制等高线图
% 创建新的图形窗口
figure;

% 绘制最邻近点插值的等高线图
subplot(1, 3, 1);
contour(gridX, gridY, nearestInterpolatedElevations);
title('最邻近点插值的等高线图');
xlabel('X 坐标');
ylabel('Y 坐标');
axis equal;

% 绘制双线性插值的等高线图
subplot(1, 3, 2);
contour(gridX, gridY, linearInterpolatedElevations);
title('双线性插值的等高线图');
xlabel('X 坐标');
ylabel('Y 坐标');
axis equal;

% 绘制双三次插值的等高线图
subplot(1, 3, 3);
contour(gridX, gridY, cubicInterpolatedElevations);
title('双三次插值的等高线图');
xlabel('X 坐标');
ylabel('Y 坐标');
axis equal;

% 原始数据地貌图
% 创建新的图形窗口
figure;
% 绘制原始数据的地貌图
surf(xCoordinates, yCoordinates, elevationData);
title('原始数据的地貌图');
xlabel('X 坐标');
ylabel('Y 坐标');
zlabel('高程');
shading flat; % 保留网格
axis equal;

% 原始数据等高线图
% 创建新的图形窗口
figure;
% 绘制原始数据的等高线图
contour(xCoordinates, yCoordinates, elevationData);
title('原始数据的等高线图');
xlabel('X 坐标');
ylabel('Y 坐标');
axis equal;
