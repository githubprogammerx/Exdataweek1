##Plot4

##Set working directory
##C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1
setwd("C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1/")
##plot4


##We need a panel 2X2 so we use set panel then do four plots
## we need package fields
install.packages("fields")
library(fields)
set.panel(2,2) #divide screen to hold 4 plots where there are 2 rows  
#and 2 columns 

## Data file was downloaded and unzipped with Windows Explorer previous to running this

file<-"household_power_consumption.txt"

##read in data

datasetproj1 <- read.table(file, header=TRUE,quote="", sep=";")

##Select only the two days worth of data we are interested in

datasubsetproj1day1<-as.data.frame(datasetproj1[ ( "1/2/2007"==datasetproj1[,1] ),])
datasubsetproj1day2<-as.data.frame(datasetproj1[ ( "2/2/2007"==datasetproj1[,1] ),])

##Panel 1 same as PLOT2
## Join the two days together.


datasubsetproj1plot2a<-rbind(datasubsetproj1day1, datasubsetproj1day2)
##create a time date variable
datasubsetproj1plot2b<-as.data.frame(c(paste(datasubsetproj1plot2a[,"Date"],datasubsetproj1plot2a[,"Time"])))
colnames(datasubsetproj1plot2b)<-c("Date_Time")

#install.packages("stringr")
#library(stringr)

#install.packages("timeDate")
#library(timeDate)
datasubsetproj1plot2d<-as.POSIXct(strptime(str_extract_all(datasubsetproj1plot2b[,"Date_Time"],"([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{4})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%d/%m/%Y %H:%M:%S", tz="UTC"))
datasubsetproj1plot2d<-as.POSIXct(strptime(datasubsetproj1plot2b[,"Date_Time"], format="%d %m %Y %H:%M:%S", tz="UTC"))

datasubsetproj1plot2e<-cbind(datasubsetproj1plot2b,datasubsetproj1plot2a[,"Global_active_power"])
colnames(datasubsetproj1plot2e)<-c("Date_Time","Global_active_power")

## output the plot to an PNG image file with the correct dimensions

png(filename="C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1/plot4.png", height=480, width=480, 
    bg="white")
## plot adjust add title and convert variable to a nummeric formmat, label axis, limit Y and X ranges

plot(as.numeric(as.character(datasubsetproj1plot2e[,"Global_active_power"]))~datasubsetproj1plot2e[,"Date_Time"], ylab="Global Active Power"
     , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot2e[,"Global_active_power"]))~datasubsetproj1plot2e[,"Date_Time"])
tic1<-subset (datasubsetproj1plot2e,datasubsetproj1plot2e[,"Date_Time"]=="1/2/2007 00:00:00","Date_Time")
tic2<-subset (datasubsetproj1plot2e,datasubsetproj1plot2e[,"Date_Time"]=="2/2/2007 00:00:00","Date_Time")
tic3<-subset (datasubsetproj1plot2e,datasubsetproj1plot2e[,"Date_Time"]=="2/2/2007 23:59:00","Date_Time")


testseq<-c(tic1,tic2,tic3)
days<-c("Thu","Fri","Sat")
## reset X ticks marks

axis(side=1, at= testseq, label=days )
## Join the two days together.
##Panel 2 new plot same as plot 2 with Voltage

datasubsetproj1plot2a1<-rbind(datasubsetproj1day1, datasubsetproj1day2)
##create a time date variable
datasubsetproj1plot2b1<-as.data.frame(c(paste(datasubsetproj1plot2a1[,"Date"],datasubsetproj1plot2a1[,"Time"])))
colnames(datasubsetproj1plot2b1)<-c("Date_Time")

datasubsetproj1plot2d1<-as.POSIXct(strptime(str_extract_all(datasubsetproj1plot2b1[,"Date_Time"],"([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{4})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%d/%m/%Y %H:%M:%S", tz="UTC"))
datasubsetproj1plot2d1<-as.POSIXct(strptime(datasubsetproj1plot2b1[,"Date_Time"], format="%d %m %Y %H:%M:%S", tz="UTC"))

datasubsetproj1plot2e1<-cbind(datasubsetproj1plot2b1,datasubsetproj1plot2a1[,"Voltage"])
colnames(datasubsetproj1plot2e1)<-c("Date_Time","Voltage")




plot(as.numeric(as.character(datasubsetproj1plot2e1[,"Voltage"]))~datasubsetproj1plot2e1[,"Date_Time"], ylab="Voltage"
     , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot2e1[,"Voltage"]))~datasubsetproj1plot2e1[,"Date_Time"])
tic1<-subset (datasubsetproj1plot2e1,datasubsetproj1plot2e1[,"Date_Time"]=="1/2/2007 00:00:00","Date_Time")
tic2<-subset (datasubsetproj1plot2e1,datasubsetproj1plot2e1[,"Date_Time"]=="2/2/2007 00:00:00","Date_Time")
tic3<-subset (datasubsetproj1plot2e1,datasubsetproj1plot2e1[,"Date_Time"]=="2/2/2007 23:59:00","Date_Time")


