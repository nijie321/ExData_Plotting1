
# JHU Exploratory Data Analysis Coursera course
# Week 1 Project 1
# Author: Jie Ni
# Date: Feb 05, 2022
# Dataset: Individual household electric power consumption Data Set
# from UCI Machine Learning Repository
library(readr)
library(dplyr)
library(lubridate)

# change directory if necessary
# setwd("~/Documents/exploratory_analysis_w1p1/")

# Loading the data
# the data file must be contained in a directory named 'data' under the current working directory
df <- read_delim("./data/household_power_consumption.txt",
                 col_types = "ccddddddn",na = c("?",""))


df$Date[10]
strptime(df$Time[1], format = "%H:%M:%S")
df %>% mutate(Date = as.Date)
sapply(df$Date, as.Date, "%d/%M/%Y")

head(df, 3)
nrow(df); ncol(df)
str(df)
## background info. about the data:
  ## 2,075,259 rows and 9 columns

## calculate how much memory is needed
  ## estimate: 2,075,259 x 9 x 8 bytes = 149,418,648 bytes
  ## or 149,418,648/2^20 bytes/MB = 142.4967 MB

## select subset of data in 2007-02-01 and 2007-02-02
df <- filter(df, Date=="1/2/2007"|Date=="2/2/2007")


## converting the Date and Time variables to Date/Time classes

# create new datetime variable using Date and Time columns
df$datetime <- strptime(paste(df$Date, df$Time),
                 format = "%d/%m/%Y %H:%M:%S")




## 

# Making Plots

## Plot 1
with(df, hist(Global_active_power, col="red",xlab = "Global Active Power (kilowatts)"))


## Plot 2
with(df, plot(x=datetime,y=Global_active_power,type="l",
              ylab="Global Active Power (kilowatts)",
              xlab=""))


## Plot 3
plot(x=df$datetime,y=df$Sub_metering_1,type='l',
     ylab = "Energy sub metering",
     xlab = "")
lines(x = df$datetime,y=df$Sub_metering_2, col="red")
lines(x = df$datetime,y=df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=1)


## Plot 4
par(mfrow=c(2,2))
with(df, plot(x=datetime,y=Global_active_power,type="l",
              ylab="Global Active Power (kilowatts)",
              xlab=""))

with(df, plot(Voltage,type="l",xlab="datetime"))

with(df,
     plot(x=datetime,y=Sub_metering_1,type='l',
          ylab = "Energy sub metering",
          xlab = "")
     )
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lwd=1,cex=0.8)
lines(x = df$datetime,y=df$Sub_metering_2, col="red")
lines(x = df$datetime,y=df$Sub_metering_3, col="blue")


with(df, plot(Global_reactive_power,type="l", xlab="datetime"))

