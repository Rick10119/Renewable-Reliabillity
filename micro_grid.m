clc;
clear;
format long
%% �����趨
TIME = 96;                                                                  %ʱ������(4*24)
Data_load;                                                                  %���ã���ȡ����(���580��

Ratio_s = 1; %���ܱ���
Ratio_w = 1; %������
Ratio_p = 1; %�������
Coefficiency;%����Դ����

%��¼Լ�����
P_u_result = [];
P_w_result = [];
P_C_result = [];
P_D_result = [];


%% ��������
% ���ģ�ͺͳ���������һ��ĳ������ޣ�
 Wind_power;

% ���ģ�ͺͳ���
 Photo_voltaic;

% ��ͳ����ʹ���
P_w = sdpvar(TIME,1,'full');                                                % ������ MW
P_p = sdpvar(TIME,1,'full');                                                        % ������� MW
P_u = sdpvar(TIME,1,'full');                                                % �ȵ糧���� MW
P_z = binvar(TIME,1,'full');                                                % ���ܳ��/�ŵ����
P_C = sdpvar(TIME,1,'full');                                                % ���ܳ�繦�� MW
P_D = sdpvar(TIME,1,'full');                                                % ���ܷŵ繦�� MW

%% Լ������
Constraints = [];
% ��ͳ����Լ��������
Traditional;
Constraints = [Constraints,Constraints2];

% ����Լ��, ����
Storage;
Constraints = [Constraints,constraints1];

%ϵͳԼ��
for i=1:TIME
    Constraints = [Constraints,0 <= P_w(i) <= P_w_max(i)];              %������Լ��
    Constraints = [Constraints,0 <= P_p(i) <= P_p_max(i)];              %�������Լ��
    Constraints = [Constraints, P_ld(i) + P_C(i)- P_w(i) - P_p(i) - P_u(i) -P_D(i) >=0];%����ƽ��
end

%% Ŀ�꺯��

 % �ȵ糧�ɱ� Z_u
a_f = 0.015;                                                                      %�ȵ糧�ɱ����� $/MW2h
b_f = 20   ;                                                                      % $/MWh
c_f = 1670;                                                                      % $/h
Z_u = 0;
for i=1:TIME
    Z_u = Z_u + P_u(i)^2*a_f+b_f*P_u(i)+c_f;                                      %�ȵ糧�ɱ�
end
Z_u = Z_u/4;                                                                      %ÿСʱ��Ϊ��4��

% ���ܳɱ� Z_CD
PI_C = 10;                                                                      % ������ $/MWh
PI_D = 40;                                                                      % �ŵ���� $/MWh
Z_CD = (-PI_C*sum(P_C) + PI_D*sum(P_D));                                        % ���ܳ�ŵ�ɱ�
Z_CD = Z_CD/4;                                                                  % ÿСʱ��Ϊ��4��

% ����������ʧ
EDNS_rate=0;
for i =1 : TIME
    EDNS_rate = EDNS_rate + P_ld(i) + P_C(i)- P_w(i) - P_p(i) - P_u(i) -P_D(i);
end
cost = 8760*4*100; %����ɱ�Ӧ�úܸ�
Z_EDNS = EDNS_rate * cost;

Z = Z_u + Z_CD + Z_EDNS;

% �Ż�����ɱ����
ops = sdpsettings('debug',1,'solver','cplex','savesolveroutput',1,'savesolverinput',1);
optimize(Constraints,Z,ops)

% huatu3;
% close;


