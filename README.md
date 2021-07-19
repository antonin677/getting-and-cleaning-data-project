
---
title: README for Getting and Cleaning Data Course final project
author: Antonin Paquet
date: 2021-07-14
---

## Project Description

The provided script run_analysis.R was created for the final project of the **Getting and Cleaning Data** course. The objective of the project was to take the Activity Recognition Using Smartphones Dataset Version 1.0 (UCI HAR Dataset), make it tidy and extract specified variables from it, as well as create a second tidy data set containing a summary in the form of average values for the different variables. 

The script was created using RStudio Version 1.4.1106 installed on Ubuntu 20.10.

## Creating the tidy features_averages file

1. Download the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Run the run_analysis.R script from a folder containing the UCI HAR Dataset 
folder

## Script description

The first thing that the script does is read the necessary files from the UCI HAR Dataset into dataframes : 

- features  
- activity_labels  
- measured_test  
- activity_test  
- subject_test  
- measured_train  
- activity_train  
- subject_train

The measured values are divided between the **measured_test** and in **measured_train** dataframes. The script applies a series of operations on both dataframes using a pipe operator (from **tidyverse** packages). First, the columns are renamed with the **features** dataframe data to provide with more descriptive names. Second, the dataframes are subsetted to extract the variables representing means and standard deviations for the measurement, as was asked in the project instructions (The project instructions were interpreted to mean that only the features with "mean()" and "std()" at the end of the names should be extracted.). Third, a column for a variable **set** , with values **train** and **test**, is added to each dataframe before they are combined, in case that information might be needed later. 

The test and train dataframes are then combined by adding the test cases at the end of the train cases to form the following new combined dataframes : 

- activity  
- subject  
- measured  

A reformatting operation is performed on the the variable names, first to change all the camelCase formating to a simpler under_score (snake) style, to remove special characters and to lenghten certain descriptors. The full description of the old and new descriptors tokens can be found in the CodeBook.Rmd file accompanying this data set. 

A column for the fixed variable **activity** is added to the **measured** dataframe by using the **activity_labels** data ordered according to the **activity** data. 

A column for the fixed variable **suject_id** is added to the **measured** dataframe based on the **suject** dataframe

The values of the **activity** variable are reformatted to remove capital letters. 

At this point, the data in the **measured** dataframe is consided tidy. We did not juge that the variable names should be divided further to make the table taller, because each variable represent a unique signal and dividing it would probably make further data analysis more complicated.

Finally, the tidy tools **group_by()** and **summarise()** (from **tidyverse** packages) were used to produce a tidy summary dataframe containing the averages values for the different features, and this was written into the file features_averages.txt. 





