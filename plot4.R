# Exploratory Data Analysis, JHU
# Assignment 1
# TV 2016-02-07


## Read in the data (this will take a while).
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?")

## Filter for the dates required, 1/2/2007 an 2/2/2007.
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Convert dates and times to POSIXct
data[, "DateTime"] <- as.POSIXct(strptime(paste(data[, "Date"], data[, "Time"]),
                                          "%d/%m/%Y %H:%M:%S"))


# Open PNG file for output
png("plot4.png")

# Set up for plotting on a 2x2 grid
par(mfrow = c(2,2))

# Upper left: Global active power vs time
with(data, plot(DateTime, Global_active_power, type = "l", col = "black",
                xlab = "", ylab = "Global Active Power")
)

# Upper right: Voltage vs time
with(data, plot(DateTime, Voltage, type = "l", col = "black",
                xlab = "datetime", ylab = "Voltage")
)

# Lower left: Power sub metering vs time
with(data, plot(DateTime, Sub_metering_1, type = "l", col = "black",
                xlab = "", ylab = "Energy sub metering")
)
with(data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1, bty = "n")

# Lower right: Global reactive power vs time
with(data, plot(DateTime, Global_reactive_power, type = "l", col = "black",
                xlab = "datetime", ylab = "Global_reactive_power")
)

# Close the PNG device
dev.off()