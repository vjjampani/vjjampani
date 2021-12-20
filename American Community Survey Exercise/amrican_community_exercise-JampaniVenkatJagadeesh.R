# Assignment: ASSIGNMENT 3
# Name: JAMPANI, VENKAT JAGADEESH
# Date: 2010-02-14

## Load the ggplot2 package
library(ggplot2)
library(qqplotr)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Jagadeesh/Documents/GitHub/dsc520")
## Load the `data/acs-14-1yr-s0201.csv` to
usacom_df <- read.csv("data/acs-14-1yr-s0201.csv")
#i. Printing data from acs-14-1yr-s0201.csv
usacom_df
#i. printing the summary of usacom_df
summary(usacom_df)
#ii. str function of usacom_df
str(usacom_df)

#ii. nrow function of usacom_df
nrow(usacom_df)

#ii. ncol function of usacom_df
ncol(usacom_df)

#iii. HISTOGRAM for "HSDegree"
#1. Set a bin size for the Histogram.
ggplot(usacom_df, aes(HSDegree)) + geom_histogram(bins=20)

#2Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(usacom_df, aes(HSDegree)) + geom_histogram(bins=20) + ggtitle("Title : HSDegree vs Count") + labs(x="HSDegree" , y = "Count")


#Answer the following questions based on the Histogram produced:
print("1 Question : Based on what you see in this histogram, is the data distribution unimodal?")
print("Answer : YES")

print("2 Question : Is it approximately symmetrical?")
print("Answer : YES")

print("3 Question : Is it approximately bell-shaped?")
print("Answer : YES")

print("4 Question : Is it approximately normal?")
print("Answer : NO")

print("5 Question : If not normal, is the distribution skewed? If so, in which direction?")
print("Answer : Yes, Left skewed")

print("6 Question : Include a normal curve to the Histogram that you plotted.")
print("Answer : Ok")
#test = ggplot(usacom_df, aes(HSDegree)) + geom_histogram(bins=30) + ggtitle("Title : HSDegree vs Count") 

ggplot(usacom_df, aes(HSDegree)) + geom_histogram(binwidth = 1.1, bins = 20) + ggtitle("HSDegree vs Count") + labs(x = "High School Degree (%)", y = "Count") + geom_density(aes(y=1.1*..count..))

print("7. Question : Explain whether a normal distribution can accurately be used as a model for this data.")
print("Answer : NO")
print("Not exactly symmetrical, not exactly bell shaped, and mean,median, mode are not same")

#V, Create a Probability Plot of the HSDegree variable.



qplot(sample = HSDegree, data = usacom_df, xlab="HSDegree %",ylab = "Count")

print("Vi :Answer the following questions based on the Probability Plot:")
print("1. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.")
print("Answer : ")
print("No Distribution is not normal. The plot is not symmetrical, not distribution of highest degrees is not normal and mean median and mode are not same.")
print("2.If not normal, is the distribution skewed? If so, in which direction? Explain how you know.")
print("Answer : ")
print("Yes, not normal, the distrinution is skewed. its left skewed. Data that have an upper bound are often skewed left.")

print("Vii : Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.")
#stat.desc(usacom_df)
print("Answer: In the attached document")


print("Viii :In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?")
print("Answer: In the submitted document")
  
