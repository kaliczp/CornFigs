library(sf)
library(tmap)
tmap_mode("plot")

First <- st_sf(R2 = wheat2.transform[,4], HunRegions)
First$TimeWin <- "1922-1950"
First$Param <- "TmeanPrec"

Secnd <- st_sf(R2 = wheat2.transform[,5], HunRegions)
Secnd$TimeWin <- "1922-1950"
Secnd$Param <- "TmeanTean"

Third <- st_sf(R2 = wheat2.transform[,6], HunRegions)
Third$TimeWin <- "1951-1980"
Third$Param <- "TmeanPrec"

Fourth <- st_sf(R2 = wheat2.transform[,7], HunRegions)
Fourth$TimeWin <- "1951-1980"
Fourth$Param <- "TmeanTean"

FigS1 <- rbind(First, Secnd, Third, Fourth)
FigS1$TimeWin <- factor(FigS1$TimeWin, levels = unique(FigS1$TimeWin),  ordered=TRUE)
FigS1$Param <- factor(FigS1$Param, levels = unique(FigS1$Param),  ordered=TRUE)

FigS1.tm <- tm_shape(FigS1) +
    tm_fill("R2", palette = "Blues", breaks = seq(0,0.8,by=0.1), legend.is.portrait = FALSE) +
    tm_borders() +
    tm_layout(title = c(expression(bold(plain(Prec))),expression(bold(Tmean[Jan-March])),"",""),
              title.position = c("center","top"), title.size = 0.9,
              frame = FALSE,
              frame.lwd = NA,
              panel.labels = list(c("1922-1950", "1951-1980"),
                                  c(expression(bold(Tmean[May-July] + ldots)),expression(plain(Tmean[May-July] + ldots)))),
              panel.label.bg.color = NA,
              panel.label.size = 1,
              legend.show = FALSE,
              asp = 0) +
    tm_facets(c("TimeWin", "Param"), ncol = 2)

tmap_save(FigS1.tm, filename = "FigS1.png", height = 80/25.4, width = 84/25.4, asp = 0)
tmap_save(FigS1.tm, filename = "FigS1.eps", height = 80/25.4, width = 84/25.4, asp = 0)


