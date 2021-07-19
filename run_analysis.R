library(tidyverse)
rm(list = ls())

# reading the files needed for the project
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
measured_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
measured_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# renaming the column names with the features, 
# selecting the features needed for this project
# and adding a set identifier column prior to combining the two sets
measured_test %<>% 
    `colnames<-`(features[, 2]) %>%
    select(matches("mean\\(\\)|std\\(\\)",)) %>%
    mutate(set = "test", .before = 1)
measured_train %<>% 
    `colnames<-`(features[, 2]) %>%
    select(matches("mean\\(\\)|std\\(\\)",)) %>%
    mutate(set = "train", .before = 1)

# combining the two sets
activity <- rbind(activity_train, activity_test)
subject <- rbind(subject_train, subject_test)
measured <- rbind(measured_train, measured_test)

# a general function to convert camelCase to snake_case
camel_to_snake <- function (x) {
    x %<>% 
        gsub("(.)([A-Z][a-z]+)", "\\1_\\2", .) %>%
        gsub("([a-z0-9])([A-Z])", "\\1_\\2", .) %>%
        tolower()
}

# modifying variable names :
# to more descriptive ones
# removing "-" and "()" characters
# removing token repetition typos
# removing caps by converting from camelCase to snake_case
colnames(measured) %<>%
    gsub("^t", "time", .) %>%
    gsub("^f", "frequency", .) %>%
    gsub("-", "_", .) %>%
    gsub("\\(\\)", "", .) %>%
    gsub("([A-Z][a-z]+)\\1+","\\1", .) %>%
    camel_to_snake()

# adding activity and subject_id columns
# converting activity values to lower caps
measured %<>%
    mutate(activity = activity_labels[activity[,1],2], .before = 1) %>%
    mutate(subject_id = subject[,1], .before = 1) %>%
    mutate(activity = tolower(activity))

# calculating averages for the different features by activities and subjects
averages <- 
    group_by(measured, activity, subject_id) %>%
    summarise(set = first(set), across(matches("time|frequency"), mean)) %>%
    relocate(names(measured))

write.table(averages, file = "features_averages.txt",row.names = FALSE)   








