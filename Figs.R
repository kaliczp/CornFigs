# http://www.gadm.org/
wheat <- read.table("Wheat.txt", sep = ";", head = TRUE)
library(sf)
Hungary <- st_read("gadm/gadm40_HUN_1.shp")
plot(Hungary[,"NAME_1"])
