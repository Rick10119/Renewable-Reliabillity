n=160;
r=1+0.034*cos(2*pi*n/365);
delt=23.45*sin(2*pi*(284+n)/365)/180*pi;
fai=23/180*pi;%γ��
S=0/180*pi;   %���
gama=0/180*pi;  %��λ��


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

t=(-pi):pi/48:(pi);
cosct=sin(delt)*(sin(fai)*cos(S)-sin(S)*cos(fai)*cos(gama))+sin(S)*sin(gama)...
    *cos(delt)*sin(t)+cos(delt)*cos(t)*(cos(fai)*cos(S)+sin(fai)*sin(S)*cos(gama));
I=r*cosct;

for i=1:length(t)
    if I(i)<0
        I(i)=0;
    end
end
% plot((t/pi+1)*12,I,'.')
% hold off
I=I*1353;


miu=0.7;%��ֵ
cigma=0.05;%��׼��
a=miu*(miu*(1-miu)/cigma^2-1);%��������
b=(1-miu)*(miu*(1-miu)/cigma^2-1);
x=betarnd(a,b,1,length(I));
I_real=x.*I;





% ��ʲô��....
Tamax=29; %��������¶�
Tamin=15; %����¶�
Ta=(Tamax+Tamin)/2+(Tamax-Tamin)/2*sin(t+pi/4);

Tt=Ta+I_real.*(Ta-20)/800;

M=1000; %ȫ���������
Q=0.001;%�����Ĳ�������
P=1-Q;%�����Ŀ�����
k=binornd(M,P,1,length(t));  %û�л��Ĺ������
eita=k/M;

I0=1000;%���������µ�
alp=-0.0045;%��������¶�ϵ��
T0=25;%��׼�¶�
Pt=eita.*I_real.*(1+alp*(Tt-T0))/I0;

