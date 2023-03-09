% Clear memory and the command window
clear;
clc;

  %% Load eeglab
    [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;


    
 
%% Initialize the ALLERP structure and CURRENTERP
ALLERP     = buildERPstruct([]);
 CURRENTERP = 0;

 
%% This defines the set of subjects and Path to the parent folder, which contains the data folders for all subjects
subject_list = importdata('subjlist_202207.txt', '\n');
nsubj        = length(subject_list); % number of subjects
%home_path  = '/Volumes/GoogleDrive/My Drive/PROVIDENCE COLLEGE/MANUSCRIPTS/PROST/DATA/ERP files with added bins/';
home_path = '/Users/jmorris/Library/CloudStorage/GoogleDrive-jamCCS@hampshire.edu/My Drive/PROVIDENCE COLLEGE/MANUSCRIPTS/PROST/DATA/ERP files with added bins/erp_2022/';

 %% Loop through all subjects
    for s=1:nsubj

        fprintf('\n******\nProcessing subject %s\n******\n\n', subject_list{s});
        
       

        % Check to make sure the dataset file exists
        % Initial filename = path plus Subject# plus _EEG.set
        sname      = subject_list{s};

        if exist(sname, 'file')<=0
                fprintf('\n *** WARNING: %s does not exist *** \n', sname);
                fprintf('\n *** Skip all processing for this subject *** \n\n');
        else 
 
            %% Load Data
            % Load original dataset
            %
            fprintf('\n\n\n**** %s: Loading dataset ****\n\n\n', subject_list{s});
            EEG = pop_loaderp('filename', subject_list{s}, 'filepath', home_path);
            
            %% Difference Wave
            % Now we will do bin operations using a set of equations
            % stored in the file 'bin_equations.txt', which must be in
            % the home folder for the experiment

            
            ERP         = pop_binoperator( ERP, [home_path 'newbins_bdf_2022.txt']);

            ERP.erpname = [subject_list{s} '_202207'];  % name for erpset menu;  
            pop_savemyerp(ERP, 'erpname', ERP.erpname, 'filename', [ERP.erpname '.erp'], 'filepath', home_path, 'warning', 'off');

       

            % Save this final ERP in the ALLERP structure.  This is not
            % necessary unless you want to see the ERPs in the GUI or if you
            % want to access them with another function (e.g., pop_gaverager)

            CURRENTERP         = CURRENTERP + 1;
            ALLERP(CURRENTERP) = ERP;
            
        end % end of the "if/else" statement that makes sure the file exists

    end % end of looping through all subjects