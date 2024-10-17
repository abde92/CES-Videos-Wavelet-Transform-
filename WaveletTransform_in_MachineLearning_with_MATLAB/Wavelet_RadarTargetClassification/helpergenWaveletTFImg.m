function helpergenWaveletTFImg(parentDir,trainingSet,testSet)
%   This function is in support of the radar classification example.
%   It may be changed or removed in a future release.

%   Copyright 2018 MathWorks,Inc.


taskNm = ["Training","Training","Test","Test"];
shapeNm = ["Cylinder","Cone","Cylinder","Cone"];
fb = cwtfilterbank('SignalLength',701);
fprintf('Generating Time-Frequency Representations...Please Wait\n');
for ns = 1:4
    if (mod(ns,4) == 1)
        tt = table2array(trainingSet(:,1:50));
        SetDir = 'Training';
        ClassDir = 'Cylinder';
    elseif (mod(ns,4) == 2)
        tt = table2array(trainingSet(:,51:100));
        SetDir = 'Training';
        ClassDir = 'Cone';
    elseif (mod(ns,4) == 3)
        tt = table2array(testSet(:,1:25));
        SetDir = 'Test';
        ClassDir = 'Cylinder';
    else
        tt = table2array(testSet(:,26:50));
        SetDir = 'Test';
        ClassDir = 'Cone';
    end
    
    
    numSig = size(tt,2);
    
    for ii = 1:numSig
        wt = cwt(tt(:,ii),'FilterBank',fb);
        helperSaveTFR(abs(wt),ii,parentDir,SetDir,ClassDir);
    end
    fprintf('   Creating %s Time-Frequency Representations ... Done\n',ClassDir);
    
end




