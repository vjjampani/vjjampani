# Assignment: ASSIGNMENT 4.2
# Name: Jampani, Venkat Jagadeesh
# Date: 2022-01-09


# TEST SCORES EXERICSE

library(ggplot2)
library(patchwork)

setwd("/Users/Jagadeesh/Documents/GitHub/dsc520")
# Create testscores variable with scores data
testScores <- read.csv("data/scores.csv", header=TRUE, sep = ",")
testScoresdf <- data.frame(testScores)
testScores

# Views the dataframe formed from the csv file
View(testScoresdf)

# Summary of the data
summary(testScoresdf)


# Question 1: What are the observational units in this study ?
# The observational units in statistics are the objects on which variables are defined and measurements are recorded.
# There are a total of 38 observational units in this study (Observation length from Summary(testScores) output).

# Question 2: Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
# There are 3 variables in total out of which 1 of them is a categorical variable and other 2 are quantitative/numerical variables.
# count -> numerical variable
# score -> numerical variable
# section -> categorical (sports or regular)

# Variable to hold subset of data for Regular Section 
regularData <- subset(testScoresdf, testScoresdf$Section == "Regular")
regularData

# Variable to hold subset of data for Sports Section
sportsData <- subset(testScoresdf, testScoresdf$Section == "Sports")
sportsData


# Plot function to plot each Sections scores and the number of students achieving that score.
plot.scores.regular <- ggplot(regularData, aes(x = Score, y = Count)) + geom_point() + geom_smooth(method = "lm", colour = "Blue") + labs(x = "Scores for regular section", y = "No.of students")
plot.scores.regular

plot.scores.sports <- ggplot(sportsData, aes(x = Score, y = Count)) + geom_point() + geom_smooth(method = "lm", colour = "Blue") + labs(x = "Scores for sports section", y = "No.of students")
plot.scores.sports


# Calculate central tendency measures
regularMeanScore <- mean(regularData$Score)
sportsMeanScore <- mean(sportsData$Score)
regularMedianScore <- median(regularData$Score)
sportsMedianScore <- median(sportsData$Score)


# Function to calculate mode
find_mode <- function(x) {
  u <- unique(x)
  tab <- tabulate(match(x, u))
  u[tab == max(tab)]
}

regularModeScore <- find_mode(regularData$Score)
sportsModeScore <- find_mode(sportsData$Score)


sprintf("Mean Score of Regular section: %s", regularMeanScore)
sprintf("Mean Score of Sports section: %s", sportsMeanScore)
sprintf("Median Score of Regular section: %s",  regularMedianScore)
sprintf("Median Score of Sports section: %s", sportsMedianScore)
sprintf("Mode Score(s) of Regular section: %s",  regularModeScore)
sprintf("Mode Score(s) of Sports section: %s", sportsModeScore)

# Question 4:
# Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: 
# a . Can you say that one section tended to score more points than the other? Justify and explain your answer.
# Answer:
# The students enrolled into Regular section tended to score more points than the sports section. This can be inferred from the respective scatter plots.
# There are more no. of students who scored more than 300 from Regular section compared to Sports. Also, the additional line plotted using geom_smooth() shows
# that the mean from regular section is about 327 compared to 307 from sports section.

# b. Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
# Answer:
# No. Based on the data and the plots, we cannot say that every student in one section score more than every student in the other section. They don't explain 
# the complete statistical tendency in this context. However, calculating central tendency tells us how the group of data is clustered around the center value of
# distribution. Looking at the mean , median and mode values of both Regular and Sports sections, we can incline towards the conclusion that Regular section students scored better
# than sports section students.

# c. What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
# Answer:
# If the data/context includes another variable like grades, that would help in influencing the point distributions between the two sections.
# Another variable that could explain the difference in distributions is average time spent per student per section. 
# Ideally, the more time spent on a course, the better the student does. This could be useful in explaining the disparity between the sections.



# HOUSING DATA EXERCISE

library(ggplot2)
library(readxl)
library(plyr)



# Read housing dataset
housingData <- read_excel("data/week-6-housing.xlsx")
housingData

# use apply function on saleprice 
apply(housingdata[c('Sale Price')], 2, mean)


# Use the aggregate function on a variable in your dataset. Change column name to remove space.
# In this case, aggregate is used to calculate mean sale price per zip code
colnames(housingData)[colnames(housingData) == "Sale Price"] <- "Sale_Price"
aggregate(Sale_Price ~ zip5, housingData, mean)

# Use the plyr function on a variable in your dataset
# Calculate new variable -> PricePerSqFt by dividing sale price by square_feet_total_living and bring it back to original DF.
housingData$PricePerSqFt <- with(housingData, housingData$Sale_Price/housingData$square_feet_total_living)
housingData$PricePerSqFt
housingData

options(scipen = 10)
# Check distributions of the data
ggplot(housingData, aes(Sale_Price)) + geom_histogram(bins = 1000)
# Above distribution based on sale price is left/positively skewed.

# Identify if there are any outliers
# As we can see from the above data distribution, there are some outliers, but nothing out of the box. 
# A ~4-5 million dollar home, which are rare, is quite possible and should not be discounted. 

# Create 2 new variables
# Already created one above - PricePerSqFt. Below is another one for PropertyTax appying 2% on sale price.
housingData$PropertyTax <- with(housingData, Sale_Price*0.02)
housingData$PropertyTax
housingData
