library(reshape2)

# Main entry point for this analysis.
#
# Creates a Tidy Dataset for the "UCI HAR Dataset" from:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# The Tidy Dataset will be saved on your workdirectory with
# the name "tidyData.txt". Load the data with:
# read.table("tidyData.txt", header=TRUE)
#
# Function parameters:
#   pathToDataset: A directory path pointing to the contents inside the
#                  "UCI HAR Dataset" folder. By default, when this script
#                  is sourced, the pathToDataset is created with:
#                  "file.path(".", "UCI HAR Dataset")", so, it tries to
#                  the directory in your working directory.
#
# Note: this function is called when sourcing this file.
# Note2: All others functions in this file are used by this function, no need to call
# separately.
runAnalysis <- function(pathToDataset) {
  # Load the "features.txt" file containing the names of all the features
  featuresTable <- loadFeatureNames(pathToDataset)
  # Create a filter to select only features names with "mean()" and "std()"
  featuresFilter <- createFeaturesFilter(featuresTable)
  # Filter out the features
  featuresTable <- featuresTable[featuresFilter,]
  # Load the test dataset (inside the "test" subdirectory)
  testTable <- loadData(featuresTable, pathToDataset, "test")
  # Load the train dataset (inside the "train" subdirectory)
  trainTable <- loadData(featuresTable, pathToDataset, "train")
  
  # Combine the test and train datasets into a single table
  dataTable <- rbind(testTable, trainTable)
  #dataTable <- testTable
  
  print(paste(rep("*",32), collapse=""))
  print("Size of the merged Data Table:")
  print(dim(dataTable))
  print(paste(rep("*",32), collapse=""))
  
  # Creating the tidy data table for the last part of the
  # assignment
  tidyTable <- tidyDataTable(dataTable)
  
  
  print(paste(rep("*",32), collapse=""))
  print("Writing tidyData.txt in:")
  print(getwd())
  
  # For step 5 of the assignment:
  # "data set as a txt file created with write.table() using row.name=FALSE"
  write.table(tidyTable, "tidyData.txt", row.names=FALSE)
  
  if (file.exists(file.path(getwd(), "tidyData.txt")))
    print("File Saved Successfully.")
  print(paste(rep("*",32), collapse=""))
}

# Load the "features.txt" file from the data set
loadFeatureNames <- function(pathToDataset) {
  print(paste(rep("*",32), collapse=""))
  print("Loading Features")
  featuresFilePath <- file.path(pathToDataset, "features.txt")
  featuresTable <- read.table(featuresFilePath, colClasses=c("integer","character"))
  print(str(data))
  print(paste(rep("*",32), collapse=""))
  
  featuresTable
}

# Creates a filter to select only features with "mean()" and "std()" in their names
createFeaturesFilter <- function(featuresTable) {
  # I'm only getting features with "mean()" and "std()" in the name, with brackets, as
  # discussed in David Hood TA FAQ: https://class.coursera.org/getdata-013/forum/thread?thread_id=30
  grepl("mean\\(\\)", featuresTable$V2) |
      grepl("std\\(\\)", featuresTable$V2)
}

# Load the "<dataType>/[subject_|X_|y_]<dataType>.txt" files, then filter
# the features using the "featuresTable" and then combine the contents of
# all the files into a single table.
#
# Each row contains a test case and the columns are layout as:
# 1:   subject         # stores the subjects id as an integer
# 2-n: named features  # stores the features for this particular test.
#                      #   Note that these are the same features passed
#                      #   with the "featuresTable" parameter. 
# n+1: y               # the classification result (activity) as a
#                      #   character string. See list below.
#
# The list of the six activies are as follow:
# "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS,
# "SITTING", "STANDING" and "LAYING"

loadData <- function(featuresTable, pathToDataset, dataType) {
  print(paste(rep("*",32), collapse=""))
  print(paste("Loading Data", dataType))
  
  
  subjectFilePath <- file.path(pathToDataset, dataType, paste("subject_", dataType, ".txt", sep=""))
  subjectTable <- read.table(subjectFilePath, colClasses=c("integer"))
  
  xFilePath <- file.path(pathToDataset, dataType, paste("X_", dataType, ".txt", sep=""))
  xTable <- read.table(xFilePath)
  xTable <- xTable[,featuresTable$V1]
  names(xTable) = featuresTable$V2
  
  activities = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
  yFilePath <- file.path(pathToDataset, dataType, paste("y_", dataType, ".txt", sep=""))
  yTable <- read.table(yFilePath, colClasses=c("integer"))
  
  for (i in 1:length(activities)) {
    yTable[yTable$V1 == i,] <- activities[i]
  }

  print("subject")
  print(str(subjectTable))
  print(paste(rep("-",16), collapse=""))
  print("x")
  print(str(xTable), list.len=3)
  print(paste(rep("-",16), collapse=""))
  print("y")
  print(str(yTable))
  
  dataTable = cbind(
    subject=subjectTable$V1,
    xTable,
    y=yTable$V1
    )
  
  print(str(dataTable))
  
  print(paste(rep("*",32), collapse=""))
  
  dataTable
}

tidyDataTable <- function(dataTable) {
  # This creates a skinny data set as in:
  # https://class.coursera.org/getdata-013/lecture/37
  dataMelt <- melt(dataTable, id=c("subject", "y"))
  print(paste(rep("*",32), collapse=""))
  print(str(dataMelt))
  print(paste(rep("*",32), collapse=""))
  
  # For this dataset I choose to make it 66 columns (number of features)
  # long, with each "subject/y" pair in a single row. This is called
  # a wide data format.
  #
  # Also, this function also computes the mean for each feature for
  # each "subject/y" pair.
  dataCast <- dcast(dataMelt, subject + y ~ variable, mean)
  print(paste(rep("*",32), collapse=""))
  print(str(dataCast))
  print(paste(rep("*",32), collapse=""))
  
  dataCast
}

runAnalysis(file.path(".", "UCI HAR Dataset"))
