%% 风机的参数

%尺度参数


%随机产生这一天的风速12，然后插值成96个
rnd1 = rand(1,12);
v = cw1 * (-log(rnd1)).^(1/kw);% 威布尔分布随机数产生风速
v1 = [];
v1 = [v(12),v(1,:)];
t = 8*(0:12);
i = 1:TIME;
v = interp1(t,v1,i,'linear');  


for i = 1:TIME
  % 每一台正常运行风机的出力，由出力模型w(v)产生
  P_w_01(i) = w(v(i)); 
  %故障率考虑随风速增加
  p1w = 0.05 + 0.5 * 0.005 * (v(i)-cw1);%故障概率
  p0w = 1 - p1w; %正常概率
  %正常运行风机数量（二项分布）
  n0(i) = binornd(ceil(Nw) , p0w); 
  %风机总出力上限 = 正常数量 * 每台最大出力
end
% 风电场出力限制
P_w_max = n0 .* P_w_01; 


%     plot(P_w_max);
%% 测试一些函数
% 
% % 
%  plot( n0 ,'r','LineWidth',1);
% t1 = title('风电场总出力模拟','FontSize',24);
% x1 = xlabel('时间','FontSize',18);%轴标题可以用tex解释
% y1 = ylabel('功率（MW）','FontSize',18);
% t1.FontName = '宋体';                   %标题格式设置为宋体，否则会乱码
% x1.FontName = '宋体'; 
% y1.FontName = '宋体'; 
% % saveas(gcf,'风场出力模拟.jpg'); %保存当前窗口的图像


%%

