library(sf)
library(tmap)
tmap_mode("plot")

T2250 <- st_sf(wheat = wheat.transform[,1], HunRegions)
T2250$TimeWin <- "Tmean 1922-1950"

T5180 <- st_sf(wheat = wheat.transform[,2], HunRegions)
T5180$TimeWin <- "Tmean 1951-1980"

T8110 <- st_sf(wheat = wheat.transform[,3], HunRegions)
T8110$TimeWin <- "Tmean 1981-2010"

Wheat <- rbind(T2250, T5180, T8110)

tm_shape(Wheat) +
    tm_polygons("wheat") +
    tm_facets("TimeWin", nrow = 1)
