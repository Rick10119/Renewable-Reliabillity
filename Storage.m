%% 储能 constants
% remaining number of e-cars

%% charging
% charging mode
% 最大充放电功率
P_C_min = 0;
P_C_max = 20 * Ratio_s;
P_D_min = 0;
P_D_max = 20 * Ratio_s;

delta_t = 0.25;  % 15min 0.25h

% 充放电效率
yita_C = 0.85;
yita_D = 0.85;

% 储能电量上下限
E_A_max = 100 * Ratio_s;
E_A_min = 20  * Ratio_s;


%% 储能电量 variables
E_A = sdpvar(TIME, 1, 'full');     

%% 储能约束
constraints1 = [];

% (3)
constraints1 = [constraints1,E_A(1) == 60* Ratio_s];                                     %初始储能
for i = 2:TIME                                                                  % 充放电导致储能变化
    constraints1 = [constraints1,E_A(i) == E_A(i-1) + ...
        (yita_C * P_C(i) - P_D(i) / yita_D) * delta_t ];
end

% (1)(2)(4)(5)(6) %储能出力上下限
for i=1:TIME
        constraints1 = [constraints1,P_C_min*P_z(i) <= P_C(i) <= P_C_max*P_z(i)];
        constraints1 = [constraints1,P_D_min*(1-P_z(i)) <= P_D(i) <= P_D_max*(1-P_z(i))];
end
  
for i = 2:TIME
    constraints1 = [constraints1, E_A_min <= E_A(i) <= E_A_max];
end 
    constraints1 = [constraints1, sum(yita_C .* P_C(1:TIME) - ...
        P_D(1:TIME) ./ yita_D) * delta_t == 0]; %总的充放电为0

% Omega_I = constraints1;