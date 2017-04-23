# plot 4 is composed of 4 images
# we already have image 1 and image 3 we have first to construct
# image 2 
# Voltage and date time
plot(ds$DateTime,ds$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")
# so the yaxis range is 800- 2200 in steps of 400 so 8 y markers
# but only 4 values
plot(ds$DateTime,ds$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage", yaxt = "n")
axis(side = 2,at = c(800,1000,1200,1400,1600,1800,2000, 2200),
     labels = c("234", "", "238","", "242","", "246", ""))

# construct image 4
plot(ds$DateTime,ds$Global_reactive_power, type = "l", xlab = "datetime")
# y range is 0 to 200 in steps of 50 so 5 markers along the y-axis
# but the the desired picture 6 markers are requested
plot(ds$DateTime,ds$Global_reactive_power, type = "l", xlab = "datetime",
     ylim = c(0,260),yaxt ="n")
axis(side = 2,at = c(0,50,100,150,200,250),
     labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))

# Now we construct the complete picture 2 x 2
# plot 4 
# now let us create the 2 x 2 picture

par(mfrow= c(2,2), mar= c(4,4,2,1))
# image 1 plot GAP = Global Active Power
plot(ds$Global_active_power, type= "l",ylab =  'Global Active Power (kilowatts)',xlab  = '',xaxt = "n", yaxt= "n")
axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2,at = c(0,1000,2000,3000),labels = c("0","2","4", "6"))

# image 2 plot Voltage versus datetime
plot(ds$DateTime,ds$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage", yaxt = "n")
axis(side = 2,at = c(800,1000,1200,1400,1600,1800,2000, 2200),
     labels = c("234", "", "238","", "242","", "246", ""))

# image 3 plot Energy Sub metering
plot(ds$Sub_metering_1, type = "l", col = "black", ylim = c(0,40), xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(ds$Sub_metering_2, type = "l", col = "red")
lines(ds$Sub_metering_3, type = "l", col = "blue")
legend("topright",lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))

# image 4 and plot Global reactive Power
plot(ds$DateTime,ds$Global_reactive_power, type = "l", xlab = "datetime",
     ylim = c(0,260),yaxt ="n")
axis(side = 2,at = c(0,50,100,150,200,250),
     labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))

# create png file as requensted
png("plot4.png", width=480, height=480)
par(mfrow= c(2,2), mar= c(4,4,2,1))
plot(ds$Global_active_power, type= "l",ylab =  'Global Active Power (kilowatts)',xlab  = '',xaxt = "n", yaxt= "n")
axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2,at = c(0,1000,2000,3000),labels = c("0","2","4", "6"))
# image 2 plot Voltage versus datetime
plot(ds$DateTime,ds$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage", yaxt = "n")
axis(side = 2,at = c(800,1000,1200,1400,1600,1800,2000, 2200),
     labels = c("234", "", "238","", "242","", "246", ""))
# image 3 plot Energy Sub metering
plot(ds$Sub_metering_1, type = "l", col = "black", ylim = c(0,40), xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(ds$Sub_metering_2, type = "l", col = "red")
lines(ds$Sub_metering_3, type = "l", col = "blue")
legend("topright",lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
# image 4 and plot Global reactive Power
plot(ds$DateTime,ds$Global_reactive_power, type = "l", xlab = "datetime",
     ylim = c(0,260),yaxt ="n")
axis(side = 2,at = c(0,50,100,150,200,250),
     labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))
dev.off()

