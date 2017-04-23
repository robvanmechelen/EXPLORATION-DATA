# plot 2 send to the screen 
plot(ds$Global_active_power, type= "l",ylab =  "Global Active Power (kw)",xlab  = "")
# x-axis represent a total of 2880 measurements as can be found with the str() or dim() 
# function. The x-axis reads : 0. 500,  . . .2500. which is seq from 0 to 2500, at steps=500.
# these are replaced by 3 labels thu, fri, sat in the desired picture
dev.off()
plot(ds$Global_active_power, type= "l",ylab =  'Global Active Power (kilowatts)',xlab  = '',xaxt = "n", yaxt= "n")
axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2,at = c(0,1000,2000,3000),labels = c("0","2","4", "6"))

#send plot 2 to png
png("plot2.png", width = 480, height = 480)
plot(ds$Global_active_power, type= "l",ylab =  'Global Active Power (kilowatts)',xlab  = '',xaxt = "n")
axis(side = 1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2,at = c(0,1000,2000,3000),labels = c("0","2","4", "6"))
dev.off()
