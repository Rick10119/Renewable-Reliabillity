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
P_u_min = 100;
P_u_max = 450;%������ֵ

n=100;
for j=1:n
% ���ģ�ͺͳ���������һ��ĳ������ޣ�
 Wind_power;
% ���ģ�ͺͳ���
 Photo_voltaic;
 % ������������
EDNS = zeros(1,TIME);
for i=1:TIME   
    P_max(i) = P_u_max + P_w_max(i) + P_p_max(i);    
end
EDNS = P_ld - P_max;

for i =1:TIME
    if EDNS(i)>0
        ;%��ִ��
    else
        EDNS(i)=0;
    end
end
EDNS_rate(j) = sum(EDNS)/TIME;
end
result = mean(EDNS_rate);
%% 
