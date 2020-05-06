function y = pdf_v(v,c,k)
% 参数c和k下，风速v的概率密度函数
  y = (k/c)*(v/c)^(k-1)*exp(-(v/c)^k);
end