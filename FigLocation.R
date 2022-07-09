library(tmap)
data("World")

World$Hun  <-  0
World[World$name == "Hungary","Hun"]  <-  1
World$Hun  <-  as.logical(World$Hun)

tm_shape(World, projection = 3035, bbox = st_bbox(c(xmin = 19.3 - 70, xmax = 19.3 + 70, ymax = 47 + 40, ymin = 47 - 40), crs = 4326) ) +
    tm_polygons("Hun") +
    tm_graticules()

