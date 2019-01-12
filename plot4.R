

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

## plot 4:
png("plot4.png", height = 480, width = 480)
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
with(d_final, {
  plot(d_final$timedate, d_final$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(d_final$timedate, d_final$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(d_final$timedate,d_final$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d_final$timedate, d_final$Sub_metering_2, type="l", col="red")
lines(d_final$timedate, d_final$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
plot(d_final$timedate, d_final$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
})

