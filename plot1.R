##use grep to read only the lines with required dates
project_1_data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), 
                             col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                           "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                             sep = ";", header = TRUE)

##first plot
hist(project_1_data$Global_active_power, xlab = "Global Acive Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()