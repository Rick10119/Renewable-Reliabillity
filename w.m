function y = w(v)
% 最大输出功率 w 关于风速 v 的函数
% 输入风机参数（m/s, W)
v_ci = 3;%切入风速
v_r = 16;%额定风速
v_co = 25;%切出风速
w_r = 2;%额定输出功率

A = (1/(v_ci-v_r)^2 )* ( v_ci*(v_ci+v_r) - 4*v_ci*v_r*((v_ci+v_r)/(2*v_r))^3);
B = (1/(v_ci-v_r)^2 )* ( 4 *(v_ci+v_r)*(((v_ci+v_r)/(2*v_r))^3) - (3*v_ci + v_r));
C = (1/(v_ci-v_r)^2 )* ( 2 - 4 *((v_ci+v_r)/(2*v_r))^3 );


if ( v>=0 && v<v_ci)
    y = 0;
elseif v_ci<=v && v<v_r
    y = w_r*( A+ B*v + C*(v^2));
elseif v_r<=v && v< v_co
    y =w_r;
else 
    y =0; 
end

end

% 注：利用w的反函数直接产生随机变量的方法没有加入，是另一个思路但是等效