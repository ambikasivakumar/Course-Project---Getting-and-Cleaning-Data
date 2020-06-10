## Comprehensive Overview of the Repository, Dataset and Script used 

### Files
This repository contains the following files

|     File                   |    Link     |
|:--------------------------:|:-----------:|
| README.md                  | [README.md](README.md)
| CodeBook.md                | [CodeBook.md](CodeBook.md) 
| Tidy Dataset               | [Tidy Data](tidydata.txt)
| R Script - Data Processing | [Script](run_analysis.R)

### Aim and Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The steps involved in achieveing this goal include

1. Creating a tidy data set 
2. Writing a script for performing the analysis
3. Explaining the steps undertaken to perform the said analysis as a code book that describes the variables, the data, and any transformations or work that were performed to clean up the data
4. Explaining the structure of the file structure of the repository, naming the scripts used and establishing the links between these scripts, if any

### Problem Statement
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data links represent the data collected from the accelerometers in the Samsung Galaxy S smartphone.

|     Data                   |    Link           |
|:--------------------------:|:-----------------:|
| Original Dataset (UCI HAR) |  [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)       
| Dataset - Project          |  [Project Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Dataset Description

##### Dataset Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain

##### Attribute Information

Each record in the dataset is provided with 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
- Triaxial Angular velocity from the gyroscope
- A 561-feature vector with time and frequency domain variables
- Its activity label
- An identifier of the subject who carried out the experiment

### Scripts

The analysis was performed using ```run_script.R```. The script performs the following operations

1. Downloads the dataset from source and unzips its contents. The data for the project is now stored in the **UCI HAR Dataset** directory, within the scope of the user's current working directory. 

2. All packages needed for processing are loaded using ```require```

3. The path to the **UCI HAR Dataset** directory is stored in a variable called ```dataset.directory``` to access the files easily. The files of interest are stored in the **train** and **test** subdirectories of the **UCI HAR Dataset** parent directory. The list of files that are used for analysis are tabulated below (along with the directories in which they're found)

|     Relative Path (from user's current working directory) |               Files                              |
|:---------------------------------------------------------:|:------------------------------------------------:|
| ./UCI HAR Dataset                                         | activity_labels.txt, features.txt                |
| ./UCI HAR Dataset/train                                   | subject_train.txt, X_train.txt, y_train.txt      |
| ./UCI HAR Dataset/test                                    | subject_test.txt, X_test.txt, y_test.txt         |

3. The above files are loaded into the following variables. The description contains the dimensions of the data sepcified as ```(number of rows, number of columns)```

|     Variable Name                   |  File Name          |                       Description                                             |
|:-----------------------------------:|:-------------------:|:------------------------------------------------------------------------------|
| features                            | features.txt        | 561 measurement labels (forms the column names of the table) - (561, 2)       |
| activity                            | activity_labels.txt | 6 activity labels  - (6,2)                                                    |
| Xtrain                              | X_train.txt         | Measurements recorded for each of the 561 features - (7352, 561)              |
| Ytrain                              | y_train.txt         | Activity output for each training instance (row) in ```X_train``` - (7352, 1) |
| subject.train                       | subject_train.txt   | Subject IDs of the participants - (7352, 1)                                   |
| Xtest                               | X_test.txt          | Measurements recorded for each of the 561 features - (2947, 561)              |
| Ytest                               | y_test.txt          | Activity output for each training instance (row) in ```X_train``` - (2947, 1) |
| subject.test                        | subject_test.txt    | Subject IDs of the participants - (2947, 1)                                   |

4. ```X_train``` and ```X_test``` are merged to form a new variable ```X```. Similarly, ```y_train``` and ```y_test``` are merged to form ```Y``` while ```subject.train``` and ```subject.test``` are merged to formed ```subjects```

5. ```subjects```,```Y``` and ```X``` are merged to form a table named ```data```

6. The columns containing the measurements for ```mean()``` and ```std()``` along with the Subject and Activity information are stored in a new table called ```required.data```. The new table contains 68 columns (Subject, Activity and 66 other feature variables)

7. The activity numbers are descriptively renamed using the labels present in the ```activity``` table

8. The column names are renamed according to the transformation process elucidated in Step 4 of the **Transformations** section in [CodeBook.md](CodeBook.md) 

9. The data from Step 8 is grouped according to the Subject and Activity using ```group_by``` and aggregated using ```summarise_all``` to find the mean of all 66 variables present in the table for each Subject, per Activity

10. The resulting data from Step 9 is written out to ```tinydata.txt```

********************
Done by : Ambika Sivakumar








