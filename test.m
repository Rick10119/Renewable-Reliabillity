% ����һЩ����
clear
g=[];
v = -26:0.01:26;
for i= 1:numel(v)
g(i) = w(v(i));
end
plot(v,g);

%%


stairs(value(P_u),'r','LineWidth',2); hold on;
stairs(value(P_w),'b--','LineWidth',2); % ylim([-25 200]);
ha=gca;
%����figure��������

t1 = title('������ģʽ','FontSize',24);
x1 = xlabel('ʱ��㣨18:00-8:00��15minΪ�����','FontSize',18);          %����������tex����
y1 = ylabel('����/MW','FontSize',18);
t1.FontName = '����';                   %�����ʽ����Ϊ���壬���������
x1.FontName = '����'; 
y1.FontName = '����'; 
legend('EV��繦��','ʵ�ʷ������');
saveas(gcf,'������.jpg'); %���浱ǰ���ڵ�ͼ��