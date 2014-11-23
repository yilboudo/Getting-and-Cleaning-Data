Getting and Cleaning Data Course Project CodeBook.

The scope of this file is to explain the variables, the data, and any modifications applied to getting and cleaning the data.

Getting the data:
    The data was obtained from the site below:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    It was downloaded from this one:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
Cleaning the data:
    The script goes through the following steps:
        -Moving into the train folder, the following text files were read X_train.txt and y_train.txt and subject_train.txt from the train folder and store them as subjectTrain, data_Xtrain, data_ytrain.
        -Moving into the test folder, the following text files were read X_test.txt, y_test.txt and subject_test.txt from the test folder and store as data_Xtest, data_ytest, subjectTest. 
        -Make the column name for data_Xtrain and data_Xtest be identical and then merge data_Xtrain, and  data_Xtest to form dataMerged a dataframe of 10299 rows and 561 columns.Make the column names for data_ytrain and data_ytest be identical and then merge data_ytrain and data_ytest to form a data frame labelMerge of 10299 rows and 1 column. Make the column name for subjectTrain and subjectTest be identical and then merge subjectTrain and subjectTest to form a data frame subjectMerge of 10299 rows and 1 column.
        Move into the UCI_HAR_Dataset folder, read features.txt file store the data as features. Our intent is to extract the measurements of mean and standard deviation. From there subset the corresponding columns from dataMerged. 
        In order to make the column names of the subset more readable, we remove the "()" and "-" symbols in the names, and make the first letter of "mean" and "std" capital letters.
        Read the activity_labels.txt file from the same folder as features folder and store the data as activity.
        In order to make make the activity names more readable we clean the second column of the activity data set. First, we make all names lower cases. If the name has an underscore between letters, and we remove the underscore. We match the values of labelMerge according to the activity data frame.
        Merge the subjectMerge, labelMerge and dataMerged by column to get a fresh data frame of 10299 rows and 68 columns called fresh_data. Label the first two columns of this data frame
        Write the cleanedData out to "merged_data.txt" file in current working directory.
        