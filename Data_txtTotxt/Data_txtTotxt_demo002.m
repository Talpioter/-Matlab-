
%%提取数据中的特征值，其中包括加速度，线性加速度，陀螺仪中的X轴,Z轴以及三轴的和，分别提取这9个变量的均值和方差，一共18个特征值

%关联的函数有：huiji(),huiji2chuyang(),
%
clc;
clear all;
close all;

%下面的~是不需要该处的值的意思，%d 整数，%e 实数：科学计算法形式，%f 实数：小数形式 ，%g 由系统自动选取上述两种格式之一，%s 输出字符串， 
[~,~,~,~,~,~,a11,~,c11,~,e11,~,a12,~,~,d12,~,~,a13,~,~,d13]=textread('E:\测试数据\静止\2016-06-02_143403_ACCELEROMETER.txt','%s %d %c %d %c %d %d %c %d %c %d %c %d %c %c %f  %c %c %f  %c %c %f');
L1=length(a11);

[~,~,~,~,~,~,a21,~,c21,~,e21,~,a22,~,~,d22,~,~,a23,~,~,d23]=textread('E:\测试数据\静止\2016-06-02_143403_GYROSCOPE.txt','%s %d %c %d %c %d %d %c %d %c %d %c %d %c %c %f  %c %c %f  %c %c %f');
L2=length(a21);

[~,~,~,~,~,~,a31,~,c31,~,e31,~,a32,~,~,d32,~,~,a33,~,~,d33]=textread('E:\测试数据\静止\2016-06-02_143403_LINEAR_ACCELERATION.txt','%s %d %c %d %c %d %d %c %d %c %d %c %d %c %c %f  %c %c %f  %c %c %f');
L3=length(a31);
L=[L1,L2,L3];

%函数huiji()的作用是分别求取和加速度，X轴，Z轴的均值，方差，以及采样点的时间。
%S,M,T3分别为提取特征值均值，方差，以及相应的时间
%huiji()中，S1,M1,S2,M2,S3,M3,k,t1 分别是取和加速度，X轴，Z轴的均值，方差，以及采样点的时间
if L3==max(L)
        if L1-L2>10 %L2采集的点最少
            [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
            [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t2);
            [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t2);
        elseif L2-L1>10  %L1采集的点最少
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t1);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t1);
        elseif (abs(L2-L1)<10)&&(L3-max(L2,L1)>10) %L2,L1一样多，但少于L3.
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13); 
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t1);
        else %三者一样
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
        end
elseif L2==max(L)
        if L3-L1>10  %L1采集的点最少
            [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
             [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t1);
            [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t1);
        elseif L1-L3>10  %L3采集的点最少
             [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t3);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t3);
        elseif (abs(L3-L1)<10)&&(L2-max(L3,L1)>10) %L3,L1一样多，但少于L2.
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13); 
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t1);
        else
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
        end
elseif L1==max(L)
        if L2-L3>10  %L3采集的点最少
            [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
            [S21,M21,S22,M22,S23,M23,k2,t2]=huiji2chuyang(a21,c21,e21,a22,d22,a23,d23,t3);
            [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t3);
          
        elseif (L3-L2>10)  %L2采集的点最少
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t2);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji2chuyang(a31,c31,e31,a32,d32,a33,d33,t2);
        elseif (abs(L3-L2)<10)&&(L1-max(L2,L3)>10) %L3,L2一样多，但少于L1.
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);  
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji2chuyang(a11,c11,e11,a12,d12,a13,d13,t2);
        else  %L3,L2,L1一样多
              [S11,M11,S12,M12,S13,M13,k1,t1]=huiji(a11,c11,e11,a12,d12,a13,d13);
              [S21,M21,S22,M22,S23,M23,k2,t2]=huiji(a21,c21,e21,a22,d22,a23,d23);
              [S31,M31,S32,M32,S33,M33,k3,t3]=huiji(a31,c31,e31,a32,d32,a33,d33);
        end
end
B1=zeros(k1,1); %B=zeros(n)：生成n×n全零阵,B=zeros(m,n)：生成m×n全零阵
%B1=ones(k1,1); %与zeros()相似，不过生成的是1

A1=[B1,S11',M11',S12',M12',S13',M13']; %
figure(10)
plot(t1,S11');



A2=[S21',M21',S22',M22',S23',M23'];
figure(20)
plot(t2,S21');



A3=[S31',M31',S32',M32',S33',M33'];
figure(30)
plot(t3,S31');
[m1,n1]=size(A1); %size(A)函数是用来求矩阵的大小的
[m2,n2]=size(A2);
[m3,n3]=size(A3);
m=[m1,m2,m3];
x=min(m);
A1=A1((1:x),:);
A2=A2((1:x),:);
A3=A3((1:x),:);


A0=[A1,A2,A3];

%fopen()是个将数据按指定格式读入到matlab中的函数,也就是打开文件
%at:a表示append,就是说写入处理的时候是接着原来文件已有内容写入，不是从头写入覆盖掉，t表示打开文件的类型是文本文件。 
fid=fopen('E:\demo01\静止特征值.txt','at');%记得更改上面的标注位
         
[b1,b2]=size(A0);


%fprintf函数可以将数据按指定格式写入到文本文件中。其调用格式为：fprintf（fid，format，A）
for i=1:b1
    for j=1:b2
       fprintf(fid,'%d  ',A0(i,j));
    end
fprintf(fid,'\r\n');%换行

end
%如果要关闭所有已打开的文件用fclose(‘all’)。
fclose all;%需要的数据在X,Y,Z三轴的数据分别存在数组d2,a3,d3中，e1和a2分别为时间记录
