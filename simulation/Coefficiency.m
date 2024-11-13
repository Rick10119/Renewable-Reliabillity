
%% 风机的参数
% 1 由找到的数据进行风速建模（威布尔分布）***************************
% 1.1 读取历史数据
std_v_history=  2.5;
mean_v_history=  5;
N = 1000 * Ratio_w; %假设的风机数量

% 1.2 参数估计（大样本近似）
% k=(std_v_history/mean_v_history)^-1.086;
% c=0;
% if (k>0.8 && k<1)
%     c = 1.03*k*mean_v_history;
% elseif k>1
%     c = 1.07*mean_v_history;
% else
%     c = -1;
% end
k=2.4;
c=7.1;

%对单个风机：
miu = 24; %修复率
lamda = 24/99;  %故障率
p0 = miu/(miu+lamda);  %正常概率
p1 = lamda/(miu+lamda);%故障概率

%% 光伏参数
M = 100 *Ratio_p; %全部光伏板数
Q = 0.001;%光伏板的不可用率
P = 1-Q;%光伏板的可用率

n=160; %日期
r=1+0.034*cos(2*pi*n/365);
delt=23.45*sin(2*pi*(284+n)/365)/180*pi;
fai=23/180*pi;%纬度
S=0/180*pi;   %倾角
gama=0/180*pi;  %方位角


% t=(-pi):0.01:(pi);
% cosct=sin(delt)*(sin(fai)*cos(S)-sin(S)*cos(fai)*cos(gama))+sin(S)*sin(gama)...
%     *cos(delt)*sin(t)+cos(delt)*cos(t)*(cos(fai)*cos(S)+sin(fai)*sin(S)*cos(gama));
% I=r*cosct;
% for i=1:length(t)
%     if I(i)<0
%         I(i)=0;
%     end
% end
% % plot((t/pi+1)*12,I)
% % hold on

t =(-pi):pi/TIME*2:(pi);
t = t(2:end);
cosct=sin(delt)*(sin(fai)*cos(S)-sin(S)*cos(fai)*cos(gama))+sin(S)*sin(gama)...
    *cos(delt)*sin(t)+cos(delt)*cos(t)*(cos(fai)*cos(S)+sin(fai)*sin(S)*cos(gama));
I=r*cosct;

for i=1: TIME
    if I(i)<0
        I(i)=0;
    end
end
% plot((t/pi+1)*12,I,'.')
% hold off
I=I*1353;


miu=0.7;%均值
cigma=0.05;%标准差
a=miu*(miu*(1-miu)/cigma^2-1);%两个参数
b=(1-miu)*(miu*(1-miu)/cigma^2-1);


% 有什么用....
Tamax=29; %该日最高温度
Tamin=15; %最低温度
Ta=(Tamax+Tamin)/2+(Tamax-Tamin)/2*sin(t+pi/4);

I0=1000;%测试条件下的
alp=-0.0045;%光伏功率温度系数
T0=25;%基准温度


