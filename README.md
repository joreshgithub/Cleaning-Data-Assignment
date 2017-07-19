Readme for cleaning data on wearables

Details of scripts.

The steps for creating the tidy data set is as follows

1. Convert the following txt files into data frames in R
- activity_labels.txt
- features.txt
- subject_test.txt
- X_test.txt
- Y_test.txt
- subject_train.txt
- X_train.txt
- Y_train.txt

2. Merge the last 6 dataframes into one dataframe by combining columns.

3. Name the last column "Activity_labels" and the first column "Subject"

4. Name the other columns from the file features.txt

5. Replace the number values in the Activity_labels with the activity names in file activity_labels.txt

6. Subset the data frame and select only columns containing the strings 'mean' and 'std' in them.

7. Group the data set by Subject, Activity_Labels and calculate mean for all columns.

8. Save the resulting data frame in a text file.

Variables
Subject - the number of the volunteer
Activity_Labels - the names of the activities
The other variables are combinations of the following abbreviations
XYZ - 3 axis signals
Body - Body
Gravity - Gravity
Acc - Acceleration
Gyro - Gyroscope
Acc - acceleration

The measures are
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
