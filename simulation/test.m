
%%
% plot(value(P_D));
plot(value(E_A))
%% 画图和分析
EDNS = P_ld' + value(P_C- P_w - P_p - P_u -P_D);
% EDNS = value(EDNS_rate);

stairs(P_ld,'black','LineWidth',1); hold on;
stairs(value(P_u),'r','LineWidth',1);hold on;
stairs(value(P_w),'g','LineWidth',1);hold on;
stairs(value(P_p),'b','LineWidth',1);hold on;
stairs(value(P_D - P_C),'y','LineWidth',1);hold on;
stairs(EDNS,'m','LineWidth',1);hold off;

ha=gca;
%设置figure各个参数

t1 = title('各机组出力','FontSize',24);
x1 = xlabel('时间点（00:00-24:00以15min为间隔）','FontSize',18);          %轴标题可以用tex解释
y1 = ylabel('功率/MW','FontSize',18);
t1.FontName = '宋体';                   %标题格式设置为宋体，否则会乱码
x1.FontName = '宋体'; 
y1.FontName = '宋体'; 
legend('负荷','火电机组出力','风电出力','光伏出力','储能出力','不足电力');
saveas(gcf,'各机组出力.jpg'); %保存当前窗口的图像