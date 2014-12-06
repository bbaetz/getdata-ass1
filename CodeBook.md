# Human Activity Recognition Using Smartphones Dataset

## Data source

The source data comes from the `Human Activity Recognition Using Smartphones Dataset`, version 1.0[1].

Both the test and training datasets are combined, transformed to only include the mean and standard deviation, and filtered to only include mean and standard deviation data.

## Transformation

The provided script transforms the data by following several steps:

1. The activity and features metadata is read
2. As only the mean and standard deviation features are required, the other featres are removed from the features list.
3. The test features are read from the data file (`X_test.txt`), and then filtered to only include the wanted features
4. The data file that identifies the subject ID for each data row (`subject_test.txt`) is loaded
5. The data file that identifies the activity ID for each data row (`t_test.txt`) is loaded
6. These activity IDs are merges with the activity metadata, to provide descriptive names for the activities
7. The datasets (features, subjectId, and activity) are combined into one data table (`data).
8. The above steps are repeated for the training data, to provide the consolidated data
9. In order to provide grouped data, the `aggregate` function is used to combine data based on the subject and activity fields, averaging the results with the `mean` function.
10. This final dataset is then written out to a text file (`meanData.txt`).

## Data

### Original

The original source data's features is described in the original provided dataset as coming "from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`. These time domain signals (prefix `t` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag`. (Note the `f` to indicate frequency domain signals)."

### Transformed data

Each feature is available in the following variables, based on the original fields (lowercased).

`-XYZ` is used to denote 3-axial signals in the X, Y and Z directions, and `AGGR` represents the aggreagation being used (`std` for standard deviation, and `mean` for the mean)

* `tbodyacc-AGGR-XYZ`
* `tgravityacc-AGGR-XYZ`
* `tbodyaccjerk-AGGR-XYZ`
* `tbodygyro-AGGR-XYZ`
* `tbodygyrojerk-AGGR-XYZ`
* `tbodyaccmag-AGGR`
* `tgravityaccmag-AGGR`
* `tbodyaccjerkmag-AGGR`
* `tbodygyromag-AGGR`
* `tbodygyrojerkmag-AGGR`
* `fbodyacc-AGGR-XYZ`
* `fbodyaccjerk-AGGR-XYZ`
* `fbodygyro-AGGR-XYZ`
* `fbodyaccmag-AGGR`
* `fbodyaccjerkmag-AGGR`
* `fbodygyromag-AGGR`
* `fbodygyrojerkmag-AGGR`

In addition, there are two additional columns:

* `subject` - An identifier of the subject for each sample, ranging from 1 to 30.
* `activity` - The activity that is being performed during the sample. One of:
  * `WALKING`
  * `WALKING_UPSTAIRS`
  * `WALKING_DOWNSTAIRS`
  * `SITTING`
  * `STANDING`
  * `LAYING`

### Summarised data

The `meanData.txt` file includes the above fields, but grouped by subject and activity, and averaged.

## License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
