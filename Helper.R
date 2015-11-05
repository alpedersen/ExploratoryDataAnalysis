##Instead of having the same starter code for each of the individual plot files,
##we will use this helper file. Each plot file code will call this file.

filename <- "./household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na = "?") 
##since the assignment specifies that ? is used for na values, this is needed.

dim(data) ##This gives you the extreme value of 2075259 rows and 9 columns
attach(data)

##Since the assignment dictates we only need 2 of the days of datas, a subset is
##created.

subset <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- data[subset, ]
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData) ##We have now reduced the dimensions to 2880 rows.
attach(newData)
