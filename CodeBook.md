# `tidyData.txt` CodeBook

## Description

`tidyData.txt` is a tidy dataset based on the original work of ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This dataset was generated entirely in R with the accompanying `run_analysis.R` script.

From the original dataset:

```
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
```

This dataset contain 66 features of the original dataset for each subject (volunteers) and activity pair. Its using a wide layout for the dataset, where each pair of subject id and activity contains 66 columns of features.

The original dataset contained multiple feature values for each subject/activity unique pair. This dataset computes the mean for the features associated with the same unique subject/activity pair.


A list of each column is seem below.

## Layout

1. subject (int)
    * A value of discrete numbers from 1 to 30 representing the subject id.
2. y (factor)
    * A descriptive activity name with the possible values:
        1. WALKING
        2. WALKING_UPSTAIRS
        3. WALKING_DOWNSTAIRS
        4. SITTING
        5. STANDING
        6. LAYING
3. tBodyAcc-mean()-X (numerical)
4. tBodyAcc-mean()-Y (numerical)
5. tBodyAcc-mean()-Z (numerical)
6. tBodyAcc-std()-X (numerical)
7. tBodyAcc-std()-Y (numerical)
8. tBodyAcc-std()-Z (numerical)
9. tGravityAcc-mean()-X (numerical)
10. tGravityAcc-mean()-Y (numerical)
11. tGravityAcc-mean()-Z (numerical)
12. tGravityAcc-std()-X (numerical)
13. tGravityAcc-std()-Y (numerical)
14. tGravityAcc-std()-Z (numerical)
15. tBodyAccJerk-mean()-X (numerical)
16. tBodyAccJerk-mean()-Y (numerical)
17. tBodyAccJerk-mean()-Z (numerical)
18. tBodyAccJerk-std()-X (numerical)
19. tBodyAccJerk-std()-Y (numerical)
20. tBodyAccJerk-std()-Z (numerical)
21. tBodyGyro-mean()-X (numerical)
22. tBodyGyro-mean()-Y (numerical)
23. tBodyGyro-mean()-Z (numerical)
24. tBodyGyro-std()-X (numerical)
25. tBodyGyro-std()-Y (numerical)
26. tBodyGyro-std()-Z (numerical)
27. tBodyGyroJerk-mean()-X (numerical)
28. tBodyGyroJerk-mean()-Y (numerical)
29. tBodyGyroJerk-mean()-Z (numerical)
30. tBodyGyroJerk-std()-X (numerical)
31. tBodyGyroJerk-std()-Y (numerical)
32. tBodyGyroJerk-std()-Z (numerical)
33. tBodyAccMag-mean() (numerical)
34. tBodyAccMag-std() (numerical)
35. tGravityAccMag-mean() (numerical)
36. tGravityAccMag-std() (numerical)
37. tBodyAccJerkMag-mean() (numerical)
38. tBodyAccJerkMag-std() (numerical)
39. tBodyGyroMag-mean() (numerical)
40. tBodyGyroMag-std() (numerical)
41. tBodyGyroJerkMag-mean() (numerical)
42. tBodyGyroJerkMag-std() (numerical)
43. fBodyAcc-mean()-X (numerical)
44. fBodyAcc-mean()-Y (numerical)
45. fBodyAcc-mean()-Z (numerical)
46. fBodyAcc-std()-X (numerical)
47. fBodyAcc-std()-Y (numerical)
48. fBodyAcc-std()-Z (numerical)
49. fBodyAccJerk-mean()-X (numerical)
50. fBodyAccJerk-mean()-Y (numerical)
51. fBodyAccJerk-mean()-Z (numerical)
52. fBodyAccJerk-std()-X (numerical)
53. fBodyAccJerk-std()-Y (numerical)
54. fBodyAccJerk-std()-Z (numerical)
55. fBodyGyro-mean()-X (numerical)
56. fBodyGyro-mean()-Y (numerical)
57. fBodyGyro-mean()-Z (numerical)
58. fBodyGyro-std()-X (numerical)
59. fBodyGyro-std()-Y (numerical)
60. fBodyGyro-std()-Z (numerical)
61. fBodyAccMag-mean() (numerical)
62. fBodyAccMag-std() (numerical)
63. fBodyBodyAccJerkMag-mean() (numerical)
64. fBodyBodyAccJerkMag-std() (numerical)
65. fBodyBodyGyroMag-mean() (numerical)
66. fBodyBodyGyroMag-std() (numerical)
67. fBodyBodyGyroJerkMag-mean() (numerical)
68. fBodyBodyGyroJerkMag-std() (numerical)
