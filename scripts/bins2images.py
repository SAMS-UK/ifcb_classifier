#!/usr/bin/env python
import ifcb
from pathlib import Path
import os
import imageio
import numpy as np
import argparse


def main(args):
    data_dir = ifcb.DataDirectory(args.input_dir)
    for sample_bin in data_dir:
        print(sample_bin)
        number_of_images = len(sample_bin.images)
        lid = sample_bin.lid
        print('{} has {} image(s)'.format(lid, number_of_images))
        with sample_bin:
            path = os.path.join(args.output_dir,lid)
            Path(path).mkdir(parents=True,exist_ok=True)
            for roi_number in sample_bin.images:
                img_path = os.path.join(path, lid + '_' + str(roi_number) + '.png')
                print(img_path)
                imageio.imwrite(img_path, sample_bin.images[roi_number])
	

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Convert IFCB bins into images')
    parser.add_argument('--input_dir', type=str, default='../notebooks/raw_data/', help='IFCB bins folder')
    parser.add_argument('--output_dir', type=str, default='../notebooks/images/', help='Images folder')
    args = parser.parse_args()
    main(args)
    
