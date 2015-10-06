# this is an R script for Coursera course "Exploratory Data Analysis"
# it produces plot2.png required by Course Project 1

# load necessary package
library(lubridate) # for dates
library(dplyr)

# read in source data
df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
df$Date <- dmy(df$Date) # convert into date and time
df$Time <- hms(df$Time)
# subset the required rows
subdf <- df[df$Date==ymd("2007-02-01") | df$Date==ymd("2007-02-02"),]
subdf <- mutate(subdf, datetime = Date + Time ) # datetime object
for (i in 3:9){
  subdf[,i] <-as.numeric(as.character(subdf[,i])) # convert into float for plotting
}

png("plot2.png",width=480,height=480,units="px",bg = "transparent")
plot(subdf$datetime,subdf$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
