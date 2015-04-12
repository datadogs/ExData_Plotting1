## Reads the full dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')

## Converts date field
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## subsets for the 2 days
hpc1 <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converts date field
date_time <- paste(as.Date(hpc1$Date), hpc1$Time)
hpc1$Datetime <- as.POSIXct(date_time)

## Plots line graph
plot(hpc1$Datetime, hpc1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saves plot2 into a file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()