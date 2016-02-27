library(dplyr)
library(ggplot2)
library(lubridate)

# Read enough data
df <- read.table("household_power_consumption.txt", 
                 na.strings = "?", 
                 header = T, 
                 sep = ";", 
                 nrows = 100000)
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]     #subset relevant data
df <- mutate(df, Date = dmy(Date), Time = Date + hms(Time))

# Create and store figure
png("plot3.png", width = 480, height = 480)

plot(df$Time, df$Sub_metering_1, type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"))

dev.copy(png, "plot3.png")
dev.off()