%%

x=betarnd(a,b,1,length(I));
I_real=x.*I;

Tt=Ta+I_real.*(Ta-20)/800;

m = binornd(M,P,1,length(TIME));  %û�л��Ĺ����������

P_p_max = m * I_real.*(1+alp*(Tt-T0))/I0;

