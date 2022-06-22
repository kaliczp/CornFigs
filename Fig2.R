library(sf)
library(tmap)
tmap_mode("plot")

TPrec8110 <- st_sf(R2 = wheat2.transform[,1], HunRegions)
TPrec8110$TimeWin <- "TmeanPrec"

TPrecPET8110 <- st_sf(R2 = wheat2.transform[,2], HunRegions)
TPrecPET8110$TimeWin <- "TmeanPrecPET"

TTmean8110 <- st_sf(R2 = wheat2.transform[,3], HunRegions)
TTmean8110$TimeWin <- "Tmean"

Fig2 <- rbind(TPrec8110, TPrecPET8110, TTmean8110)
Fig2$TimeWin <- factor(Fig2$TimeWin, levels = unique(Fig2$TimeWin),  ordered=TRUE)

tmap_options(legend.outside = TRUE, legend.stack = "horizontal", legend.outside.position = "bottom", legend.width = 1)

, legend.outside.size = 2)

tmap_options_reset()

Fig2.tm <- tm_shape(Fig2) +
    tm_fill("R2", breaks = seq(-0.8,0.8,by=0.1)) +
    tm_borders() +
    tm_layout(main.title = "TmeanMay-July + ", #expression(bold(Teszt)),
              main.title.position = "center",
              panel.labels = c(expression(plain(Prec)), expression(plain(Prec-PET)), expression(plain(Tmean[Jan-March]))),
              legend.show = FALSE,
              frame = FALSE,
              frame.lwd = NA,
              panel.label.bg.color = NA,
              asp = 0) +
    tm_facets("TimeWin", nrow = 1)

tmap_save(Fig2.tm, filename = "Fig2.png", height = 25/25.4, width = 84/25.4, asp = 0)
