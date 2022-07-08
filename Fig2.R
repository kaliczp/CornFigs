library(sf)
library(tmap)
tmap_mode("plot")

TPrec8110 <- st_sf(R2 = wheat2.transform[,1], HunRegions)
TPrec8110$TimeWin <- "1981–2020"
TPrec8110$Param <- "TmeanPrec"

TPrecPET8110 <- st_sf(R2 = wheat2.transform[,2], HunRegions)
TPrecPET8110$TimeWin <- "1981–2020"
TPrecPET8110$Param <- "TmeanPrecPET"

TTmean8110 <- st_sf(R2 = wheat2.transform[,3], HunRegions)
TTmean8110$TimeWin <- "1981–2020"
TTmean8110$Param <- "Tmean"

Fig2 <- rbind(TPrec8110, TPrecPET8110, TTmean8110)
Fig2$TimeWin <- factor(Fig2$TimeWin, levels = unique(Fig2$TimeWin),  ordered=TRUE)
Fig2$Param <- factor(Fig2$Param, levels = unique(Fig2$Param),  ordered=TRUE)

tmap_options(legend.outside = TRUE, legend.stack = "horizontal", legend.outside.position = "bottom", legend.width = 1)

, legend.outside.size = 2)

tmap_options_reset()

Fig2.tm <- tm_shape(Fig2) +
    tm_fill("R2", palette = "Blues", breaks = seq(0,0.8,by=0.1)) +
    tm_borders() +
    tm_layout(panel.labels = c(expression(bold(Tmean[May-July]) + plain(Prec)),
                               expression(bold(Tmean[May-July]) + plain(Prec) - plain(PET)),
                               expression(bold(Tmean[May-July]) + plain(Tmean[Jan-March]))
                               ),
              panel.label.size = 0.7,
              legend.show = FALSE,
              frame = FALSE,
              frame.lwd = NA,
              panel.label.bg.color = NA,
              asp = 0) +
    tm_facets("Param", nrow = 1)

tmap_save(Fig2.tm, filename = "Fig2.png", height = 29/25.4, width = 174/25.4, asp = 0)
tmap_save(Fig2.tm, filename = "Fig2.eps", height = 29/25.4, width = 174/25.4, asp = 0)


