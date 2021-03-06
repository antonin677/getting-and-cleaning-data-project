Codebook for Getting and Cleaning Data Course final project
================
Antonin Paquet
2021-07-14

## Project Description

This is the final project for the Getting and Cleaning Data Course. It
aimed at tiding a subset of the Human Activity Recognition Using
Smartphones Dataset Version 1.0 (UCI HAR Dataset) and producing a second
tidy data set with the average of each variable for each activity and
each subject.

## Information on the raw data

The raw data used for this project was the UCI HAR Dataset. The raw data
came from three axial signals of acceleremeters and gyroscopes that the
participant were wearing while performing a series of activities
(walking, walking upstairs, walking downstairs, sitting, standing,
laying). Following is the explanation of the variables as quoted
directly from the features\_info.txt accompaying the UCI HAR Dataset :

> The features selected for this database come from the accelerometer
> and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time
> domain signals (prefix âtâ to denote time) were captured at a constant
> rate of 50 Hz. Then they were filtered using a median filter and a 3rd
> order low pass Butterworth filter with a corner frequency of 20 Hz to
> remove noise. Similarly, the acceleration signal was then separated
> into body and gravity acceleration signals (tBodyAcc-XYZ and
> tGravityAcc-XYZ) using another low pass Butterworth filter with a
> corner frequency of 0.3 Hz.
>
> Subsequently, the body linear acceleration and angular velocity were
> derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
> tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
> signals were calculated using the Euclidean norm (tBodyAccMag,
> tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these
> signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
> fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the âfâ to
> indicate frequency domain signals).
>
> These signals were used to estimate variables of the feature vector
> for each pattern:  
> â-XYZâ is used to denote 3-axial signals in the X, Y and Z directions.
>
> tBodyAcc-XYZ  
> tGravityAcc-XYZ  
> tBodyAccJerk-XYZ  
> tBodyGyro-XYZ  
> tBodyGyroJerk-XYZ  
> tBodyAccMag  
> tGravityAccMag  
> tBodyAccJerkMag  
> tBodyGyroMag  
> tBodyGyroJerkMag  
> fBodyAcc-XYZ  
> fBodyAccJerk-XYZ  
> fBodyGyro-XYZ  
> fBodyAccMag  
> fBodyAccJerkMag  
> fBodyGyroMag  
> fBodyGyroJerkMag
>
> The set of variables that were estimated from these signals are:
>
> mean(): Mean value  
> std(): Standard deviation  
> mad(): Median absolute deviation  
> max(): Largest value in array  
> min(): Smallest value in array  
> sma(): Signal magnitude area  
> energy(): Energy measure. Sum of the squares divided by the number of
> values.  
> iqr(): Interquartile range  
> entropy(): Signal entropy  
> arCoeff(): Autorregresion coefficients with Burg order equal to 4  
> correlation(): correlation coefficient between two signals  
> maxInds(): index of the frequency component with largest magnitude  
> meanFreq(): Weighted average of the frequency components to obtain a
> mean frequency  
> skewness(): skewness of the frequency domain signal  
> kurtosis(): kurtosis of the frequency domain signal  
> bandsEnergy(): Energy of a frequency interval within the 64 bins of
> the FFT of each window.  
> angle(): Angle between to vectors.
>
> Additional vectors obtained by averaging the signals in a signal
> window sample. These are used on the angle() variable:
>
> gravityMean  
> tBodyAccMean  
> tBodyAccJerkMean  
> tBodyGyroMean  
> tBodyGyroJerkMean

## Creating the tidy datafile

### Creating the tidy features\_average file

