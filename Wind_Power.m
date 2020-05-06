clear format long
% 1 由找到的数据进行风速建模（威布尔分布）***************************
% 1.1 读取历史数据
std_v_history=  1.1;
mean_v_history=  1;

% 1.2 参数估计（大样本近似）
k=(std_v_history/mean_v_history)^-1.086;
c=0;
if (k>0.8 && k<1)
    c = 1.03*k*mean_v_history;
elseif k>1
    c = 1.07*mean_v_history;
else
    c = -1;
end

% 1.3 风速模型（参数来自1.2）
% pdf(v,c,k)和 cdf(v,c,k) 
% 当前的风速
v = c * (-log(rand))^(1/k);

% 1.4 出力模型（风速来自1.3）
% w(v)
%每一台正常运行风机的出力
P_1 = w(v);

% 1.5 机组启停建模
N = 1000; %假设的风机数量
%对单个风机：
%修复率
miu = 1; 
%故障率
lamda = 1;  
%正常概率
p0 = miu/(miu+lamda);  
%故障概率
p1 = lamda/(miu+lamda);
%正常运行风机数量
n0 = binornd(N , p0); 
%风机总出力
P_N = n0 * P_1; 

% 1.6 （综合）系统状态获取和分析
% 传统机组出力
W_M = 0;
% 总负荷
L_sigma = 100;
% 评价指标EDNS
EDNS = L_sigma - W_M - P_N;


    

% 2. 算例
% 2.1 风速产生
%



