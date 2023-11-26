library(sf)
library(tmap)
tmap_mode("plot")

TTmean8110 <- st_sf(R2 = wheat2.transform[,3], HunRegions)
TTmean8110$TimeWin <- "1981–2020"
TTmean8110$Param <- "Tmean"

tti <- 1
TmeanPrecMaize <- st_sf(R2 = Fig4.ok[,tti], HunRegions)
TmeanPrecMaize$TimeWin <- Fig4.raw[tti, "Date"]
TmeanPrecMaize$Param <- Fig4.raw[tti, "Param"]


Fig2 <- rbind(TTmean8110, TmeanPrecMaize)
Fig2$TimeWin <- factor(Fig2$TimeWin, levels = unique(Fig2$TimeWin),  ordered=TRUE)
Fig2$Param <- factor(Fig2$Param, levels = unique(Fig2$Param),  ordered=TRUE)

Fig2[7,"R2"] <- 0.75

Fig2$R2 <- Fig2$R2 * -1

tmap_options(legend.outside = TRUE, legend.stack = "horizontal", legend.outside.position = "bottom", legend.width = 1)

# tmap_options_reset()

## Korábban Fig2, azután Fig4Legendjav, majd a cikkben Fig3
Fig2.tm <- tm_shape(Fig2) +
    tm_fill("R2", breaks = seq(-0.8,0.8,by=0.1)) +
    tm_borders() +
    tm_layout(panel.labels = c(
                  expression(bold(Tmean[May-July]) + plain(Tmean[Jan-March] ~ Wheat)),
                  expression(bold(Tmean[May-Aug]) + plain(Prec[May-Aug] ~ Maize))
                  ),
              panel.label.size = 0.7,
              legend.show = FALSE,
              frame = FALSE,
              frame.lwd = NA,
              panel.label.bg.color = NA,
              asp = 0) +
    tm_facets("Param", nrow = 1)

tmap_save(Fig2.tm, filename = "Combined.png", height = 29/25.4, width = 116/25.4, asp = 0)
tmap_save(Fig2.tm, filename = "Combined.eps", height = 35/25.4, width = 90/25.4, asp = 0)
