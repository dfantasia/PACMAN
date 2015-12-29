% import .avi files, convert to frames, save as .mat files 
clc
close all
clear all

%%

% read AVI
[filename,pathname]=uigetfile('C:\Users\michael\Desktop\Interscalene_Dataset\*.avi');
v = VideoReader([pathname,filename]);


% create a folder with the same name as the .avi file
%dir_nm1=[pathname,'mat\'];
dir_nm1=[pathname];
if exist (dir_nm1,'dir')
else
    mkdir(dir_nm1);
end

fnm1=[dir_nm1,filename(1:end-4),'.mat'];
if exist(fnm1,'file')
    disp('file exists!');
else
    disp('please wait while reading frames ...')
    % convert to frames
    k=0;
    while hasFrame(v)
        k=k+1;
        tmp=readFrame(v);
        I(:,:,k) =tmp(:,:,1);    
    end
    
    
    % save images as .mat file into the folder
    fnm1=[dir_nm1,filename(1:end-4),'.mat'];
    save(fnm1,'I');
    disp([filename(1:end-4),' was saved!']);
    disp(['images size: ',num2str(size(I))])
end
