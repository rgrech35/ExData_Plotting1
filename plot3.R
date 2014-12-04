##read file and prepare datatable
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")
df$Date <- NULL
df$Time <- NULL
df <- df[c(8,1,2,3,4,5,6,7)]
df <- subset(df, DateTime>"2007-01-31 23:59:59" & DateTime<"2007-02-03 00:00:00")


##Code for Plot 3
png(filename="plot3.png", width=480, height=480)
plot(df$DateTime, df$Sub_metering_1, 
     type="s",
     ylab="Energy sub metering",
     xlab="")
lines(df$DateTime, df$Sub_metering_2, type="s", col="red")
lines(df$DateTime, df$Sub_metering_3, type="s", col="blue")
legend("topright", lwd=1, lty=1, col = c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
