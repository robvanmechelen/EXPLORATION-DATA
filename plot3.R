#plot 3 send to screen
# Sub_metering
# sub metring 1 has a range of 2-34
plot(ds$Sub_metering_1, type = "l", col = "black", ylim = c(0,40), xaxt = "n", xlab = "", ylab = "Energy sub metering")

# sub metring 2 has a range of 2-14
lines(ds$Sub_metering_2, type = "l", col = "red")

# sub metring 3 has a range of 0-19
lines(ds$Sub_metering_3, type = "l", col = "blue")

legend("topright",lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))

png("plot3.png", width=480, height=480)
plot(ds$Sub_metering_1, type = "l", col = "black", 
     ylim = c(0,40), xaxt = "n", xlab = "", ylab = "Energy sub metering")

lines(ds$Sub_metering_2, type = "l", col = "red")
lines(ds$Sub_metering_3, type = "l", col = "blue")

legend("topright",lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()
