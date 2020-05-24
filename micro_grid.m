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

%记录约束结果
P_u_result = [];
P_w_result = [];
P_C_result = [];
P_D_result = [];


%% 变量设置
% 风电模型和出力（产生一天的出力上限）
 Wind_power;

% 光伏模型和出力
 Photo_voltaic;

% 传统机组和储能
P_w = sdpvar(TIME,1,'full');                                                % 风电出力 MW
P_p = sdpvar(TIME,1,'full');                                                        % 光伏出力 MW
P_u = sdpvar(TIME,1,'full');                                                % 热电厂出力 MW
P_z = binvar(TIME,1,'full');                                                % 储能充电/放电决策
P_C = sdpvar(TIME,1,'full');                                                % 储能充电功率 MW
P_D = sdpvar(TIME,1,'full');                                                % 储能放电功率 MW

%% 约束设置
Constraints = [];
% 传统机组约束，调用
Traditional;
Constraints = [Constraints,Constraints2];

% 储能约束, 调用
Storage;
Constraints = [Constraints,constraints1];

%系统约束
for i=1:TIME
    Constraints = [Constraints,0 <= P_w(i) <= P_w_max(i)];              %风电出力约束
    Constraints = [Constraints,0 <= P_p(i) <= P_p_max(i)];              %光伏出力约束
    Constraints = [Constraints, P_ld(i) + P_C(i)- P_w(i) - P_p(i) - P_u(i) -P_D(i) >=0];%功率平衡
end

%% 目标函数

 % 热电厂成本 Z_u
a_f = 0.015;                                                                      %热电厂成本参数 $/MW2h
b_f = 20   ;                                                                      % $/MWh
c_f = 1670;                                                                      % $/h
Z_u = 0;
for i=1:TIME
    Z_u = Z_u + P_u(i)^2*a_f+b_f*P_u(i)+c_f;                                      %热电厂成本
end
Z_u = Z_u/4;                                                                      %每小时分为了4段

% 储能成本 Z_CD
PI_C = 10;                                                                      % 充电费用 $/MWh
PI_D = 40;                                                                      % 放电费用 $/MWh
Z_CD = (-PI_C*sum(P_C) + PI_D*sum(P_D));                                        % 储能充放电成本
Z_CD = Z_CD/4;                                                                  % 每小时分为了4段

% 电力不足损失
EDNS_rate=0;
for i =1 : TIME
    EDNS_rate = EDNS_rate + P_ld(i) + P_C(i)- P_w(i) - P_p(i) - P_u(i) -P_D(i);
end
cost = 8760*4*100; %这个成本应该很高
Z_EDNS = EDNS_rate * cost;

Z = Z_u + Z_CD + Z_EDNS;

% 优化，求成本最低
ops = sdpsettings('debug',1,'solver','cplex','savesolveroutput',1,'savesolverinput',1);
optimize(Constraints,Z,ops)

% huatu3;
% close;


