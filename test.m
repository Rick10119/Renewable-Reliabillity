% ²âÊÔÒ»Ğ©º¯Êı
clear
g=[];
v = 0:0.01:26;
for i= 1:numel(v)
g(i) = w(v(i));
end
plot(v,g);