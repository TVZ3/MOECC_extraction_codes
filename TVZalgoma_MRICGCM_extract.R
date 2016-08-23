library(raster)
library(rgdal)
library(dismo)
library(rgeos)
library(biomod2)


#####################
#   2050MRI-CGCM3  #
#####################
occurdat<-list.files("D:\\IPPC 5 Data\\2050 (average for 2041-2060)\\MRI-CGCM3\\",pattern=".tif$",full=T)
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
calclim <- crop(calclim,extent(-86,-77,45,48))

#load gps points
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")
x<-read.csv("TVZ_Algoma.csv")
attach(x)
gps <- data.frame(x=Longitude ,y=Latitude)
crs.world <-CRS("+proj=longlat +datum=WGS84")
coordinates(gps) <- ~x+y
proj4string(gps) <- crs.world
mgprtntx501 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, mgprtntx501)
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
x10$mg26tmean501 <- NA
x10$mg26tmean502 <- NA
x10$mg26tmean503 <- NA
x10$mg26tmean504 <- NA
x10$mg26tmean505 <- NA
x10$mg26tmean506 <- NA
x10$mg26tmean507 <- NA
x10$mg26tmean508 <- NA
x10$mg26tmean509 <- NA
x10$mg26tmean5010 <- NA
x10$mg26tmean5011 <- NA
x10$mg26tmean5012 <- NA
x10$mg45tmean501 <- NA
x10$mg45tmean502 <- NA
x10$mg45tmean503 <- NA
x10$mg45tmean504 <- NA
x10$mg45tmean505 <- NA
x10$mg45tmean506 <- NA
x10$mg45tmean507 <- NA
x10$mg45tmean508 <- NA
x10$mg45tmean509 <- NA
x10$mg45tmean5010 <- NA
x10$mg45tmean5011 <- NA
x10$mg45tmean5012 <- NA
x10$mg60tmean501 <- NA
x10$mg60tmean502 <- NA
x10$mg60tmean503 <- NA
x10$mg60tmean504 <- NA
x10$mg60tmean505 <- NA
x10$mg60tmean506 <- NA
x10$mg60tmean507 <- NA
x10$mg60tmean508 <- NA
x10$mg60tmean509 <- NA
x10$mg60tmean5010 <- NA
x10$mg60tmean5011 <- NA
x10$mg60tmean5012 <- NA
x10$mg85tmean501 <- NA
x10$mg85tmean502 <- NA
x10$mg85tmean503 <- NA
x10$mg85tmean504 <- NA
x10$mg85tmean505 <- NA
x10$mg85tmean506 <- NA
x10$mg85tmean507 <- NA
x10$mg85tmean508 <- NA
x10$mg85tmean509 <- NA
x10$mg85tmean5010 <- NA
x10$mg85tmean5011 <- NA
x10$mg85tmean5012 <- NA
x11 <- x10[, c(1:92,201:212, 93:128, 213:224, 129:164,
               225:236, 165:200, 237:248)]
names(x11)
write.csv (x11, file = "TVZ_Algoma.csv",row.names=FALSE)

x11<-read.csv("TVZ_Algoma.csv")
names(x11)
for (i in c(69:80, 117:128, 165:176, 213:224)){
  for (j in 1:45){
    x11[j,i+24]<-(x11[j,i]+x11[j,i+12])/2
  }
}
names(x11)
write.csv(x11, file = "TVZ_Algoma.csv", row.names=FALSE)


#####################
#   2070MRI-CGCM3  #
#####################


occurdat<-list.files("D:\\IPPC 5 Data\\2070 (average for 2061-2080)\\MRI-CGCM3\\",pattern=".tif$",full=T)
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
calclim <- crop(calclim,extent(-86,-77,45,48))

#load gps points
setwd("C:\\Users\\adminuser\\Desktop\\EVERYTHING THOMAS\\OMNR Alagae project")
x<-read.csv("TVZ_Algoma.csv")
attach(x)
gps <- data.frame(x=Longitude ,y=Latitude)
crs.world <-CRS("+proj=longlat +datum=WGS84")
coordinates(gps) <- ~x+y
proj4string(gps) <- crs.world
mgprtntx701 <- spTransform(gps, calclim@crs)
#extract data points
presence <- extract(calclim, mgprtntx701)
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
x10<-data.frame(x6,x2,x7,x3,x8,x4,x9,x5)
names(x10)
x10$mg26tmean701 <- NA
x10$mg26tmean702 <- NA
x10$mg26tmean703 <- NA
x10$mg26tmean704 <- NA
x10$mg26tmean705 <- NA
x10$mg26tmean706 <- NA
x10$mg26tmean707 <- NA
x10$mg26tmean708 <- NA
x10$mg26tmean709 <- NA
x10$mg26tmean7010 <- NA
x10$mg26tmean7011 <- NA
x10$mg26tmean7012 <- NA
x10$mg45tmean701 <- NA
x10$mg45tmean702 <- NA
x10$mg45tmean703 <- NA
x10$mg45tmean704 <- NA
x10$mg45tmean705 <- NA
x10$mg45tmean706 <- NA
x10$mg45tmean707 <- NA
x10$mg45tmean708 <- NA
x10$mg45tmean709 <- NA
x10$mg45tmean7010 <- NA
x10$mg45tmean7011 <- NA
x10$mg45tmean7012 <- NA
x10$mg60tmean701 <- NA
x10$mg60tmean702 <- NA
x10$mg60tmean703 <- NA
x10$mg60tmean704 <- NA
x10$mg60tmean705 <- NA
x10$mg60tmean706 <- NA
x10$mg60tmean707 <- NA
x10$mg60tmean708 <- NA
x10$mg60tmean709 <- NA
x10$mg60tmean7010 <- NA
x10$mg60tmean7011 <- NA
x10$mg60tmean7012 <- NA
x10$mg85tmean701 <- NA
x10$mg85tmean702 <- NA
x10$mg85tmean703 <- NA
x10$mg85tmean704 <- NA
x10$mg85tmean705 <- NA
x10$mg85tmean706 <- NA
x10$mg85tmean707 <- NA
x10$mg85tmean708 <- NA
x10$mg85tmean709 <- NA
x10$mg85tmean7010 <- NA
x10$mg85tmean7011 <- NA
x10$mg85tmean7012 <- NA
test <- x10

for (i in 1:12)
{
  col1 <- paste("mg85tmean70",i, sep="")
  test[,col1] <- NA
  }

names(x10)
x11 <- x10[, c(1:36, 145:156, 37:72, 157:168, 73:108, 169:180, 109:144, 181:192)]
names(x11)
names(x)
x12 <- data.frame(x, x11)
names(x12)
write.csv (x12, file = "TVZ_Algoma.csv",row.names=FALSE)

x12<-read.csv("TVZ_Algoma.csv")
names(x12)
for (i in c(261:272, 309:320, 357:368, 405:416)){
  for (j in 1:45){
    x12[j,i+24]<-(x12[j,i]+x12[j,i+12])/2
  }
}
names(x12)
write.csv(x12, file = "TVZ_Algoma.csv", row.names=FALSE)
