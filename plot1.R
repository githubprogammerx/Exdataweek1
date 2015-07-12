##Plot1

##Set working directory
##C:\Users\ptimusk\Documents\GitHub\courseraDataScience\ExploratoryDataAnalysis
setwd("C:/Users/ptimusk/Documents/GitHub/courseraDataScience/ExploratoryDataAnalysis/")
##plot1

## Data file was downloaded and unzipped with Windows Explorer previous to running this

file<-"household_power_consumption.txt"

##read in data

datasetproj1 <- read.table(file, header=TRUE,quote="", sep=";")

##Select only the two days worth of data we are interested in

datasubsetproj1day1<-as.data.frame(datasetproj1[ ( "1/2/2007"==datasetproj1[,1] ),])
datasubsetproj1day2<-as.data.frame(datasetproj1[ ( "2/2/2007"==datasetproj1[,1] ),])

## Join the two days together.

datasubsetproj1plot1d<-rbind(datasubsetproj1day1, datasubsetproj1day2)

## output the plot to an PNG image file with the correct dimensions

png(filename="C:/Users/ptimusk/Documents/GitHub/courseraDataScience/ExploratoryDataAnalysis/plot1.png", height=480, width=480, 
    bg="white")
## plot adjust add title and convert variable to a nummeric formmat, label axis, limit Y and X ranges

hist(as.numeric(as.character(datasubsetproj1plot1d[,"Global_active_power"])), xlab="Global Active Power (kilowatts)", xlim=range(0,2,4,6), col="red",
     ylim=range(0:1200) ,    main="Global Active Power", xaxt='n')
## reset X ticks marks

axis(side=1, at=seq(0,6, 2))

## turn graphic window off so the R session writes to the PNG file.

dev.off()