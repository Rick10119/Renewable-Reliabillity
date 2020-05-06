function y = w(v)
% ���������� w ���ڷ��� v �ĺ���
% ������������m/s, W)
v_ci = 3;%�������
v_r = 16;%�����
v_co = 25;%�г�����
w_r = 2;%��������

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

% ע������w�ķ�����ֱ�Ӳ�����������ķ���û�м��룬����һ��˼·���ǵ�Ч