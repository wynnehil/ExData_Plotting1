

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

## 
timedate <-strptime(paste(d_final$Date, d_final$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

d_final <-cbind(timedate,d_final)

png("plot1.png", height = 480, width = 480)
hist(d_final$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
