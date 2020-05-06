
clear
k = 2.0178;
c = 14.1178;

% 1.3 风速模型（参数来自1.2）
% pdf(v,c,k)和 cdf(v,c,k) 
% 当前的风速
for i=1:100
v(i) = c * (-log(rand))^(1/k);
end
plot(v)
