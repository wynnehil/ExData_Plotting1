

#attach and read file
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
attach(d) 
head(d)
str(d)
names(d)

## Remove missing values
d_final <- d[complete.cases(d),]

## filter dates:
d_final <-d[d$Date %in% c("1/2/2007", "2/2/2007"),]

## convert the Date and Time variables to Date/Time classes
timedate <-strptime(paste(d_final$Date, d_final$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## combine column:
d_final <-cbind(timedate,d_final)

## plot 3
png("plot3.png", height = 480, width = 480)
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(d_final$timedate, d_final$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(d_final$timedate, d_final$Sub_metering_2, col=columnlines[2])
lines(d_final$timedate, d_final$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
