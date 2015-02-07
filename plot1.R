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

##PLOT 1
hist(household_use$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Save to file
dev.copy(png, file="plot1.png", height=600, width=600)
dev.off()