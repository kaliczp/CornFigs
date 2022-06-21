library(sf)
library(tmap)
tmap_mode("plot")

T2250 <- st_sf(R2 = wheat.transform[,1], HunRegions)
T2250$TimeWin <- "1922–1950"
T2250$Param <- "Tmean"

T5180 <- st_sf(R2 = wheat.transform[,2], HunRegions)
T5180$TimeWin <- "1951–1980"
T5180$Param <- "Tmean"

T8110 <- st_sf(R2 = wheat.transform[,3], HunRegions)
T8110$TimeWin <- "1981–2010"
T8110$Param <- "Tmean"

Tm2250 <- st_sf(R2 = wheat.transform[,4], HunRegions)
Tm2250$TimeWin <- "1922–1950"
Tm2250$Param <- "Tmax"

Tm5180 <- st_sf(R2 = wheat.transform[,5], HunRegions)
Tm5180$TimeWin <- "1951–1980"
Tm5180$Param <- "Tmax"

Tm8110 <- st_sf(R2 = wheat.transform[,6], HunRegions)
Tm8110$TimeWin <- "1981–2010"
Tm8110$Param <- "Tmax"


Fig1 <- rbind(T2250, T5180, T8110, Tm2250, Tm5180, Tm8110)
Fig1$TimeWin <- factor(Fig1$TimeWin, levels = unique(Fig1$TimeWin),  ordered=TRUE)

Fig1.tm <- tm_shape(Fig1) +
    tm_fill("R2", breaks = seq(-0.8,0.8,by=0.1), legend.is.portrait = FALSE) +
    tm_borders() +
    tm_layout(legend.outside = TRUE,
              frame = FALSE,
              frame.lwd = NA,
              panel.label.bg.color = NA,
              legend.show = FALSE,
              asp = 0) +
    tm_facets(c("TimeWin", "Param"), ncol = 2)

tmap_save(Fig1.tm, filename = "Fig1.png", height = 80/25.4, width = 84/25.4, asp = 0)
tmap_save(Fig1.tm, filename = "Fig1.eps", height = 80/25.4, width = 84/25.4, asp = 0)
