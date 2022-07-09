library(tmap)
data("World")

tm_shape(World, projection = 3035, bbox = st_bbox(c(xmin = 16 - 60, xmax = 16 + 60, ymax = 46 + 40, ymin = 46 - 40), crs = 4326) ) +
    tm_polygons("white") +
    tm_graticules()

