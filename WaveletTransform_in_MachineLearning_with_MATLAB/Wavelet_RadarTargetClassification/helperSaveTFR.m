function helperSaveTFR(wt,ii,parentDir,SetDir,ClassDir)
%   This function is in support of the radar classification example. It
%   may change or be removed in a future release.

% Copyright 2018 MathWorks,Inc.


imgLoc = fullfile(parentDir,SetDir,ClassDir);
if ~exist(imgLoc,'dir')
    success = mkdir(parentDir,fullfile(SetDir,ClassDir));
end
imFileName = strcat(SetDir,'_', ClassDir,'_',num2str(ii),'.jpg');

im = ind2rgb(im2uint8(rescale(wt)),jet(128));
imwrite(imresize(im,[227 227]),fullfile(imgLoc,imFileName));
    
end