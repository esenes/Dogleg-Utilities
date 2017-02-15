%% ADD DELAY
close all; clearvars; clc;

%fpath = 'W:\Backup_SSD\swap_out\exp\';
fpath = '/Users/esenes/swap_out/exp/';
fname = 'Exp_analized_Loaded41MW_';
fnum = {'1','2','3','4','5','6','7','8','9','10','11_1','12','13'};
fnum = {'1','2','3'};
fext = '.mat';

spat = '/Users/esenes/Desktop/new_datasets/';

for k=1:length(fnum) %loop over files
    fullName = [fpath fname fnum{k} fext];
    disp(['Processing file: ' fullName])
    
    %build list of variables
    matObj = matfile(fullName);
    info = whos(matObj);
    [varlen, ~] = size(info);
    varlst = {};
    for l=1:varlen
        varlst = [varlst info(l).name];
    end
    disp(['varlen= ' num2str(varlen)])
    %disp(['BDs= ' num2str(length(BDs_ts))])  
    varlst
    load(fullName,'BDs_ts')
    disp(['#BD= ' num2str(length(BDs_ts))])
    disp(' ')
    
%     fullName = [fpath fname fnum{k} fext]
%     disp(['Processing file: ' fullName])
%     load(fullName,'BDs_ts','BDs_ts_new')
%     
    
% 
%     %loading
%     load(fullName)
% 
%     events = fieldnames(BD_struct);
%     
%     for m=1:length(events)
%         if isfield(BD_struct.(events{m}),'position')
%             BD_struct.(events{m}).position.edge.delay_edge = BD_struct.(events{m}).position.edge.time_REF-BD_struct.(events{m}).position.edge.time_TRA;
%     
%         end
%     end
%     
%     %save
%     fileattrib(fullName,'+w','a');
%     save(fullName,varlst{:},'-v7.3')
%     fileattrib(fullName,'-w','a');
%    
end
