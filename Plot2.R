### This script creates a dataset that can be used to create PLOT 2 for the first project ###
### February 2017 ###

#### STEP 1: DOWNLOAD DATA  ####

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="exdata_data_household_power_consumption.zip", method="curl")
unzip("exdata_data_household_power_consumption.zip",overwrite=TRUE)
dateDownloaded <- date()
dateDownloaded

#### STEP 2: SUBSET AND FORMAT DATA ###

data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?",stringsAsFactors=FALSE)
data <- subset(data, (data$Date=="1/2/2007"| data$Date=="2/2/2007"),)
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
tidydata <- data

### STEP 3: CREATE GRAPH 2 ###

par(mfrow= c(1,1))
png(filename="Plot2.png",width=480, height=480, units="px")
plot(data$datetime,data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
