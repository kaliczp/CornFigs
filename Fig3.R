## Fig. 5 now
library(sf)
library(tmap)
tmap_mode("plot")

Fig3.collect <- list()
for(tti in 1:ncol(Fig3.ok)) {
    Fig3.collect[[tti]] <- st_sf(R2 = Fig3.ok[,tti], HunRegions)
    Fig3.collect[[tti]]$TimeWin <- Fig3.raw[tti, "Date"]
    Fig3.collect[[tti]]$Param <- Fig3.raw[tti, "Param"]
}

Fig3full <- rbind(Fig3.collect[[1]], Fig3.collect[[2]])
for(tti in 3:length(Fig3.collect))
    Fig3full <- rbind(Fig3full, Fig3.collect[[tti]])

Fig3full$TimeWin <- factor(Fig3full$TimeWin, levels = unique(Fig3full$TimeWin),  ordered=TRUE)
Fig3full$Param <- factor(Fig3full$Param, levels = unique(Fig3full$Param),  ordered=TRUE)

Fig3full.tm <- tm_shape(Fig3full) +
    tm_fill("R2", breaks = seq(-0.8,0.8,by=0.1), legend.is.portrait = FALSE) +
    tm_borders() +
    tm_layout(frame = FALSE,
              frame.lwd = NA,
              panel.label.bg.color = NA,
              panel.labels = list(c("1921-1950", "1951-1980", "1981-2010"),
                                  c(expression(plain(Prec)),
                                    expression(plain(Prec) - plain( PET)))
                                  ),
              legend.show = FALSE,
              asp = 0) +
    tm_facets(c("TimeWin", "Param"), ncol = 2)

tmap_save(Fig3full.tm, filename = "Fig3full.png", height = 80/25.4, width = 84/25.4, asp = 0)
tmap_save(Fig3full.tm, filename = "Fig3full.eps", height = 80/25.4, width = 84/25.4, asp = 0)


