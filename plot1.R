# Read enough data
df <- read.table("household_power_consumption.txt", na.strings = "?", 
                 header = T, sep = ";", nrows = 100000)
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]     #subset relevant data

# Create and store histogram
png("plot1.png", width = 480, height = 480)

hist(df$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, "plot1.png")
dev.off()