%% ���� constants
% remaining number of e-cars

%% charging
% charging mode
% ����ŵ繦��
P_C_min = 0;
P_C_max = 20 * Ratio_s;
P_D_min = 0;
P_D_max = 20 * Ratio_s;

delta_t = 0.25;  % 15min 0.25h

% ��ŵ�Ч��
yita_C = 0.85;
yita_D = 0.85;

% ���ܵ���������
E_A_max = 100 * Ratio_s;
E_A_min = 20  * Ratio_s;


%% ���ܵ��� variables
E_A = sdpvar(TIME, 1, 'full');     

%% ����Լ��
constraints1 = [];

% (3)
constraints1 = [constraints1,E_A(1) == 60* Ratio_s];                                     %��ʼ����
for i = 2:TIME                                                                  % ��ŵ絼�´��ܱ仯
    constraints1 = [constraints1,E_A(i) == E_A(i-1) + ...
        (yita_C * P_C(i) - P_D(i) / yita_D) * delta_t ];
end

% (1)(2)(4)(5)(6) %���ܳ���������
for i=1:TIME
        constraints1 = [constraints1,P_C_min*P_z(i) <= P_C(i) <= P_C_max*P_z(i)];
        constraints1 = [constraints1,P_D_min*(1-P_z(i)) <= P_D(i) <= P_D_max*(1-P_z(i))];
end
  
for i = 2:TIME
    constraints1 = [constraints1, E_A_min <= E_A(i) <= E_A_max];
end 
    constraints1 = [constraints1, sum(yita_C .* P_C(1:TIME) - ...
        P_D(1:TIME) ./ yita_D) * delta_t == 0]; %�ܵĳ�ŵ�Ϊ0

% Omega_I = constraints1;