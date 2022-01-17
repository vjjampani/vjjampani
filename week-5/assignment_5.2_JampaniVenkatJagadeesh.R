# Assignment: ASSIGNMENT 5.2
# Name: Jampani, Venkat Jagadeesh
# Date: 2022-01-15


library(readxl)
library(dplyr)
library(purrr)
library(stringr)


# Set workding directory to read source datasets.
setwd("/Users/Jagadeesh/Documents/GitHub/dsc520")

# Read housing dataset
housingData <- read_excel("data/week-6-housing.xlsx")
housingData

# groupby (dplyr package) operation on housing dataset
grpby_housZip <- housingData %>% group_by(zip5)
grpby_housZip

# select operation on housing dataset
housingData %>% select('Sale Price', bedrooms)

# summarize operation on housing dataset
housingData %>% summarize(MeanBedroomSize = mean(bedrooms))
housingData %>% summarize(Meanbathfullcount = mean(bath_full_count))


# mutate operation on housing dataset
housingData %>% select(bedrooms, bath_full_count) %>% mutate(totrooms = bedrooms + bath_full_count)

# filter operation on housing dataset
housingData %>% select('Sale Price', bedrooms, bath_full_count) %>% filter(bedrooms == 4)
housingData %>% select('Sale Price', bedrooms, bath_half_count) %>% filter(bedrooms == 4)

# arrange operation on housing dataset
housingData %>% select('Sale Price', bath_full_count, bedrooms) %>% group_by(bedrooms) %>% arrange(desc(bedrooms))

# purrr functions
# keep function
keep(housingData$year_built, function(x) x > 2010)
keep(housingData$bedrooms, function(x) x >= 5)
# discard function
discard(housingData$bedrooms, function(x) x < 5)
discard(housingData$year_built, function(x) x < 1900)

# cbind and rbind functions on housing data set
# cbind
myvar1 <- c('Sale Price','year_renovated')
myvar1
myvar2 <- c('bedrooms')
myvar2
subset_housingData1 <- housingData[myvar1]
subset_housingData1
subset_housingData2 <- housingData[myvar2]
subset_housingData2 
cbind_housingData <- cbind(subset_housingData1, subset_housingData2)
head(cbind_housingData)

# rbind
subset_housingData3 <- housingData[1:4, ]
subset_housingData3
subset_housingData4 <- housingData[5:8, ]
subset_housingData4

rbind_housingData <- rbind(subset_housingData3, subset_housingData4)
head(rbind_housingData)

# string split and assign labels
addr_list <- str_split(housingData$addr_full, " ")
head(addr_list)
# create address dataframe
addr_df <- data.frame(Reduce(rbind, addr_list))
head(addr_df)
# assign labels/column names
names(addr_df) <- c("Addr1", "Addr2", "Addr2", "Addr4")
head(addr_df)

# concatenate results back together to the main dataset or dataframe.
housingData <- cbind(housingData, addr_df)
head(housingData)
