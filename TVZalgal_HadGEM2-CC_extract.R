library(raster)
library(rgdal)
library(dismo)
library(rgeos)
library(biomod2)
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")

#####################
#   2050HadGEM2-CC  #
#####################
occurdat<-list.files("D:\\IPPC 5 Data\\2050 (average for 2041-2060)\\HadGEM2-CC\\",pattern=".tif$",full=T)
months <- seq(0,60,12)
for (i in months){
  occurdat[(1+i):(12+i)] <- c(occurdat[1+i],occurdat[(5+i):(12+i)],occurdat[(2+i):(4+i)])
}
r1 <- raster(occurdat[1], package="raster")
names(r1)
for (i in 2:length(occurdat)){
  r2 <- raster(occurdat[i], package="raster")
  r1 <- stack(r1,r2)
}
calclim <- r1
names(calclim)
calclim <- crop(calclim,extent(-86,-76.5,44,48))

#load gps points
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")
x<-read.csv("TVZ_Algal.csv")
attach(x)
gps <- data.frame(x=Longitude ,y=Latitude)
crs.world <-CRS("+proj=longlat +datum=WGS84")
coordinates(gps) <- ~x+y
proj4string(gps) <- crs.world
hgprtntx501 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, hgprtntx501)
x1 <- data.frame(presence)
names(x1)
x2 <- cbind(x1[, c(13:36)])
x3 <- cbind(x1[, c(49:72)])
x2<-x2[, ]/10
x3<-x3[, ]/10
x6<-cbind(x1[, c(1:12)])
x7<-cbind(x1[, c(37:48)])
x10<-data.frame(x,x6,x2,x7,x3)
names(x10)
write.csv (x10, file = "TVZ_Algal.csv",row.names=FALSE)
###########################################################################
# Go into the CSV file and add 48 columns where you want your tmeans to go
###########################################################################

x11<-read.csv("TVZ_Algal.csv")
names(x11)
for (i in c(3237:3248, 3285:3296)){
  for (j in 1:104){
    x11[j,i+24]<-(x11[j,i]+x11[j,i+12])/2
  }
}
names(x11)
write.csv(x11, file = "TVZ_Algal.csv", row.names=FALSE)


#####################
#   2070HadGEM2-CC #
#####################


occurdat<-list.files("D:\\IPPC 5 Data\\2070 (average for 2061-2080)\\HadGEM2-CC\\",pattern=".tif$",full=T)
months <- seq(0,60,12)
for (i in months){
  occurdat[(1+i):(12+i)] <- c(occurdat[1+i],occurdat[(5+i):(12+i)],occurdat[(2+i):(4+i)])
}
r1 <- raster(occurdat[1], package="raster")
for (i in 2:length(occurdat)){
  r2 <- raster(occurdat[i], package="raster")
  r1 <- stack(r1,r2)
}
calclim <- r1
names(calclim)
calclim <- crop(calclim,extent(-86,-76.5,44,48))

#load gps points
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")
x<-read.csv("TVZ_Algal.csv")
attach(x)
gps <- data.frame(x=Longitude ,y=Latitude)
crs.world <-CRS("+proj=longlat +datum=WGS84")
coordinates(gps) <- ~x+y
proj4string(gps) <- crs.world
hgprtntx701 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, hgprtntx701)
x1 <- data.frame(presence)
names(x1)
x2 <- cbind(x1[, c(13:36)])
x3 <- cbind(x1[, c(49:72)])
x2<-x2[, ]/10
x3<-x3[, ]/10
x6<-cbind(x1[, c(1:12)])
x7<-cbind(x1[, c(37:48)])
x10<-data.frame(x,x6,x2,x7,x3)
names(x10)
write.csv (x10, file = "TVZ_Algal.csv",row.names=FALSE)
###########################################################################
# Go into the CSV file and add 48 columns where you want your tmeans to go
###########################################################################
x11<-read.csv("TVZ_Algal.csv")
names(x11)
for (i in c(3333:3344, 3381:3392)){
  for (j in 1:104){
    x11[j,i+24]<-(x11[j,i]+x11[j,i+12])/2
  }
}
names(x11)
write.csv(x11, file = "TVZ_Algal.csv", row.names=FALSE)
