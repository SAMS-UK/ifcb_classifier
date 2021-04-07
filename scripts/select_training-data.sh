#/usr/bin/bash
#title           :select_training-data.sh
#description     :This script will create a subset training dataset
#author		 :Paola Arce
#date            :07-04-2021
#version         :0.1    
#usage		 :bash select_training-data.sh
#notes           :Folders defined to be used on WSL


# Parameters
# Folders, species and number of images
WINHOME=$(wslpath "$(wslvar USERPROFILE)")
CLASSIFIERHOME=$WINHOME/Documents/repos/ifcb_classifier
RAW_DATA=$WINHOME/SAMS/IFCB\ -\ WHOI_dataset
OUTPUT=$CLASSIFIERHOME/training-data
species=( Ceratium Euglena Coscinodiscus Gyrodinium )
n_samples=10

# Set working folder and create output folder if
# it doesn't exist
cd $CLASSIFIERHOME
mkdir -p $OUTPUT
cd $OUTPUT

# Create a small training dataset from RAW_DATA folder
# selection a randon $n_samples for each species
for i in "${species[@]}";
do
	mkdir -p $i
	ls "$RAW_DATA"/$i | shuf -n$n_samples | while read file;do cp "$RAW_DATA"/$i/$file $i/;done
	echo $i 
done

