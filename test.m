% 测试一些函数
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
%设置figure各个参数

t1 = title('无序充电模式','FontSize',24);
x1 = xlabel('时间点（18:00-8:00以15min为间隔）','FontSize',18);          %轴标题可以用tex解释
y1 = ylabel('功率/MW','FontSize',18);
t1.FontName = '宋体';                   %标题格式设置为宋体，否则会乱码
x1.FontName = '宋体'; 
y1.FontName = '宋体'; 
legend('EV充电功率','实际风机出力');
saveas(gcf,'无序充电.jpg'); %保存当前窗口的图像