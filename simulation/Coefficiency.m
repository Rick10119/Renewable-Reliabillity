
%% ����Ĳ���
% 1 ���ҵ������ݽ��з��ٽ�ģ���������ֲ���***************************
% 1.1 ��ȡ��ʷ����
std_v_history=  2.5;
mean_v_history=  5;
N = 1000 * Ratio_w; %����ķ������

% 1.2 �������ƣ����������ƣ�
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

%�Ե��������
miu = 24; %�޸���
lamda = 24/99;  %������
p0 = miu/(miu+lamda);  %��������
p1 = lamda/(miu+lamda);%���ϸ���

%% �������
M = 100 *Ratio_p; %ȫ���������
Q = 0.001;%�����Ĳ�������
P = 1-Q;%�����Ŀ�����

n=160; %����
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


miu=0.7;%��ֵ
cigma=0.05;%��׼��
a=miu*(miu*(1-miu)/cigma^2-1);%��������
b=(1-miu)*(miu*(1-miu)/cigma^2-1);


% ��ʲô��....
Tamax=29; %��������¶�
Tamin=15; %����¶�
Ta=(Tamax+Tamin)/2+(Tamax-Tamin)/2*sin(t+pi/4);

I0=1000;%���������µ�
alp=-0.0045;%��������¶�ϵ��
T0=25;%��׼�¶�


