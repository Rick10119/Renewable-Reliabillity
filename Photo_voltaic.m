%% ������Ϻͳ�����ģ�ͣ�������coefficiency����: M, P, I, a, b��

x=betarnd(a,b,1,length(I));

I_real=x.*I;%��ǿ����

Tt=Ta+I_real.*(Ta-20)/800;%�¶�����

m = binornd(ceil(M),Pr,1,TIME);  %û�л��Ĺ����������

P_p_max = m .* I_real.*(1+alp*(Tt-T0))/I0;%������

