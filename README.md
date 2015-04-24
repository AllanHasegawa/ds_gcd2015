# HAR Tidy Dataset Generator

This scripts generates a tidy dataset from the ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This script was developed as an assignment for the "Getting and Cleaning Data" MOOC on Coursera.

## Running the script

The easiest way to run the script is to unzip the `UCI HAR Dataset.zip` into the same folder where the `run_analysis.R` file resides, and set that folder as your workding directory in R. Then, source the `run_analysis.R` file. The main function will be called automaticly when sourcing and will look for the `UCI HAR Dataset` directory in your working directory.

If the script run successfully, a `tidyData.txt` will be created in your working directory containg the tidy dataset.

## Understanding the `tidyData.txt` file

The `tidyData.txt` file contains all the features of the orinal dataset that represents mean and standard deviation for each subject id and activity.

The output is a table containg 180 tests cases (number of row), where each test case holds 66 features for each subject/activity pair (66 columns for each feature + 2 columns for subject and activity).

For a detailed description of this table, see the included `Cookbook.md`.