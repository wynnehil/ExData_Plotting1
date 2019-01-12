

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

## plot 2
png("plot2.png", height = 480, width = 480)
plot(d_final$Global_active_power~d_final$timedate, type="l", ylab="Global Active Power (kilowatts)", xlab="dateTime")
