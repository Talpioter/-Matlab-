clc;clear;close all;

tic
%�������ݼ�
trainData0 =textread('��ֹXYZ.txt');  %�г���ֹѵ�����ݼ���
trainData1 =textread('�˶�XYZ.txt');  %�г��˶�ѵ�����ݼ���
%testData = textread('����XYZ.txt');  %������ѵ�����ݼ��Ĳ������ݼ���

[x0,y0]=size(trainData0); %��ֹѵ�����ݼ�����ɵľ����С��x0��������y0��������
[x1,y1]=size(trainData1); %���˶�ѵ�����ݼ�����ɵľ����С��x1��������y2��������
%[x2,y2]=size(testData);
%test=testData;

meas0=trainData0(1:x0,1:3);
meas1=trainData1(1:x1,1:3);

training=cat(1,meas0(1:75019,:), meas1(1:75019,:)); %cat(1, A, B) %����ƴ����������������ͬ����cat(2, A, B) %����ƴ����������������ͬ����
%train=[meas0(1:26,:); meas1(1:26,:)]; %�����.mat�����ļ�������26x6�ľ����൱��cat(2, A, B) %����ƴ����������������ͬ����

test_data=cat(1,meas0(75020:107170,:), meas1(75020:107170,:)); %�����ȡ�������ݼ��е�һ������Ϊ���Լ���
test_label = [(ones(1,32151));(2*ones(1,32151))]';

%����������Ϊ1,2��1Ϊ�г���ֹ��2Ϊ�г��˶���
class = [ones(1,75019),2*ones(1,75019)]'; %������mat������52��1�е�1��2��1��2ǰ���ռ26�С�

%��ź�ѵ�����ݱ�������ͬ��������ѵ�����ݺͲ������ݱ�������ͬ���У�
nb = NaiveBayes.fit(training,class);

%disp(class); %disp()������Ļ���������������c�����е�printf��������
predict_label = predict(nb,test_data);
disp(predict_label)
toc

count=0;
for i=(1:64302)
   if predict_label(i)==test_label(i)  
      count=count+1;
   end
end
fprintf('�г�״̬�ж�׼ȷ��Ϊ��%f\n' ,count/64302);

% clc;clear;close all;
















