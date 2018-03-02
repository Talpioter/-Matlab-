
%本程序是用来修剪数据，并在训练数据集里面加入标签，以方便在Java程序中调用。

%1.首先拼接静止数据集到txt中，并且打上标签1。
% trainData0 =textread('静止XYZ.txt');  %列车静止训练数据集。
% [x0,y0]=size(trainData0); %求静止训练数据集所组成的矩阵大小，x0是行数，y0是列数。
% jignzhi=trainData0(1:x0,1:3);
% label1 = ones(10000,1);
% jingzhi_traindata = cat(2,jignzhi(1:10000,:),label1(1:10000,:));
%以上代码成功执行.

%2.拼接运动数据集到txt中，并且打上标签2。
% trainData1 =textread('运动XYZ.txt');  %列车运动训练数据集。
% [x1,y1]=size(trainData1); %求运动训练数据集所组成的矩阵大小，x0是行数，y0是列数。
% yundong = trainData1(1:x1,1:3);
% label2 = 2*ones(10000,1);
% yundong_traindata = cat(2,yundong(1:10000,:),label2(1:10000,:));
%以上代码成功执行。

%3.将jingzhi_traindata与yundong_traindata合并到同一个mat中。
%traindata = cat(1,jingzhi_traindata(1:10000,:),yundong_traindata(1:10000,:));
%以上代码成功执行。

%4.将traindata.mat里面的数据写入traindata.txt文件中。
% fid1=fopen('traindata.txt','at');
% [xm,ym] = size(traindata);
% for j1 = 1:xm 
%     for k1 = 1:ym
%         if k1 == ym %判断是否到了最后一列。
%             fprintf(fid1,'%g\n',traindata(j1,k1)); 
%         else
%             fprintf(fid1,'%g\t',traindata(j1,k1));  %每隔2个字符打印一次数据。
%         end
%     end  
% end
%以上代码执行成功。

%5.将测试数据写入txt中。
% fid2=fopen('testdata.txt','at');
% testdata = cat(1,jignzhi(1:1500,:),yundong(1:1500,:));
% [xn,yn] = size(testdata);
% for j2 = 1:xn 
%     for k2 = 1:yn
%         if k2 == yn %判断是否到了最后一列。
%             fprintf(fid2,'%g\n',testdata(j2,k2)); 
%         else
%             fprintf(fid2,'%g\t',testdata(j2,k2));  %每隔2个字符打印一次数据。
%         end
%     end  
% end
%以上代码执行成功。
