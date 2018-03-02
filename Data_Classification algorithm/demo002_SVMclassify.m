clc;clear;close all;

tic
%导入数据集
trainData0 =textread('静止XYZ.txt');  %列车静止训练数据集。
trainData1 =textread('运动XYZ.txt');  %列车运动训练数据集。
%testData = textread('测试XYZ.txt');  %独立于训练数据集的测试数据集。

[x0,y0]=size(trainData0); %求静止训练数据集所组成的矩阵大小，x0是行数，y0是列数。
[x1,y1]=size(trainData1); %求运动训练数据集所组成的矩阵大小，x1是行数，y2是列数。
%[x2,y2]=size(testData);
%test=testData;

meas0=trainData0(1:x0,1:3);
meas1=trainData1(1:x1,1:3);

train=cat(1,meas0(1:75019,:), meas1(1:75019,:)); %cat(1, A, B) %按列拼接两个矩阵（列数相同）；cat(2, A, B) %按行拼接两个矩阵（行数相同）。
%train=[meas0(1:26,:); meas1(1:26,:)]; %这句在.mat数据文件中生成26x6的矩阵，相当于cat(2, A, B) %按行拼接两个矩阵（行数相同）。

test=cat(1,meas0(75020:107170,:), meas1(75020:107170,:)); %这句是取两类数据集中的一部分作为测试集。

%类属性设置为1,2。1为列车静止，2为列车运动。
group = [ones(1,75019),2*ones(1,75019)]'; %本句在mat里生成52行1列的1和2；1和2前后各占26行。


%标号和训练数据必须有相同的行数；训练数据和测试数据必须有相同的列；
svmModel = svmtrain(train,group,'kernel_function','rbf','showplot',true);

classification = svmclassify(svmModel,test,'Showplot',true);

testGroup = [(ones(1,32151));(2*ones(1,32151))]';
% figure;
% hold on;
% plot(testGroup,'o');
% plot(class,'*');
% legend('测试集正确分类','分类结果'); %显示结果
%disp(classification); %disp()就是屏幕输出函数，类似于c语言中的printf（）函数
toc

count=0;
for i=(1:64302)
   if classclassification(i)==testGroup(i)  
      count=count+1;
   end
end
fprintf('列车状态判断准确率为：%f\n' ,count/64302);

% clc;clear;close all;