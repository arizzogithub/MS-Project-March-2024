% set the current working directory to the folder with experimental data (replace 'Your/Path/Here' with your actual path)
cd('Your/Path/Here'););

% add SPM to the MATLAB path (replace 'Your/SPM/Path/Here' with your actual path)
addpath('Your/SPM/Path/Here/spm12');
addpath('Your/SPM/Path/Here/spm12/toolbox/LST');

% launch SPM
spm('fmri');

% specify the path to the folder with FLAIR images (replace 'Your/FLAIR/Path/Here' with your actual path)
flair_folder = 'Your/FLAIR/Path/Here';
flair_files = dir(fullfile(flair_folder, '*.nii'));

% open the CSV file to record results (replace 'Your/Output/Path/Here' with your actual path)
output_csv = fullfile('Your/Output/Path/Here', 'lesion_analysis_results.csv');
is_new_csv = ~isfile(output_csv); % check if the file is new
fid = fopen(output_csv, 'a');

% if the file is newly created, add headers
if is_new_csv
    fprintf(fid, 'FLAIR Image,Lesion Volume (ml),Number of Lesions\n');
end

% folder to save all gb_3.png files (replace 'Your/Output/Path/Here' with your actual path)
gb_folder = fullfile('Your/Output/Path/Here', 'gb');
if ~exist(gb_folder, 'dir')
    mkdir(gb_folder);
end

% loop to process all FLAIR images in the folder
for i = 1:length(flair_files)
    flair_file = fullfile(flair_folder, flair_files(i).name);
    
    % check if the file exists
    if ~isfile(flair_file)
        warning('File not found: %s', flair_file);
        continue;
    end

    % create a folder for results
    [~, flair_name, ~] = fileparts(flair_file);
    result_folder = fullfile(flair_folder, ['results_', flair_name]);
    if ~exist(result_folder, 'dir')
        mkdir(result_folder);
    end

    try
        % set parameters for LPA
        matlabbatch{1}.spm.tools.LST.lpa.data_F2 = {flair_file};
        matlabbatch{1}.spm.tools.LST.lpa.html_report = 1;

        % change to the result directory
        old_dir = cd(result_folder);

        % run LPA via SPM
        spm_jobman('run', matlabbatch);
        disp(['LPA successfully completed for FLAIR image: ', flair_name]);

        % path to the folder with results
        lesion_folder = fullfile(flair_folder, ['LST_lpa_m', flair_name]);

        % check for the presence of the gb_3.png file
        gb_image = fullfile(lesion_folder, 'gb_3.png');
        if isfile(gb_image)
            new_gb_image_name = fullfile(gb_folder, [flair_name, '.png']);
            movefile(gb_image, new_gb_image_name);
            disp(['File gb_3.png renamed and moved: ', new_gb_image_name]);
        else
            warning('File gb_3.png not found in: %s', lesion_folder);
        end

        % parse the HTML report to extract data
        report_file = fullfile(lesion_folder, ['LST_lpa_m', flair_name, '.html']);
        if isfile(report_file)
            fid_report = fopen(report_file, 'r');
            html_content = fread(fid_report, '*char')';
            fclose(fid_report);

            % find lesion volume
            volume_pattern = '<td>Lesion volume</td>\s*<td class="ta_right">([0-9.]+) ml</td>';
            volume_match = regexp(html_content, volume_pattern, 'tokens');
            if ~isempty(volume_match)
                lesion_volume = str2double(volume_match{1}{1});
                disp(['Lesion volume found: ', num2str(lesion_volume), ' ml']);
            else
                warning('Lesion volume not found in the report.');
            end

            % find number of lesions
            lesion_count_pattern = '<td>Number of lesions</td>\s*<td class="ta_right">([0-9]+)</td>';
            lesion_count_match = regexp(html_content, lesion_count_pattern, 'tokens');
            if ~isempty(lesion_count_match)
                num_lesions = str2double(lesion_count_match{1}{1});
                disp(['Number of lesions found: ', num2str(num_lesions)]);
            else
                warning('Number of lesions not found in the report.');
            end

            % record the results in the CSV
            fprintf(fid, '%s,%.2f,%d\n', flair_name, lesion_volume, num_lesions);
        else
            warning('Report file not found: %s', report_file);
        end

        % return to the original directory
        cd(old_dir);
    catch ME
        disp(['Error during LPA execution: ', ME.message]);
        cd(old_dir); % return to the original directory in case of an error
    end
end

% close the CSV file
fclose(fid);

disp('Analysis completed, results saved to the CSV file.');
