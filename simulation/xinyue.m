clc;
clear;
format long
%% 参数设定
TIME = 96;                                                                  %时段数量(4*24)
Data_load;                                                                  %调用，读取数据(最高580）

Ratio_s = 1; %储能比例
Ratio_w = 1; %风电比例
Ratio_p = 1; %光伏比例
Coefficiency;%新能源参数
P_u_min = 100;
P_u_max = 450;%火电最大值

n=100;
for j=1:n
% 风电模型和出力（产生一天的出力上限）
 Wind_power;
% 光伏模型和出力
 Photo_voltaic;
 % 电力不足期望
EDNS = zeros(1,TIME);
for i=1:TIME   
    P_max(i) = P_u_max + P_w_max(i) + P_p_max(i);    
end
EDNS = P_ld - P_max;

for i =1:TIME
    if EDNS(i)>0
        ;%不执行
    else
        EDNS(i)=0;
    end
end
EDNS_rate(j) = sum(EDNS)/TIME;
end
result = mean(EDNS_rate);
%% 
