function y = pdf_v(v,c,k)
% ����c��k�£�����v�ĸ����ܶȺ���
  y = (k/c)*(v/c)^(k-1)*exp(-(v/c)^k);
end