testseq<-c(tic1,tic2,tic3)
days<-c("Thu","Fri","Sat")
## reset X ticks marks

axis(side=1, at= testseq, label=days )
## Join the two days together.
##Panel 3 same as plot 3

datasubsetproj1plot3a<-rbind(datasubsetproj1day1, datasubsetproj1day2)
##create a time date variable
datasubsetproj1plot3b<-as.data.frame(c(paste(datasubsetproj1plot3a[,"Date"],datasubsetproj1plot3a[,"Time"])))
colnames(datasubsetproj1plot3b)<-c("Date_Time")


datasubsetproj1plot3d<-as.POSIXct(strptime(str_extract_all(datasubsetproj1plot3b[,"Date_Time"],"([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{4})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%d/%m/%Y %H:%M:%S", tz="UTC"))
datasubsetproj1plot3d<-as.POSIXct(strptime(datasubsetproj1plot3b[,"Date_Time"], format="%d %m %Y %H:%M:%S", tz="UTC"))

datasubsetproj1plot3e1<-cbind(datasubsetproj1plot3b,datasubsetproj1plot3a[,7:9])
colnames(datasubsetproj1plot3e1)<-c("Date_Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## plot adjust add title and convert variable to a nummeric formmat, label axis, limit Y and X ranges

plot(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_1"]))~datasubsetproj1plot3e1[,"Date_Time"], ylab="Energy sub metering"
     , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_1"]))~datasubsetproj1plot3e1[,"Date_Time"])
##plot(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_2"]))~datasubsetproj1plot3e1[,"Date_Time"], ylab="Energy Sub Metering"
 ##    , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_2"]))~datasubsetproj1plot3e1[,"Date_Time"], col="red")
##plot(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_3"]))~datasubsetproj1plot3e1[,"Date_Time"], ylab="Energy Sub Metering"
  ##   , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_3"]))~datasubsetproj1plot3e1[,"Date_Time"],col="blue")

tic1<-subset (datasubsetproj1plot3e1,datasubsetproj1plot3e1[,"Date_Time"]=="1/2/2007 00:00:00","Date_Time")
tic2<-subset (datasubsetproj1plot3e1,datasubsetproj1plot3e1[,"Date_Time"]=="2/2/2007 00:00:00","Date_Time")
tic3<-subset (datasubsetproj1plot3e1,datasubsetproj1plot3e1[,"Date_Time"]=="2/2/2007 23:59:00","Date_Time")


testseq<-c(tic1,tic2,tic3)
days<-c("Thu","Fri","Sat")
## reset X ticks marks

axis(side=1, at= testseq, label=days )
legend1<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
color1<-c("black","red","blue")
legend("topright",legend=legend1,col=color1,lty=1)  
##Panel 4 same as Plot2 with different varaible


datasubsetproj1plot2a2<-rbind(datasubsetproj1day1, datasubsetproj1day2)
##create a time date variable
datasubsetproj1plot2b2<-as.data.frame(c(paste(datasubsetproj1plot2a2[,"Date"],datasubsetproj1plot2a1[,"Time"])))
colnames(datasubsetproj1plot2b2)<-c("Date_Time")

datasubsetproj1plot2d2<-as.POSIXct(strptime(str_extract_all(datasubsetproj1plot2b2[,"Date_Time"],"([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{4})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%d/%m/%Y %H:%M:%S", tz="UTC"))
datasubsetproj1plot2d2<-as.POSIXct(strptime(datasubsetproj1plot2b2[,"Date_Time"], format="%d %m %Y %H:%M:%S", tz="UTC"))

datasubsetproj1plot2e2<-cbind(datasubsetproj1plot2b2,datasubsetproj1plot2a2[,"Global_reactive_power"])
colnames(datasubsetproj1plot2e2)<-c("Date_Time","Global_reactive_power")




plot(as.numeric(as.character(datasubsetproj1plot2e2[,"Global_reactive_power"]))~datasubsetproj1plot2e2[,"Date_Time"], ylab="Global reactive power"
     , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot2e2[,"Global_reactive_power"]))~datasubsetproj1plot2e2[,"Date_Time"])
tic1<-subset (datasubsetproj1plot2e1,datasubsetproj1plot2e2[,"Date_Time"]=="1/2/2007 00:00:00","Date_Time")
tic2<-subset (datasubsetproj1plot2e1,datasubsetproj1plot2e2[,"Date_Time"]=="2/2/2007 00:00:00","Date_Time")
tic3<-subset (datasubsetproj1plot2e1,datasubsetproj1plot2e2[,"Date_Time"]=="2/2/2007 23:59:00","Date_Time")


testseq<-c(tic1,tic2,tic3)
days<-c("Thu","Fri","Sat")
## reset X ticks marks

axis(side=1, at= testseq, label=days )
## turn graphic window off so the R session writes to the PNG file.
dev.off()