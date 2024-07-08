% 定义温度测量数据
% 小时数据
measurementHours = 1:12; 
% 对应的温度数据
measuredTemperatures = [5 8 9 13 22 27 31 30 22 25 26 23]; 

% 定义插值点
% 需要插值的小时点
interpolationHours = [3.5, 6.3, 7.6, 11.5];

% 线性插值
% 使用线性插值法估计插值点的温度
linearInterpolatedTemps = interp1(measurementHours, measuredTemperatures, interpolationHours, 'linear');
disp('线性插值结果:');
disp(linearInterpolatedTemps);

% 三次样条插值
% 使用三次样条插值法估计插值点的温度
splineInterpolatedTemps = interp1(measurementHours, measuredTemperatures, interpolationHours, 'spline');
disp('三次样条插值结果:');
disp(splineInterpolatedTemps);
