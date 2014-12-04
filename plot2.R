##read file and prepare datatable
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")
df$Date <- NULL
df$Time <- NULL
df <- df[c(8,1,2,3,4,5,6,7)]
df <- subset(df, DateTime>"2007-01-31 23:59:59" & DateTime<"2007-02-03 00:00:00")

##Code for Plot 2
png(filename="plot2.png", width=480, height=480)
plot(df$DateTime, df$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     main="")
dev.off()