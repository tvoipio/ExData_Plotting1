# Exploratory Data Analysis, JHU
# Assignment 1
# TV 2016-02-07


## Read in the data (this will take a while)
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?")

# Filter for the dates required, 1/2/2007 an 2/2/2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Convert dates and times to POSIXct
data[, "DateTime"] <- as.POSIXct(strptime(paste(data[, "Date"], data[, "Time"]),
                                          "%d/%m/%Y %H:%M:%S"))


# Open PNG file for output
png("plot2.png")
plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()