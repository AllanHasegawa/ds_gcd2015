# This file was only used to extract the names of the features
# for the Cookbook.
#
# In no way its used in the run_analysis.R and can be ignored.

featureNamesExtraction <- function(pathToDataset) {
  featuresTable <- loadFeatureNames(pathToDataset)
  # Create a filter to select only features names with "mean()" and "std()"
  featuresFilter <- createFeaturesFilter(featuresTable)
  # Filter out the features
  featuresTable <- featuresTable[featuresFilter,]
  
  featuresNamesFilePath <- file.path(".", "featuresNames.txt")
  write("", file = featuresNamesFilePath,
        append = FALSE)
  for (i in 1:nrow(featuresTable)) {
    line <- paste(i+2, ". ", featuresTable[i,"V2"], " (numerical)", sep="")
    write(line, file = featuresNamesFilePath,
          append = TRUE)
    
  }
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

featureNamesExtraction(file.path(".", "UCI HAR Dataset"))