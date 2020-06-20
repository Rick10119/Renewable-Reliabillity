%% 光伏故障和出力的模型（参数由coefficiency决定: M, P, I, a, b）

x=betarnd(a,b,1,length(I));

I_real=x.*I;%光强修正

Tt=Ta+I_real.*(Ta-20)/800;%温度修正

m = binornd(ceil(M),Pr,1,TIME);  %没有坏的光伏板数比例

P_p_max = m .* I_real.*(1+alp*(Tt-T0))/I0;%最大出力

