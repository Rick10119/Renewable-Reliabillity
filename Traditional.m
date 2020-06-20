% ����ĳ�����Լ���������ǹ��ϣ�

%����Լ��(MW)
% P_u_min = 10;
% P_u_max = 45;
%����Լ��(MW/min)*��min)
dt = 15;                                                                    %����Ϊ15min
R_u_dM = dt * (-0.1);
R_u_uM = dt *  0.1;
%������top���Ѿ����壩
% P_u = sdpvar(TIME,NUMOFTHERMAL,'full');                                   %�ȵ糧���� MW
% R_u = zeros(TIME,1);                                                      %�ȵ糧�������� MW/min

%���ºͳ����Ĺ�ϵ
R_u = P_u - [P_u(TIME,:); P_u(1:TIME-1,:)];

%% ��ͳ�����Լ��
Constraints2 = [];
% ����������Լ��
for k = 1:TIME
    Constraints2 = [Constraints2, P_u_min <= P_u(k) <= P_u_max];
end


% ����Լ��

for k = 1:TIME
    Constraints2 = [Constraints2, R_u_dM  <= R_u(k) <= R_u_uM];
end
