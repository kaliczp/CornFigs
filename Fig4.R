library(sf)
library(tmap)
tmap_mode("plot")

Fig4.collect <- list()
for(tti in 1:ncol(Fig4.ok)) {
    Fig4.collect[[tti]] <- st_sf(R2 = Fig4.ok[,tti], HunRegions)
    Fig4.collect[[tti]]$TimeWin <- Fig4.raw[tti, "Date"]
    Fig4.collect[[tti]]$Param <- Fig4.raw[tti, "Param"]
}

Fig4full <- rbind(Fig4.collect[[1]], Fig4.collect[[2]])
for(tti in 3:length(Fig4.collect))
    Fig4full <- rbind(Fig4full, Fig4.collect[[tti]])

Fig4full$TimeWin <- factor(Fig4full$TimeWin, levels = unique(Fig4full$TimeWin),  ordered=TRUE)
Fig4full$Param <- factor(Fig4full$Param, levels = unique(Fig4full$Param),  ordered=TRUE)

Fig4full.tm <- tm_shape(Fig4full) +
    tm_fill("R2", breaks = seq(0,0.8,by=0.1), legend.is.portrait = FALSE) +
    tm_borders() +
    tm_layout(frame = FALSE,
              frame.lwd = NA,
              panel.label.bg.color = NA,
              legend.show = FALSE,
              asp = 0) +
    tm_facets(c("TimeWin", "Param"), ncol = 2)

tmap_save(Fig4full.tm, filename = "Fig4.png", height = 80/25.4, width = 84/25.4, asp = 0)
tmap_save(Fig4full.tm, filename = "Fig4.eps", height = 80/25.4, width = 84/25.4, asp = 0)


