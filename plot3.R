## Reads the full dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')

## Converts date field
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## subsets for the 2 days
hpc1 <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converts date field
date_time <- paste(as.Date(hpc1$Date), hpc1$Time)
hpc1$Datetime <- as.POSIXct(date_time)

## Plots line graphs
plot(hpc1$Datetime, hpc1$Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(hpc1$Datetime, hpc1$Sub_metering_2, col = 'Red')
lines(hpc1$Datetime, hpc1$Sub_metering_3, col = 'Blue')

## Saves plot3 into a file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()