library(dplyr)
library(readr)

# Loading the data
# the data file must be contained in a directory named 'data' under the current working directory
df <- read_delim("./data/household_power_consumption.txt",
                 col_types = "ccddddddn",na = c("?",""))

## select subset of data in 2007-02-01 and 2007-02-02
df <- filter(df, Date=="1/2/2007"|Date=="2/2/2007")

# create new datetime variable using Date and Time columns
df$datetime <- strptime(paste(df$Date, df$Time),
                        format = "%d/%m/%Y %H:%M:%S")


png(filename = "plot3.png", width = 480, height = 480)
plot(x=df$datetime,y=df$Sub_metering_1,type='l',
     ylab = "Energy sub metering",
     xlab = "")
lines(x = df$datetime,y=df$Sub_metering_2, col="red")
lines(x = df$datetime,y=df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=1)


dev.off()
