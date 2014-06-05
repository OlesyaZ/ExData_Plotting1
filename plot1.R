setwd("~/Documents/Olesya/Exploratory Data Analys ")
dataset <- read.table("household_power_consumption.txt",sep=";", quote="\"",
                      stringsAsFactors = FALSE) 
## subsetting to dates 2007-02-01 and 2007-02-02
dataset[[1]]<-as.Date(dataset[[1]],"%d/%m/%Y")
data1<-which(dataset=="2007-02-01")
data2<-which(dataset=="2007-02-02")
datasubset<-dataset[data1[1]:data2[length(data2)],]
datasubset[,3]<-as.numeric(datasubset[,3]) 
## creates PNG file
  png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12,
                               bg = "white")                           
  hist(datasubset[,3], col="red", main="Global Active Power", 
                        xlab = "Global Active Power (kilowatts)")
  dev.off()