
%以下程序为提取列车原始动，静数据集中的X，Y，Z轴的数据，并将其分别写入两个不同的txt文件中。
clc;clear;close all;
All_yundong = dir(fullfile('F:\地铁运动状态数据全集_2018.2.1\3.各线地铁数据大集合\所有的加速度传感器_运动数据集合','*.txt'));

fid2=fopen('运动XYZ.txt','at'); %打开运动XYZ.txt，准备把X,Y,Z的数据写进去；at：后续写入（文件若不存在，自动创建）。
%filepath='F:\地铁运动状态数据全集_2018.2.1\3.各线地铁数据大集合\所有的加速度传感器_运动数据集合';
% filelist=dir([filepath '\*.txt']);

for index = 1:24
    yy1 = All_yundong(index).name;
    [X2,Y2,Z2]=textread(yy1,'%*s %*s %*s %*s %f %*s %f %*s %f'); %提取静止数据集。
    
    B=[X2,Y2,Z2]; %A为由静止数据集里面的各轴数据所组成的大矩阵，后续要切为多个小矩阵
    [m1,n1]=size(B);%得出矩阵A的m1行n1列。
  
    for j1 = 1:m1 
      for k1 = 1:n1
        if k1 == n1 %判断是否到了最后一列。
            fprintf(fid2,'%g\n',B(j1,k1)); 
        else
            fprintf(fid2,'%g\t',B(j1,k1));  %每隔2个字符打印一次数据。
        end
      end  
   end
end


fclose all; %必须要有，关闭进程，不然数据量一大计算机就会卡。