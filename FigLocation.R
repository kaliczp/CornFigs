library(tmap)
data("World")

World$Hun  <-  0
World[World$name == "Hungary","Hun"]  <-  1
World$Hun  <-  as.logical(World$Hun)
Palette <- get_brewer_pal("PuOr", n = 3)
Palette <- Palette[c(2,1,3)]

FigLocationWorld.tm <-
tm_shape(World, projection = 3035, bbox = st_bbox(c(xmin = 19.3 - 30, xmax = 19.3 + 90, ymax = 47 + 30, ymin = 47 - 30), crs = 4326) ) +
    tm_layout(legend.show = FALSE) +
    tm_graticules() +
    tm_polygons("Hun", palette = Palette)

tmap_save(FigLocationWorld.tm, filename = "FigLocationWorld.png", height = 40/25.4, width = 84/25.4, asp = 0)
tmap_save(FigLocationWorld.tm, filename = "FigLocationWorld.eps", height = 40/25.4, width = 84/25.4, asp = 0)