1.  Download the [UCI HAR
    Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2.  Run the run\_analysis.R script from a folder containing the UCI HAR
    Dataset folder

### Processing and tidying of the data

The run\_analysis.R script combines the various tables in the UCI HAR
Dataset to add to the measured values table : descriptive variables
names, a column with descriptive activity names and a column with
subject id. A column for a **set** variable is also added, with values
**train** or **test**, before combining the train and test data, in case
that information needs to be retrieved later. The scripts also extracts
the measurements on the mean and standard deviation for each measurement
as was asked in the project instructions. (It should be noted that these
project instructions were interpreted to mean to extract the values that
calculated the mean and standard deviation as the last step, so only the
features with âmean()â and âstd()â at the end of the names were
extracted.). Finaly, the script creates a second tidy data set, named
*features\_averages.txt*, with the averages for the different features,
for each activities and each sujects. The detail of the script working
can be found in the README.md file accomganying this data set.

## Description of the variables in the tidy features\_averages.txt file

|     |
|----:|
| 180 |
|  69 |

Dimensions of the data set

|     | subject\_id  | activity         | set              | time\_body\_acc\_mean\_x | time\_body\_acc\_mean\_y | time\_body\_acc\_mean\_z |
|:----|:-------------|:-----------------|:-----------------|:-------------------------|:-------------------------|:-------------------------|
|     | Min. : 1.0   | Length:180       | Length:180       | Min. :0.2216             | Min. :-0.040514          | Min. :-0.15251           |
|     | 1st Qu.: 8.0 | Class :character | Class :character | 1st Qu.:0.2712           | 1st Qu.:-0.020022        | 1st Qu.:-0.11207         |
|     | Median :15.5 | Mode :character  | Mode :character  | Median :0.2770           | Median :-0.017262        | Median :-0.10819         |
|     | Mean :15.5   | NA               | NA               | Mean :0.2743             | Mean :-0.017876          | Mean :-0.10916           |
|     | 3rd Qu.:23.0 | NA               | NA               | 3rd Qu.:0.2800           | 3rd Qu.:-0.014936        | 3rd Qu.:-0.10443         |
|     | Max. :30.0   | NA               | NA               | Max. :0.3015             | Max. :-0.001308          | Max. :-0.07538           |

Summary of the data set

|                                        |
|:---------------------------------------|
| subject\_id                            |
| activity                               |
| set                                    |
| time\_body\_acc\_mean\_x               |
| time\_body\_acc\_mean\_y               |
| time\_body\_acc\_mean\_z               |
| time\_body\_acc\_std\_x                |
| time\_body\_acc\_std\_y                |
| time\_body\_acc\_std\_z                |
| time\_gravity\_acc\_mean\_x            |
| time\_gravity\_acc\_mean\_y            |
| time\_gravity\_acc\_mean\_z            |
| time\_gravity\_acc\_std\_x             |
| time\_gravity\_acc\_std\_y             |
| time\_gravity\_acc\_std\_z             |
| time\_body\_acc\_jerk\_mean\_x         |
| time\_body\_acc\_jerk\_mean\_y         |
| time\_body\_acc\_jerk\_mean\_z         |
| time\_body\_acc\_jerk\_std\_x          |
| time\_body\_acc\_jerk\_std\_y          |
| time\_body\_acc\_jerk\_std\_z          |
| time\_body\_gyro\_mean\_x              |
| time\_body\_gyro\_mean\_y              |
| time\_body\_gyro\_mean\_z              |
| time\_body\_gyro\_std\_x               |
| time\_body\_gyro\_std\_y               |
| time\_body\_gyro\_std\_z               |
| time\_body\_gyro\_jerk\_mean\_x        |
| time\_body\_gyro\_jerk\_mean\_y        |
| time\_body\_gyro\_jerk\_mean\_z        |
| time\_body\_gyro\_jerk\_std\_x         |
| time\_body\_gyro\_jerk\_std\_y         |
| time\_body\_gyro\_jerk\_std\_z         |
| time\_body\_acc\_mag\_mean             |
| time\_body\_acc\_mag\_std              |
| time\_gravity\_acc\_mag\_mean          |
| time\_gravity\_acc\_mag\_std           |
| time\_body\_acc\_jerk\_mag\_mean       |
| time\_body\_acc\_jerk\_mag\_std        |
| time\_body\_gyro\_mag\_mean            |
| time\_body\_gyro\_mag\_std             |
| time\_body\_gyro\_jerk\_mag\_mean      |
| time\_body\_gyro\_jerk\_mag\_std       |
| frequency\_body\_acc\_mean\_x          |
| frequency\_body\_acc\_mean\_y          |
| frequency\_body\_acc\_mean\_z          |
| frequency\_body\_acc\_std\_x           |
| frequency\_body\_acc\_std\_y           |
| frequency\_body\_acc\_std\_z           |
| frequency\_body\_acc\_jerk\_mean\_x    |
| frequency\_body\_acc\_jerk\_mean\_y    |
| frequency\_body\_acc\_jerk\_mean\_z    |
| frequency\_body\_acc\_jerk\_std\_x     |
| frequency\_body\_acc\_jerk\_std\_y     |
| frequency\_body\_acc\_jerk\_std\_z     |
| frequency\_body\_gyro\_mean\_x         |
| frequency\_body\_gyro\_mean\_y         |
| frequency\_body\_gyro\_mean\_z         |
| frequency\_body\_gyro\_std\_x          |
| frequency\_body\_gyro\_std\_y          |
| frequency\_body\_gyro\_std\_z          |
| frequency\_body\_acc\_mag\_mean        |
| frequency\_body\_acc\_mag\_std         |
| frequency\_body\_acc\_jerk\_mag\_mean  |
| frequency\_body\_acc\_jerk\_mag\_std   |
| frequency\_body\_gyro\_mag\_mean       |
| frequency\_body\_gyro\_mag\_std        |
| frequency\_body\_gyro\_jerk\_mag\_mean |
| frequency\_body\_gyro\_jerk\_mag\_std  |

Variables present in the data set

### Fixed variable 1

Name : subject\_id  
Describes the subject id within a group of 30 volunteers who
participated in the study

-   Class of the variable : integer  
-   Unique values/levels of the variable : 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
    27, 28, 29, 30
-   Unit of measurement : no units

### Fixed variable 2

Name : activity  
Describes the activities that the subjects were performing during the
measurements

-   Class of the variable : character  
-   Unique values/levels of the variable : laying, sitting, standing,
    walking, walking\_downstairs, walking\_upstairs
-   Unit of measurement : no units

### Fixed variable 3

Name : set  
Describes the set that subjects were assigned to

-   Class of the variable : character  
-   Unique values/levels of the variable : train, test
-   Unit of measurement : no units

### Measured variables 1 to 66

These variables are named according to multiple levels of descriptor
tokens that refer to the type of measurements and the various operations
applied on the measurements.

#### descriptors tokens used in the measured variable names

| Descriptor token used in raw data | New descriptor token used in tidy data | Description                                                                                                |
|:----------------------------------|:---------------------------------------|:-----------------------------------------------------------------------------------------------------------|
| t                                 | time                                   | Refers to time domain signal                                                                               |
| f                                 | frequency                              | Refers to frequency domain signal                                                                          |
| Body                              | body                                   | Refers to the portion of the acceleration signal that is associated with the motion of the body            |
| Gravity                           | gravity                                | Refers to the portion of the acceleration signal that is associated with the effect of the earthâs gravity |
| Acc                               | acc                                    | Refers to raw linear acceleration signal from accelerometer or signals derived from that raw signal        |
| Gyro                              | gyro                                   | Refers to raw angular velocity signal form gyroscope or signals derived from that raw signal               |
| Jerk                              | jerk                                   | Refers to jerk signal calculated by derivation of linear acceleration or angular velocity in time          |
| -X                                | x                                      | Refers to a signal axial component in the x direction                                                      |
| -Y                                | y                                      | Refers to a signal axial component in the y direction                                                      |
| -Z                                | z                                      | Refers to a vector signal axial component in the z direction                                               |
| Mag                               | mag                                    | Refers to the magnitude of a vector signal calculated with Euclidean norm                                  |
| -mean()                           | mean                                   | Refers to the mean value variable estimated from a signal                                                  |
| -std                              | std                                    | Refers to the standard deviation variable estimated from a signal                                          |

-   Class of the variables : numeric
-   Unique values/levels of the variable : as many as lines
-   Unit of measurement : âThe Features are normalized and bounded
    within \[-1,1\]â (ref : README.txt file accompanying UCI HAR
    Dataset)

### additional notes on measured variable names formating

All variable names were converted to lower caps underscore (snake)
formatting. Special characters like â-â and â()â were removed.
