
%% ��һ��

rnd = Kind;

if ( rnd ==1 )
    WType = 1;cw1 = cw(1);
    miu=MIU(1);sigma=SIGMA(1);
    Tamax=Tmax(1); Tamin=Tmin(1); 
elseif  ( rnd ==2 )
    WType = 2;cw1 = cw(1);
    miu=MIU(2);sigma=SIGMA(2);
    Tamax=Tmax(2); Tamin=Tmin(2); 
elseif  ( rnd ==3)
    WType = 3;cw1 = cw(1);
    miu=MIU(3);sigma=SIGMA(3);
    Tamax=Tmax(3); Tamin=Tmin(3); 
elseif  ( rnd ==4 )
    WType = 4;cw1 = cw(2);
    miu=MIU(1);sigma=SIGMA(1);
    Tamax=Tmax(1); Tamin=Tmin(1); 
elseif ( rnd ==5 )
    WType = 5;cw1 = cw(2);
    miu=MIU(2);sigma=SIGMA(2);
    Tamax=Tmax(2); Tamin=Tmin(2); 
elseif  ( rnd ==6 )
    WType = 6;cw1 = cw(2);
    miu=MIU(3);sigma=SIGMA(3);
    Tamax=Tmax(3); Tamin=Tmin(3); 
end

r=1+0.034*cos(2*pi*date/365);
delt=23.45*sin(2*pi*(284+date)/365)/180*pi;
fai=23/180*pi;%γ��
S=0/180*pi;   %���
gama=0/180*pi;  %��λ��

t =(-pi):pi/TIME*2:(pi);
t = t(2:end);
cosct=sin(delt)*(sin(fai)*cos(S)-sin(S)*cos(fai)*cos(gama))+sin(S)*sin(gama)...
    *cos(delt)*sin(t)+cos(delt)*cos(t)*(cos(fai)*cos(S)+sin(fai)*sin(S)*cos(gama));
%% ����ǿ��
I=r*cosct;
for i=1: TIME
    if I(i)<0
        I(i)=0;
    end
end
I=I*1353;



% ���ղ���
a=miu*(miu*(1-miu)/sigma^2-1);%��������
b=(1-miu)*(miu*(1-miu)/sigma^2-1);



% �¶�
Ta=(Tamax+Tamin)/2+(Tamax-Tamin)/2*sin(t+pi/4);

I0=1000;%���������µ�
alp=-0.0045;%��������¶�ϵ��
T0=25;%��׼�¶�


