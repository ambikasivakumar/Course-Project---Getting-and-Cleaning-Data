## Codebook for the Getting and Cleaning Data Course Project

This codebook gives us an overview of the [Dataset](#Dataset), its [Variables](#Variables) and the various [Transformations](#Transformations) applied to clean up the data

### Dataset

**tidydata.txt** is a text file that contains the cleaned up dataset. The dimensions of the dataset along with its variable names are tabulated below

|     Dimension       | Value |
|:-------------------:|:-----:|
| Observations (Rows) |  180  |
| Variables (Columns) |  68   |

### Variables

A summary of the various attributes (variables) in the dataset are described below. Each row in the data set contains the values averaged over 66 features (measurements), per subject, per activity. Hence, there are 6 rows per subject for each of the 30 subjects across each activity, summing up to a total of 180 rows in the data set. The data set does not contain any missing values

|     Attribute                                | Class   |    Unique Values    |    Description         |
|:--------------------------------------------:|:-------:|:-------------------:|:----------------------:|
|Subject                                       | Factor  |      30             |  Subject ID            |
|Activity                                      | Factor  |      6              |  Acitivty Performed    |
|TimeBodyAccelerometer-mean()-X                | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometer-mean()-Y                | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometer-mean()-Z                | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometer-std()-X                 | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometer-std()-Y                 | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometer-std()-Z                 | Numeric |      180            |  Time Body Signal      |
|TimeGravityAccelerometer-mean()-X             | Numeric |      180            |  Time Body Signal      |
|TimeGravityAccelerometer-mean()-Y             | Numeric |      180            |  Time Body Signal      |
|TimeGravityAccelerometer-mean()-Z             | Numeric |      180            |  Time Body Signal      |
|TimeGravityAccelerometer-std()-X              | Numeric |      180            |  Time Body Signal      |
|TimeGravityAccelerometer-std()-Y              | Numeric |      180            |  Time Body Signal      |
|TimeGravityAccelerometer-std()-Z              | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometerJerk-mean()-X            | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometerJerk-mean()-Y            | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometerJerk-mean()-Z            | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometerJerk-std()-X             | Numeric |      180            |  Time Body Signal      |
|TimeBodyAccelerometerJerk-std()-Y             | Numeric |      180            |  Time Body Signal      |
TimeBodyAccelerometerJerk-std()-Z              | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometer-mean()-X                     | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometer-mean()-Y                     | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometer-mean()-Z                     | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometer-std()-X                      | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometer-std()-Y                      | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometer-std()-Z                      | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerk-mean()-X                 | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerk-mean()-Y                 | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerk-mean()-Z                 | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerk-std()-X                  | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerk-std()-Y                  | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerk-std()-Z                  | Numeric |      180            |  Time Body Signal      |
TimeBodyAccelerometerMagniture-mean()          | Numeric |      180            |  Time Body Signal      |
TimeBodyAccelerometerMagniture-std()           | Numeric |      180            |  Time Body Signal      |
TimeGravityAccelerometerMagniture-mean()       | Numeric |      180            |  Time Body Signal      |
TimeGravityAccelerometerMagniture-std()        | Numeric |      180            |  Time Body Signal      |
TimeBodyAccelerometerJerkMagniture-mean()      | Numeric |      180            |  Time Body Signal      |
TimeBodyAccelerometerJerkMagniture-std()       | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerMagniture-mean()              | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerMagniture-std()               | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerkMagniture-mean()          | Numeric |      180            |  Time Body Signal      |
TimeBodyGyrometerJerkMagniture-std()           | Numeric |      180            |  Time Body Signal      |
FrequencyBodyAccelerometer-mean()-X            | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometer-mean()-Y            | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometer-mean()-Z            | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometer-std()-X             | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometer-std()-Y             | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometer-std()-Z             | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerk-mean()-X        | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerk-mean()-Y        | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerk-mean()-Z        | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerk-std()-X         | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerk-std()-Y         | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerk-std()-Z         | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometer-mean()-X                | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometer-mean()-Y                | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometer-mean()-Z                | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometer-std()-X                 | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometer-std()-Y                 | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometer-std()-Z                 | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerMagniture-mean()     | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerMagniture-std()      | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerkMagniture-mean() | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyAccelerometerJerkMagniture-std()  | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometerMagniture-mean()         | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometerMagniture-std()          | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometerJerkMagniture-mean()     | Numeric |      180            |  Frequency Body Signal |
FrequencyBodyGyrometerJerkMagniture-std()      | Numeric |      180            |  Frequency Body Signal |

### Transformations

The various tarnsformations applied on the original **UCI HAR Dataset** are described below

1. The training and test set files were first loaded and merged as one single table called ```data```. This table contains 563 rows (Subject, Activity and 561 other features (variables) for which the measurements were recorded)

2. The variables measuring the mean and standard deviation of each mesaurement are extracted from the ```data``` table and stored in a new table called ```required.data```, containing 68 columns (Subject, Activity and 66 other features (variables) measuring the mean and std of each feature)

3. A descreptive name is given for each activity in the ```required.data``` table

4. The column names (feature names) in the ```required.data``` table are replaced with descreptive names. A function called ```rename.columns``` performs the following transformations
    i. All instances beginning with *t* are replaced with *Time*
    ii. All instances beginning with *f* are replaced with *Frequency*
    iii. All instances with the word *Body* repeated twice are modified to contain only *Body*       only once
    iv. The words *Acc*, *Gyro* and *Mag* are expanded into their full forms - *Accelerometer*, *Gyrometer* and *Magnitude*, respectively

5. The data from step 4 is finally grouped according to the Subject and Activity and aggregated to find the mean of all 66 variables present in the table for each Subject, per Activity

****************
Done by : Ambika Sivakumar
        






