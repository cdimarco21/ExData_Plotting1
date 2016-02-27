library(dplyr)
library(ggplot2)
library(lubridate)

# Read enough data
png("plot2.png", width = 480, height = 480)

df <- read.table("household_power_consumption.txt", 
                 na.strings = "?", 
                 header = T, 
                 sep = ";", 
                 nrows = 100000)
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]     #subset relevant data
df <- mutate(df, Date = dmy(Date), Time = Date + hms(Time))

# Create and store figure
plot(df$Time, df$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png, "plot2.png")
dev.off()