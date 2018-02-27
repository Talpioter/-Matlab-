
%以下程序为提取列车原始动，静数据集中的X，Y，Z轴的数据，并将其分别写入两个不同的txt文件中。

clc;clear;close all;

%把X,Y,Z的数据从采集的数据中分离提取出来。 
[X1,Y1,Z1]=textread('静止数值.txt','%*s %*s %*s %*s %f %*s %f %*s %f'); %提取静止数据集。
[X2,Y2,Z2]=textread('运动数值.txt','%*s %*s %*s %*s %f %*s %f %*s %f'); %提取运动数据集。
%要记得，静止数值.txt和运动数值.txt等相关txt数据文件要放在matlab当前工作目录下，否则要完整写成txt数据文件所在的详细路径。

fid1=fopen('静止XYZ.txt','at'); %打开静止XYZ.txt，准备把X,Y,Z的数据写进去；at：后续写入（文件若不存在，自动创建）。
fid2=fopen('运动XYZ.txt','at'); %打开运动XYZ.txt，准备把X,Y,Z的数据写进去；at：后续写入（文件若不存在，自动创建）。

A=[X1,Y1,Z1]; %A为由静止数据集里面的各轴数据所组成的大矩阵，后续要切为多个小矩阵。
B=[X2,Y2,Z2]; %B为由运动数据集里面的各轴数据所组成的大矩阵，后续要切为多个小矩阵。

[m1,n1]=size(A);%得出矩阵A的m1行n1列。
[m2,n2]=size(B);%得出矩阵B的m2行n2列。

%%把静止数据集的XYZ轴数据打印到静止XYZ.txt里面去。
for j1 = 1:m1 
    for k1 = 1:n1
        if k1 == n1 %判断是否到了最后一列。
            fprintf(fid1,'%g\n',A(j1,k1)); 
        else
            fprintf(fid1,'%g\t',A(j1,k1));  %每隔2个字符打印一次数据。
        end
    end  
end

%把运动数据集的XYZ轴数据打印到运动XYZ.txt里面去。
for j2 = 1:m2 
    for k2 = 1:n2
        if k2 == n2 %判断是否到了最后一列。
            fprintf(fid2,'%g\n',B(j2,k2)); 
        else
            fprintf(fid2,'%g\t',B(j2,k2));  %每隔2个字符打印一次数据。
        end
    end
end


%这里是为了直接查看数据的波动情况，可以注释掉。
% figure(1) %打印矩阵A
% plot(A);
% legend('Z轴数据','Y轴数据','X轴数据');
% 
% figure(2) %打印矩阵B
% plot(B);
% legend('Z轴数据','Y轴数据','X轴数据');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fclose all; %必须要有，关闭进程，不然数据量一大计算机就会卡。