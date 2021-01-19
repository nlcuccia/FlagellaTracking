dir_0 = 'C:\Users\Nicholas\Documents\GitHub\FlagellaTracking\reptation_60x_9_g_L';
cd(dir_0);
t0 = 40; %Initial time frame
dt = 2; %Number of time frames to import

for k = t0:(t0+dt)
    %% Import File Names
    %Assemble the filename for the images at a specific time
    fname = sprintf('9_g_L_60X_.3ppm_10mMKHPO4ph7_9_g_L_60X_.3ppm_10mMKHPO4ph7_T%03d_*.tif', k);
    %Fix filename using matlab function
    fname = fullfile(dir_0,fname);
    %Create a directory object with all the files in the directory
    S = dir(fname);
    %% Extract Files
    % Obtain number of pictures in directory
    numb_stacks = numel(S);
    % Preallocate cell of neccessary size
    Im_stack = cell(numb_stacks, 1);
    % Run through images, placing each into Im_stack
    parfor i = 1:numb_stacks
        F = fullfile(dir_0, S(i).name);
        Im_stack{i, 1} = imread(F);
    end
    %% Save New Files
    cd ..
    % Make a directory to place .mat files into
    mkdir('Stacks_rep3')
    cd Stacks_rep3
%     Im_comp = cat(35, Im_stack{:, 1});
%     imwrite(Im_comp, sprintf('img_T%03d.tif', k), 'tif');
    save(sprintf('img_T%03d.mat', k-t0+1), 'Im_stack')
    cd(dir_0)
end