library(tmap)
tmap_mode("plot")

tm_shape(wheat.sf) +
    tm_polygons(c("Temp1922-1950", "Temp1951-1980", "Temp1981-2010")) +
    tm_facets(ncol = 3) + tm_layout(legend.show = FALSE)
