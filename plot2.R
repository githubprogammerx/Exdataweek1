##Plot2

##Set working directory
##C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1
setwd("C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1/")
##plot2

## Data file was downloaded and unzipped with Windows Explorer previous to running this

file<-"household_power_consumption.txt"

##read in data

datasetproj1 <- read.table(file, header=TRUE,quote="", sep=";")

##Select only the two days worth of data we are interested in

datasubsetproj1day1<-as.data.frame(datasetproj1[ ( "1/2/2007"==datasetproj1[,1] ),])
datasubsetproj1day2<-as.data.frame(datasetproj1[ ( "2/2/2007"==datasetproj1[,1] ),])

## Join the two days together.

datasubsetproj1plot2a<-rbind(datasubsetproj1day1, datasubsetproj1day2)
##create a time date variable
datasubsetproj1plot2b<-as.data.frame(c(paste(datasubsetproj1plot2a[,"Date"],datasubsetproj1plot2a[,"Time"])))
colnames(datasubsetproj1plot2b)<-c("Date_Time")

install.packages("stringr")
library(stringr)

install.packages("timeDate")
library(timeDate)
datasubsetproj1plot2d<-as.POSIXct(strptime(str_extract_all(datasubsetproj1plot2b[,"Date_Time"],"([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{4})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%d/%m/%Y %H:%M:%S", tz="UTC"))
datasubsetproj1plot2d<-as.POSIXct(strptime(datasubsetproj1plot2b[,"Date_Time"], format="%d %m %Y %H:%M:%S", tz="UTC"))

datasubsetproj1plot2e<-cbind(datasubsetproj1plot2b,datasubsetproj1plot2a[,"Global_active_power"])
colnames(datasubsetproj1plot2e)<-c("Date_Time","Global_active_power")

## output the plot to an PNG image file with the correct dimensions

png(filename="C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1/plot2.png", height=480, width=480, 
    bg="white")
## plot adjust add title and convert variable to a nummeric formmat, label axis, limit Y and X ranges

plot(as.numeric(as.character(datasubsetproj1plot2e[,"Global_active_power"]))~datasubsetproj1plot2e[,"Date_Time"], ylab="Global Active Power (kilowatts)"
     , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot2e[,"Global_active_power"]))~datasubsetproj1plot2e[,"Date_Time"])
tic1<-subset (datasubsetproj1plot2e,datasubsetproj1plot2e[,"Date_Time"]=="1/2/2007 00:00:00","Date_Time")
tic2<-subset (datasubsetproj1plot2e,datasubsetproj1plot2e[,"Date_Time"]=="2/2/2007 00:00:00","Date_Time")
tic3<-subset (datasubsetproj1plot2e,datasubsetproj1plot2e[,"Date_Time"]=="2/2/2007 23:59:00","Date_Time")


testseq<-c(tic1,tic2,tic3)
days<-c("Thu","Fri","Sat")
## reset X ticks marks

axis(side=1, at= testseq, label=days )
    
## turn graphic window off so the R session writes to the PNG file.
dev.off()