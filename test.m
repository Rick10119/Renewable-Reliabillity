% ����һЩ����
clear
g=[];
v = -26:0.01:26;
for i= 1:numel(v)
g(i) = w(v(i));
end
plot(v,g);

%%
% EDNS = P_ld + P_C- P_w - P_p - P_u -P_D;
EDNS = value(EDNS_rate);

stairs(P_ld,'black','LineWidth',1); hold on;
stairs(value(P_u),'r','LineWidth',2);hold on;
stairs(value(P_w),'g','LineWidth',1);hold on;
stairs(value(P_p),'b','LineWidth',2);

ha=gca;
%����figure��������

t1 = title('���������','FontSize',24);
x1 = xlabel('ʱ��㣨00:00-24:00��15minΪ�����','FontSize',18);          %����������tex����
y1 = ylabel('����/MW','FontSize',18);
t1.FontName = '����';                   %�����ʽ����Ϊ���壬���������
x1.FontName = '����'; 
y1.FontName = '����'; 
legend('����','���������','������','�������');
saveas(gcf,'���������.jpg'); %���浱ǰ���ڵ�ͼ��