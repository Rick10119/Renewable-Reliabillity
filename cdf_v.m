function y = cdf_v(v,c,k)
% ... 累计分布函数
  y = 1 - exp(-(v/c)^k);
end