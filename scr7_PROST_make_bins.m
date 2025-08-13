    %% Clear memory and the command window
    clear;
    clc;
    
    %% Load eeglab
    [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
 
    %% Initialize the ALLERP structure and CURRENTERP
    ALLERP     = buildERPstruct([]);
    CURRENTERP = 0;
    %% Set up variables holding key values  

    prompt         = {'Enter StudyID:',...
                      'Enter TaskID:',...
                      'Enter name of subject list file:',...
                      'Enter the name of the file that contains your bin equations:',...
                      'Enter the string to append to the name of the new erp file:' };  %  array specifying the prompts in the dialog box.  Note that braces create a cell array while square brackets create a regualar array.
    dlgtitle       = 'Input';                         % title of dialog box
    dims           = [1 70];                          % dimensions of input fields
    definput       = {'PROST','exp2_newbins','prost_subjlist_2025.txt','newbins_2025.txt', '2025'};                      % sample answers as guide for how to enter data
    my_input       = inputdlg(prompt,dlgtitle,dims,definput);   % function that gets the input
    study          = my_input{1};
    taskID           = my_input{2};
    subj_list      = importdata(my_input{3});    % list of subject ids   
    bineq          = my_input{4};
    f_string       = ['_' my_input{5}];

    DIR       = pwd;                       % Current folder (where the script should be located)
    nsubj     = length(subj_list);         % number of subjects


%% Load the  ERPsets and make them available in the ERPLAB GUI

for subject = 1:nsubj
    subjID = subj_list{subject};
    subject_DIR = [DIR filesep 'DATA'];

    % Handle the case where taskID is empty
    if isempty(my_input{2})                         % which task
        taskID     = '';
    else
        taskID     = ['_' my_input{2}];
    end

    if isempty(my_input{5})
        f_string = '';
    else
        f_string  = ['_' my_input{5}];
    end   
    
    fname = [subjID taskID '.erp'];

     %% Check to make sure the dataset file exists
    if exist([subject_DIR filesep fname], 'file')<=0
                fprintf('\n *** WARNING: %s does not exist *** \n', [subject_DIR filesep fname]);
                fprintf('\n *** Skip all processing for this subject *** \n\n');
    else 

        fprintf('\n******\nProcessing subject %s\n******\n\n', subjID);
    
    

        ERP = pop_loaderp('filename', fname, 'filepath', subject_DIR);
	    CURRENTERP = CURRENTERP + 1;
        ALLERP(CURRENTERP) = ERP;     

        %% Dprime Wave
        % Now we will do bin operations using a set of equations
        % stored in the file 'bin_equations.txt', which must be in
        % the home folder for the experiment

            
        ERP         = pop_binoperator( ERP, [DIR filesep bineq]);

        ERP.erpname = [subjID taskID f_string];  % name for erpset menu;  eg
        pop_savemyerp(ERP,'erpname', ERP.erpname,...
                      'filename', [ERP.erpname '.erp'],...
                      'filepath', subject_DIR, ...
                      'warning', 'off');
       

        % Save this final ERP in the ALLERP structure.  This is not
        % necessary unless you want to see the ERPs in the GUI or if you
        % want to access them with another function (e.g., pop_gaverager)

        CURRENTERP = CURRENTERP + 1;
        ALLERP(CURRENTERP) = ERP;  

        erplab redraw;

            
            
        end % end of the "if/else" statement that makes sure the file exists
        

    end % end of looping through all subjects