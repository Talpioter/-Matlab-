
%�������������޼����ݣ�����ѵ�����ݼ���������ǩ���Է�����Java�����е��á�

%1.����ƴ�Ӿ�ֹ���ݼ���txt�У����Ҵ��ϱ�ǩ1��
% trainData0 =textread('��ֹXYZ.txt');  %�г���ֹѵ�����ݼ���
% [x0,y0]=size(trainData0); %��ֹѵ�����ݼ�����ɵľ����С��x0��������y0��������
% jignzhi=trainData0(1:x0,1:3);
% label1 = ones(10000,1);
% jingzhi_traindata = cat(2,jignzhi(1:10000,:),label1(1:10000,:));
%���ϴ���ɹ�ִ��.

%2.ƴ���˶����ݼ���txt�У����Ҵ��ϱ�ǩ2��
% trainData1 =textread('�˶�XYZ.txt');  %�г��˶�ѵ�����ݼ���
% [x1,y1]=size(trainData1); %���˶�ѵ�����ݼ�����ɵľ����С��x0��������y0��������
% yundong = trainData1(1:x1,1:3);
% label2 = 2*ones(10000,1);
% yundong_traindata = cat(2,yundong(1:10000,:),label2(1:10000,:));
%���ϴ���ɹ�ִ�С�

%3.��jingzhi_traindata��yundong_traindata�ϲ���ͬһ��mat�С�
%traindata = cat(1,jingzhi_traindata(1:10000,:),yundong_traindata(1:10000,:));
%���ϴ���ɹ�ִ�С�

%4.��traindata.mat���������д��traindata.txt�ļ��С�
% fid1=fopen('traindata.txt','at');
% [xm,ym] = size(traindata);
% for j1 = 1:xm 
%     for k1 = 1:ym
%         if k1 == ym %�ж��Ƿ������һ�С�
%             fprintf(fid1,'%g\n',traindata(j1,k1)); 
%         else
%             fprintf(fid1,'%g\t',traindata(j1,k1));  %ÿ��2���ַ���ӡһ�����ݡ�
%         end
%     end  
% end
%���ϴ���ִ�гɹ���

%5.����������д��txt�С�
% fid2=fopen('testdata.txt','at');
% testdata = cat(1,jignzhi(1:1500,:),yundong(1:1500,:));
% [xn,yn] = size(testdata);
% for j2 = 1:xn 
%     for k2 = 1:yn
%         if k2 == yn %�ж��Ƿ������һ�С�
%             fprintf(fid2,'%g\n',testdata(j2,k2)); 
%         else
%             fprintf(fid2,'%g\t',testdata(j2,k2));  %ÿ��2���ַ���ӡһ�����ݡ�
%         end
%     end  
% end
%���ϴ���ִ�гɹ���
