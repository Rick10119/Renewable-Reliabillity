
clear
k = 2.0178;
c = 14.1178;

% 1.3 ����ģ�ͣ���������1.2��
% pdf(v,c,k)�� cdf(v,c,k) 
% ��ǰ�ķ���
for i=1:100
v(i) = c * (-log(rand))^(1/k);
end
plot(v)
