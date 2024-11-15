%典型负荷（冬/夏）（用于调度仿真）
Data=[
1616 	1313 
1473 	1295 
1473 	1212 
1451 	1093 
1451 	1258 
1494 	1295 
1646 	1313 
1842 	1442 
1929 	1701 
2103 	1884 
2191 	1899 
2049 	1664 
1820 	1682 
1907 	1664 
1951 	1664 
1951 	1664 
1951 	1664 
2103 	1738 
2125 	1793 
2169 	1886 
2321 	1812 
2169 	1756 
1995 	1571 
1625 	1350 
]/40;


P_ld = [Data(1);Data(:,1)];
t = 4*(0:24);
i = 1:96;
P_ld = interp1(t,P_ld,i,'linear');  


%% 天气概率%% 天气类型
%     WType[1 2 3
%           4 5 6]
%        晴天	阴天	雨天
% 多风（多风，晴天）（多风，阴天）	（多风，雨天）
% 少风（少风，晴天）（多风，阴天）	（多风，雨天）
%
pWeather = [
0.216
0.147
0.042
0.504
0.063
0.028
];

% 风机总数   风速形状参数   尺度参数
Nw = 10*Ratio_w;       kw= 2;   cw = [10 ;  5];
 
 %全部光伏板数（给定比率）
M = 20 *Ratio_p;
% 光伏故障概率 修复时间10天=1/36 a
q = 0.00013/36.5;
q2 = 0.253/36.5;
q3 = 0.046/36.5;
q4 = 0.015/36.5;
%光伏板的可用率
Pr = (1-q^M)*(1-q2)*(1-q3)*(1-q4);
% 光照因素
MIU   = [ 0.808  0.322  0.239];
SIGMA = [0.175  0.216  0.214];
% 温度因素
Tmax = [30 25 20];
Tmin = [20 18 15];

%% 







