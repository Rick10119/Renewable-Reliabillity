% 购电的出力和约束（不考虑故障）

%出力约束(MW)
% P_u_min = 10;
% P_u_max = 45;
%爬坡约束(MW/min)*（min)
dt = 15;                                                                    %步长为15min
R_u_dM = dt * (-0.1);
R_u_uM = dt *  0.1;
%出力（top中已经定义）
% P_u = sdpvar(TIME,NUMOFTHERMAL,'full');                                   %热电厂出力 MW
% R_u = zeros(TIME,1);                                                      %热电厂出力爬坡 MW/min

%爬坡和出力的关系
R_u = P_u - [P_u(TIME,:); P_u(1:TIME-1,:)];

%% 传统机组的约束
Constraints2 = [];
% 出力上下限约束
for k = 1:TIME
    Constraints2 = [Constraints2, P_u_min <= P_u(k) <= P_u_max];
end


% 爬坡约束

for k = 1:TIME
    Constraints2 = [Constraints2, R_u_dM  <= R_u(k) <= R_u_uM];
end
