
%%��ȡ�����е�����ֵ�����а������ٶȣ����Լ��ٶȣ��������е�X��,Z���Լ�����ĺͣ��ֱ���ȡ��9�������ľ�ֵ�ͷ��һ��18������ֵ

%�����ĺ����У�huiji(),huiji2chuyang(),
%
clc;
clear all;
close all;

%�����~�ǲ���Ҫ�ô���ֵ����˼��%d ������%e ʵ������ѧ���㷨��ʽ��%f ʵ����С����ʽ ��%g ��ϵͳ�Զ�ѡȡ�������ָ�ʽ֮һ��%s ����ַ����� 
[~,~,~,~,~,~,a11,~,c11,~,e11,~,a12,~,~,d12,~,~,a13,~,~,d13]=textread('E:\��������\��ֹ\2016-06-02_143403_ACCELEROMETER.txt','%s %d %c %d %c %d %d %c %d %c %d %c %d %c %c %f  %c %c %f  %c %c %f');
L1=length(a11);

[~,~,~,~,~,~,a21,~,c21,~,e21,~,a22,~,~,d22,~,~,a23,~,~,d23]=textread('E:\��������\��ֹ\2016-06-02_143403_GYROSCOPE.txt','%s %d %c %d %c %d %d %c %d %c %d %c %d %c %c %f  %c %c %f  %c %c %f');
L2=length(a21);

[~,~,~,~,~,~,a31,~,c31,~,e31,~,a32,~,~,d32,~,~,a33,~,~,d33]=textread('E:\��������\��ֹ\2016-06-02_143403_LINEAR_ACCELERATION.txt','%s %d %c %d %c %d %d %c %d %c %d %c %d %c %c %f  %c %c %f  %c %c %f');
L3=length(a31);
L=[L1,L2,L3];

%����huiji()�������Ƿֱ���ȡ�ͼ��ٶȣ�X�ᣬZ��ľ�ֵ������Լ��������ʱ�䡣
%S,M,T3�ֱ�Ϊ��ȡ����ֵ��ֵ������Լ���Ӧ��ʱ��
%huiji()�У�S1,M1,S2,M2,S3,M3,k,t1 �ֱ���ȡ�ͼ��ٶȣ�X�ᣬZ��ľ�ֵ������Լ��������ʱ��
if L3==max(L)
        if L1-L2>10 %L2�ɼ��ĵ�����
            [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
            [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t2);
            [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t2);
        elseif L2-L1>10  %L1�ɼ��ĵ�����
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t1);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t1);
        elseif (abs(L2-L1)<10)&&(L3-max(L2,L1)>10) %L2,L1һ���࣬������L3.
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13); 
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t1);
        else %����һ��
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
        end
elseif L2==max(L)
        if L3-L1>10  %L1�ɼ��ĵ�����
            [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
             [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t1);
            [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t1);
        elseif L1-L3>10  %L3�ɼ��ĵ�����
             [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t3);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t3);
        elseif (abs(L3-L1)<10)&&(L2-max(L3,L1)>10) %L3,L1һ���࣬������L2.
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13); 
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t1);
        else
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
        end
elseif L1==max(L)
        if L2-L3>10  %L3�ɼ��ĵ�����
            [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
            [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t3);
            [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t3);
          
        elseif (L3-L2>10)  %L2�ɼ��ĵ�����
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t2);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t2);
        elseif (abs(L3-L2)<10)&&(L1-max(L2,L3)>10) %L3,L2һ���࣬������L1.
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);  
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t2);
        else  %L3,L2,L1һ����
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
        end
end
B1=zeros(k1,1); %B=zeros(n)������n��nȫ����,B=zeros(m,n)������m��nȫ����
%B1=ones(k1,1); %��zeros()���ƣ��������ɵ���1

A1=[B1,S11',M11',S12',M12',S13',M13']; %
figure(10)
plot(t1,S11');



A2=[S21',M21',S22',M22',S23',M23'];
figure(20)
plot(t2,S21');



A3=[S31',M31',S32',M32',S33',M33'];
figure(30)
plot(t3,S31');
[m1,n1]=size(A1); %size(A)���������������Ĵ�С��
[m2,n2]=size(A2);
[m3,n3]=size(A3);
m=[m1,m2,m3];
x=min(m);
A1=A1((1:x),:);
A2=A2((1:x),:);
A3=A3((1:x),:);


A0=[A1,A2,A3];

%fopen()�Ǹ������ݰ�ָ����ʽ���뵽matlab�еĺ���,Ҳ���Ǵ��ļ�
%at:a��ʾappend,����˵д�봦���ʱ���ǽ���ԭ���ļ���������д�룬���Ǵ�ͷд�븲�ǵ���t��ʾ���ļ����������ı��ļ��� 
fid=fopen('E:\demo01\��ֹ����ֵ.txt','at');%�ǵø�������ı�עλ
         
[b1,b2]=size(A0);


%fprintf�������Խ����ݰ�ָ����ʽд�뵽�ı��ļ��С�����ø�ʽΪ��fprintf��fid��format��A��
for i=1:b1
    for j=1:b2
       fprintf(fid,'%d  ',A0(i,j));
    end
fprintf(fid,'\r\n');%����

end
%���Ҫ�ر������Ѵ򿪵��ļ���fclose(��all��)��
fclose all;%��Ҫ��������X,Y,Z��������ݷֱ��������d2,a3,d3�У�e1��a2�ֱ�Ϊʱ���¼
