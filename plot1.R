# Download and Process Data
# I followed the steps of Stephanie Stallworth, because her approach made sense to me
# so this is not my original work, I learned from her.

# Download File
# downloaded the zipfile
# and placed the house_hold_power_comsumption.txt file in my working directory
# as suggested by the teacher Dr. Peng

# Read table
# ds = dataset
ds <-  read.csv("household_power_consumption.txt", header = TRUE,sep=";")

#Format dates
# do not forget %Y and not %y because we have four digit year code
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

# Subset data
# we only need the following dates in a Date format
ds <-ds[(ds$Date=="2007-02-01") | (ds$Date=="2007-02-02"), ]

# from factor to numeric value
ds$Global_active_power <- as.numeric(ds$Global_active_power)
ds$Global_reactive_power <- as.numeric(ds$Global_reactive_power)
ds$Voltage <- as.numeric(ds$Voltage)
ds$Sub_metering_1 <- as.numeric(ds$Sub_metering_1)
ds$Sub_metering_2 <- as.numeric(ds$Sub_metering_2)
ds$Sub_metering_3 <- as.numeric(ds$Sub_metering_3)
ds$Global_intensity <- as.numeric(ds$Global_intensity)

# create a new column DateTime for working with dates and time
x <-paste(ds$Date, ds$Time)

# do not forget to type %Y and not %y
# otherwise you get NA, NA etc
x <- strptime(x, "%Y-%m-%d %H:%M:%S")
ds$DateTime <- x
# now we have all our data in a workable format 2880 obs of 10 variables

# plot 1, send to screen
hist(ds$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (KW)", xaxt = "n")
axis(side=1, at=seq(0,3000, 1000), labels=seq(0,6,2))
# send plot1 to png
png("plot1.png", width = 480, height = 480)
hist(ds$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (KW)", xaxt = "n")
axis(side=1, at=seq(0,3000, 1000), labels=seq(0,6,2))
dev.off()

