function Outputlabels = KNNclassify(test)
coder.load (test.mat);
coder.load (testGroup.mat);
coder.load (train.mat);
coder.load (trainGroup.mat);
Outputlabels = knnclassify1(test,train,trainGroup,4,'cityblock','nearest');
disp(Outputlabels); 
end




