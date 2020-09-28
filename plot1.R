##Plot 1

##If not present, then download data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("power.zip")) {
    download.file(fileUrl,destfile = "power.zip")
    unzip("power.zip", exdir="./data")
}

## Read all data
dfConsumption <- read.table("data/household_power_consumption.txt", 
                            header = TRUE, sep = ";", na.strings = "?")

## Subset data for dates 2007-02-01 and 2007-02-02
dfConsumption <- subset(dfConsumption, (dfConsumption$Date == "1/2/2007" | dfConsumption$Date == "2/2/2007"))

## Create a datetime variable with appropriate format
dfConsumption$datetime <- as.POSIXct(paste(dfConsumption$Date, dfConsumption$Time), format="%d/%m/%Y %H:%M:%S")

## Set par() to 1x1
par(mfrow = c(1,1))

## Create the plot on screen
hist(dfConsumption$Global_active_power, col = "red", xlab = "Globlal Active Power (kilowatts)", main = "Global Active Power")

## Copy plot to a PNG file 
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## Close the PNG device
dev.off()