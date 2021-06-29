clc, clear
% This code concatenates the data for the Azure Classification
load('nicest.mat')

% res(:,1) = normalize(res(:,1));
% res(:,2) = normalize(res(:,2));

M = [res1;res2];

fid = fopen('hello.csv', 'wt');
fprintf(fid, '%s,%s,%s\n', 'Freqency', 'Prominence', 'Section');
fprintf(fid, '%g,%g,%d\n', M.');   %transpose is important!
fclose(fid);

