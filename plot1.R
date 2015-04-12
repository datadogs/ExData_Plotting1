## Reads the full dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')

## Converts date field
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## subsets for the 2 days
hpc1 <- subset(hpc, (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plots histogram
hist(hpc1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Saves plot1 into a file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()