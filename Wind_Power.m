clear format long
% 1 ���ҵ������ݽ��з��ٽ�ģ���������ֲ���***************************
% 1.1 ��ȡ��ʷ����
std_v_history=  1.1;
mean_v_history=  1;

% 1.2 �������ƣ����������ƣ�
k=(std_v_history/mean_v_history)^-1.086;
c=0;
if (k>0.8 && k<1)
    c = 1.03*k*mean_v_history;
elseif k>1
    c = 1.07*mean_v_history;
else
    c = -1;
end

% 1.3 ����ģ�ͣ���������1.2��
% pdf(v,c,k)�� cdf(v,c,k) 
% ��ǰ�ķ���
v = c * (-log(rand))^(1/k);

% 1.4 ����ģ�ͣ���������1.3��
% w(v)
%ÿһ̨�������з���ĳ���
P_1 = w(v);

% 1.5 ������ͣ��ģ
N = 1000; %����ķ������
%�Ե��������
%�޸���
miu = 1; 
%������
lamda = 1;  
%��������
p0 = miu/(miu+lamda);  
%���ϸ���
p1 = lamda/(miu+lamda);
%�������з������
n0 = binornd(N , p0); 
%����ܳ���
P_N = n0 * P_1; 

% 1.6 ���ۺϣ�ϵͳ״̬��ȡ�ͷ���
% ��ͳ�������
W_M = 0;
% �ܸ���
L_sigma = 100;
% ����ָ��EDNS
EDNS = L_sigma - W_M - P_N;


    

% 2. ����
% 2.1 ���ٲ���
%



