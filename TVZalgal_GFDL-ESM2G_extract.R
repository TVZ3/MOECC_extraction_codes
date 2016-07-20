library(raster)
library(rgdal)
library(dismo)
library(rgeos)
library(biomod2)
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")

#####################
#   205GFDL-ESM2G  #
#####################
occurdat<-list.files("D:\\IPPC 5 Data\\2050 (average for 2041-2060)\\GFDL-ESM2G\\",pattern=".tif$",full=T)
months <- seq(0,96,12)
for (i in months){
  occurdat[(1+i):(12+i)] <- c(occurdat[1+i],occurdat[(5+i):(12+i)],occurdat[(2+i):(4+i)])
}
r1 <- raster(occurdat[1], package="raster")

for (i in 2:length(occurdat)){
  r2 <- raster(occurdat[i], package="raster")
  r1 <- stack(r1,r2)
}
calclim <- r1
calclim <- crop(calclim,extent(-86,-76.5,44,48))

#load gps points
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")
x<-read.csv("TVZ_Algal.csv")
attach(x)
gps <- data.frame(x=Longitude ,y=Latitude)
crs.world <-CRS("+proj=longlat +datum=WGS84")
coordinates(gps) <- ~x+y
proj4string(gps) <- crs.world
gdprtntx501 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, gdprtntx501)
x1 <- data.frame(presence)
names(x1)
x2 <- cbind(x1[, c(13:36)])
x3 <- cbind(x1[, c(49:72)])
x4 <- cbind(x1[, c(85:108)])
x2<-x2[, ]/10
x3<-x3[, ]/10
x4<-x4[, ]/10
x5<-cbind(x1[, c(1:12)])
x6<-cbind(x1[, c(37:48)])
x7<-cbind(x1[, c(73:84)])
x8<-data.frame(x,x5,x2,x6,x3,x7,x4)
names(x8)
write.csv (x8, file = "TVZ_Algal.csv",row.names=FALSE)
###########################################################################
# Go into the CSV file and add 36 columns where you want your tmeans to go
###########################################################################

x9<-read.csv("TVZ_Algal.csv")
names(x9)
for (i in c(4197:4208, 4245:4256, 4293:4304)){
  for (j in 1:104){
    x9[j,i+24]<-(x9[j,i]+x9[j,i+12])/2
  }
}
names(x9)
write.csv(x9, file = "TVZ_Algal.csv", row.names=FALSE)


#####################
#   2070GFDL-ESM2G  #
#####################


occurdat<-list.files("D:\\IPPC 5 Data\\2070 (average for 2061-2080)\\GFDL-ESM2G",pattern=".tif$",full=T)
months <- seq(0,96,12)
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
gdprtntx501 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, gdprtntx501)
x1 <- data.frame(presence)
names(x1)
x2 <- cbind(x1[, c(13:36)])
x3 <- cbind(x1[, c(49:72)])
x4 <- cbind(x1[, c(85:108)])
x2<-x2[, ]/10
x3<-x3[, ]/10
x4<-x4[, ]/10
x5<-cbind(x1[, c(1:12)])
x6<-cbind(x1[, c(37:48)])
x7<-cbind(x1[, c(73:84)])
x8<-data.frame(x,x5,x2,x6,x3,x7,x4)
names(x8)
write.csv (x8, file = "TVZ_Algal.csv",row.names=FALSE)
###########################################################################
# Go into the CSV file and add 36 columns where you want your tmeans to go
###########################################################################
x9<-read.csv("TVZ_Algal.csv")
names(x9)
for (i in c(4341:4352, 4389:4400, 4437:4448)){
  for (j in 1:104){
    x9[j,i+24]<-(x9[j,i]+x9[j,i+12])/2
  }
}
names(x9)
write.csv(x9, file = "TVZ_Algal.csv", row.names=FALSE)
