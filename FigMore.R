library(grid)
library(tmap)
tmap_mode("plot")

T2250 <- tm_shape(wheat.sf) +
    tm_polygons("Temp1922-1950") +
    tm_layout(legend.show = FALSE)

T5180 <- tm_shape(wheat.sf) +
    tm_polygons("Temp1951-1980") +
    tm_layout(legend.show = FALSE)

T8110 <- tm_shape(wheat.sf) +
    tm_polygons("Temp1981-2010") +
    tm_layout(legend.show = TRUE, legend.position = c("right", "bottom"))

grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 3)))
print(T2250, vp = viewport(layout.pos.col = 1))
print(T5180, vp = viewport(layout.pos.col = 2))
print(T8110, vp = viewport(layout.pos.col = 3))
