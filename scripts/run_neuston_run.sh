#!/usr/bin/bash
#title           :Running the classifier with test data
#description     :This script will set parameters and run the classifier
#author		 :Paola Arce
#date            :07-04-2021
#version         :0.1    
#usage		 :bash run_neuston_run.sh
#notes           :Folders defined to be used on WSL


## Set CONDA env ##
source ~/miniconda3/etc/profile.d/conda.sh
conda activate ifcbnn

DATASET=run-data
TRAIN_ID=training-example
MODEL=training-output/$TRAIN_ID/$TRAIN_ID.ptl
RUN_ID=testing-example
CLASSIFIERHOME=$WINHOME/Documents/repos/ifcb_classifier

# Set working directory and train the classifier
cd $CLASSIFIERHOME
python neuston_run.py RUN "$DATASET" "$MODEL" "$RUN_DIR"

# Output folder by default: run-output/$RUN_ID

