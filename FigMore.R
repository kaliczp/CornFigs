library(sf)
library(tmap)
tmap_mode("plot")

T2250 <- st_sf(R2 = wheat.transform[,1], HunRegions)
T2250$TimeWin <- "Tmean 1922-1950"

T5180 <- st_sf(R2 = wheat.transform[,2], HunRegions)
T5180$TimeWin <- "Tmean 1951-1980"

T8110 <- st_sf(R2 = wheat.transform[,3], HunRegions)
T8110$TimeWin <- "Tmean 1981-2010"

Tm2250 <- st_sf(R2 = wheat.transform[,4], HunRegions)
Tm2250$TimeWin <- "Tmax 1922-1950"

Tm5180 <- st_sf(R2 = wheat.transform[,5], HunRegions)
Tm5180$TimeWin <- "Tmax 1951-1980"

Tm8110 <- st_sf(R2 = wheat.transform[,6], HunRegions)
Tm8110$TimeWin <- "Tmax 1981-2010"


Fig1 <- rbind(T2250, T5180, T8110, Tm2250, Tm5180, Tm8110)
Fig1$TimeWin <- factor(Fig1$TimeWin, levels = unique(Fig1$TimeWin),  ordered=TRUE)

Fig1.tm <- tm_shape(Fig1) +
    tm_fill("R2", breaks = seq(-0.8,0.8,by=0.1)) +
    tm_borders() +
    tm_layout(legend.outside = TRUE) + 
    tm_facets("TimeWin", nrow = 2)

tmap_save(Fig1.tm, filename = "Fig1.png", height = 4, width = 5, asp = 0)
