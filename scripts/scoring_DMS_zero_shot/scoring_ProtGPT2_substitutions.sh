#!/bin/bash 

source ../zero_shot_config.sh
source activate proteingym_env

export ProtGPT2_model_name_or_path="nferruz/ProtGPT2"
export output_scores_folder="${DMS_output_score_folder_subs}/ProtGPT2"
export DMS_index="0"

# Check if the directory exists
if [ ! -d "$output_scores_folder" ]; then
    echo "Directory does not exist, creating directory: $output_scores_folder"
    mkdir "$output_scores_folder"
else
    echo "Directory already exists: $output_scores_folder"
fi

python ../../proteingym/baselines/protgpt2/compute_fitness.py \
            --ProtGPT2_model_name_or_path ${ProtGPT2_model_name_or_path} \
            --DMS_reference_file_path ${DMS_reference_file_path_subs} \
            --DMS_data_folder ${DMS_data_folder_subs} \
            --DMS_index $DMS_index \
            --output_scores_folder ${output_scores_folder}