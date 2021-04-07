#!/usr/bin/bash
#title           :Training the classifier
#description     :This script will set parameters and build the classifier
#author		 :Paola Arce
#date            :07-04-2021
#version         :0.1    
#usage		 :bash run_neuston_net.sh
#notes           :Folders defined to be used on WSL


## Set CONDA env ##
source ~/miniconda3/etc/profile.d/conda.sh
conda activate ifcbnn

# Parameters
DATASET=training-data
MODEL=inception_v3
TRAIN_ID=training-example
WINHOME=$(wslpath "$(wslvar USERPROFILE)")
CLASSIFIERHOME=$WINHOME/Documents/repos/ifcb_classifier

# Set working directory and train the classifier
cd $CLASSIFIERHOME
python neuston_net.py TRAIN "$DATASET" "$MODEL" "$TRAIN_ID" --flip xy

# Output folder by default: training-output/$TRAIN_ID

