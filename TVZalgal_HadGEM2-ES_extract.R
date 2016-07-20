library(raster)
library(rgdal)
library(dismo)
library(rgeos)
library(biomod2)
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")

#####################
#   2050HadGEM2-ES #
#####################
occurdat<-list.files("D:\\IPPC 5 Data\\2050 (average for 2041-2060)\\HadGEM2-ES\\",pattern=".tif$",full=T)
months <- seq(0,132,12)
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
heprtntx501 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, heprtntx501)
x1 <- data.frame(presence)
names(x1)
x2 <- cbind(x1[, c(13:36)])
x3 <- cbind(x1[, c(49:72)])
x4 <- cbind(x1[, c(85:108)])
x5 <- cbind(x1[, c(121:144)])
x2<-x2[, ]/10
x3<-x3[, ]/10
x4<-x4[, ]/10
x5<-x5[, ]/10
x6<-cbind(x1[, c(1:12)])
x7<-cbind(x1[, c(37:48)])
x8<-cbind(x1[, c(73:84)])
x9<-cbind(x1[, c(109:120)])
x10<-data.frame(x,x6,x2,x7,x3,x8,x4,x9,x5)
names(x10)
write.csv (x10, file = "TVZ_Algal.csv",row.names=FALSE)
###########################################################################
# Go into the CSV file and add 48 columns where you want your tmeans to go
###########################################################################

x11<-read.csv("TVZ_Algal.csv")
names(x11)
for (i in c(2853:2864, 2901:2912, 2949:2960, 2997:3008)){
  for (j in 1:104){
    x11[j,i+24]<-(x11[j,i]+x11[j,i+12])/2
  }
}
names(x11)
write.csv(x11, file = "TVZ_Algal.csv", row.names=FALSE)


#####################
#   2070HadGEM2-ES #
#####################


occurdat<-list.files("D:\\IPPC 5 Data\\2070 (average for 2061-2080)\\HadGEM2-ES\\",pattern=".tif$",full=T)
months <- seq(0,132,12)
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
heprtntx701 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, heprtntx701)
x1 <- data.frame(presence)
names(x1)
x2 <- cbind(x1[, c(13:36)])
x3 <- cbind(x1[, c(49:72)])
x4 <- cbind(x1[, c(85:108)])
x5 <- cbind(x1[, c(121:144)])
x2<-x2[, ]/10
x3<-x3[, ]/10
x4<-x4[, ]/10
x5<-x5[, ]/10
x6<-cbind(x1[, c(1:12)])
x7<-cbind(x1[, c(37:48)])
x8<-cbind(x1[, c(73:84)])
x9<-cbind(x1[, c(109:120)])
x10<-data.frame(x,x6,x2,x7,x3,x8,x4,x9,x5)
write.csv (x10, file = "TVZ_Algal.csv",row.names=FALSE)
###########################################################################
# Go into the CSV file and add 48 columns where you want your tmeans to go
###########################################################################
x11<-read.csv("TVZ_Algal.csv")
names(x11)
for (i in c(3045:3056, 3093:3104, 3141:3152, 3189:3200)){
  for (j in 1:104){
    x11[j,i+24]<-(x11[j,i]+x11[j,i+12])/2
  }
}
names(x11)
write.csv(x11, file = "TVZ_Algal.csv", row.names=FALSE)
