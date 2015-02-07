##GET WORKING DIRECTORY
getwd()

##READ DATA INTO R
household<- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

##FORMAT DATE
household$Date<-as.Date(household$Date, format="%d/%m/%Y")

##SUBSET DATA BY TARGET DATES
household_use <- subset(household, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(household)

## CONVERT DATE
datetime <- paste(as.Date(household_use$Date), household_use$Time)
household_use$Datetime <- as.POSIXct(datetime)

## PLOT 3
with(household_use, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## SAVE TO FILE

dev.copy(png, file="plot3.png", height=600, width=600)
dev.off()