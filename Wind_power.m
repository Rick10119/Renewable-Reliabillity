
% 1.3 风速模型（参数来自1.2）
% pdf(v,c,k)和 cdf(v,c,k) 
% 给定时间的风速
v = 0;
for i = 1:TIME
  v(i) = c * (-log(rand))^(1/k);% 威布尔分布随机数产生
  %每一台正常运行风机的出力
  P_w_01(i) = w(v(i)); % 出力模型w(v)
  n0 = binornd(N , p0); %正常运行风机数量
  P_w_max = n0 * P_w_01; %风机总出力
  
end
% plot(v);
% 
% %%
% 
% plot(P_w_01);
% 
% %%
% plot(P_w_max);