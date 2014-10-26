Getting and Cleaning Data Course README

This file explains how run_analysi.R script is designed.

    1. Download the data from the internet and unzip the folders in a folder called "UCI_HAR_Dataset"
    Make sure the folder contains the run_analysis.R script and set the "UCI_HAR_Dataset" as your current working directory.
    2. Source("run_analysis.R") command in RStudio.
    3.You will find an output file generated in the current working directory:
        merged_data.txt (8.3 Mb): it contains a data frame called fresh_data which is 10299x68.
        