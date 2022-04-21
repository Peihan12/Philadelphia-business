library(lubridate)
library(tidyverse)
library(sf)
library(jsonlite)
library(remotes)
install_github("yonghah/esri2sf")
library(esri2sf)
library(ggplot2)
library(readr)
rm(list = ls())

mapTheme <- function(base_size = 12) {
  theme(
    text = element_text( color = "black"),
    plot.title = element_text(size = 14,colour = "black"),
    plot.subtitle=element_text(face="italic"),
    plot.caption=element_text(hjust=0),
    axis.ticks = element_blank(),
    panel.background = element_blank(),axis.title = element_blank(),
    axis.text = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(colour = "black", fill=NA, size=2)
  )
}

#philly_tracts <- st_read(
#  "/E:/30200/Philly3/Philly3.shp")


  
philly21 <- read_csv("E:/30200/phily21.csv")
austin20 <- read_csv("E:/30200/austin20.csv")
vegas19 <- read_csv("E:/30200/vegas19.csv")

d1 = vegas19 %>% filter(is_open == 0)
d2 = vegas19 %>% filter(is_open == 1)
d3 = philly21 %>% filter(is_open == 0)
d4 = philly21 %>% filter(is_open == 1)

d20_0 = austin20 %>% filter(is_open == 0)
d20_1 = austin20 %>% filter(is_open == 1)

library(mapview)
#%>% filter(is_open == 0), 

mapview(d20_0, layer.name = "closed", col.regions = "blue",  xcol = "longitude", ycol = "latitude", crs = 4269, grid = FALSE) + 
  mapview(d20_1,layer.name = "open", col.regions = "white",  xcol = "longitude", ycol = "latitude", crs = 4269, grid = FALSE)

mapview(d3, layer.name = "closed", col.regions = "blue",  xcol = "longitude", ycol = "latitude", crs = 4269, grid = FALSE) + 
  mapview(d4,layer.name = "open", col.regions = "white",  xcol = "longitude", ycol = "latitude", crs = 4269, grid = FALSE)


mapview(d1, layer.name = "closed", col.regions = "blue",  xcol = "longitude", ycol = "latitude", crs = 4269, grid = FALSE) + 
  mapview(d2, layer.name = "open", col.regions = "white",  xcol = "longitude", ycol = "latitude", crs = 4269, grid = FALSE)
  
