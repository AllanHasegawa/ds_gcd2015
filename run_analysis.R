runAnalysis <- function(pathToDataset) {
  featuresTable <- loadFeatureNames(pathToDataset)
  featuresFilter <- createFeaturesFilter(featuresTable)
  featuresTable <- featuresTable[featuresFilter,]
  testTable <- loadData(featuresTable, pathToDataset, "test")
  trainTable <- loadData(featuresTable, pathToDataset, "train")
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

runAnalysis(file.path(".", "UCI HAR Dataset"))
