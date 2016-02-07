# Exploratory Data Analysis, JHU
# Assignment 1
# TV 2016-02-07


## Read in the data (this will take a while). Most of the data will be discarded,
## but this method is simple to write, understand, and debug, so the inefficiency
## does not really matter that much.
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?")

# Filter for the dates required, 1/2/2007 an 2/2/2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Convert dates and times to POSIXct
data[, "DateTime"] <- as.POSIXct(strptime(paste(data[, "Date"], data[, "Time"]),
                                          "%d/%m/%Y %H:%M:%S"))


# Open PNG file for output
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
# Close PNG device
dev.off()