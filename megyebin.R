MegyeNevek.mat <- matrix(c("BA", "Baranya megye", 
, "BÁ", "Bács-Kiskun megye"
, "BÉ", "Békés megye"
, "BO", "Borsod-Abaúj-Zemplén megye"
, "BP", "Budapest"
, "CS", "Csongrád megye"
, "FE", "Fejér megye"
, "GY", "Győr-Moson-Sopron megye"
, "HA", "Hajdú-Bihar megye"
, "HE", "Heves megye"
, "JÁ", "Jász-Nagykun-Szolnok megye"
, "KO", "Komárom-Esztergom megye"
, "NÓ", "Nógrád megye"
, "PE", "Pest megye"
, "SÓ", "Somogy megye"
, "SZ", "Szabolcs-Szatmár-Bereg megye"
, "TO", "Tolna megye"
, "VA", "Vas megye"
, "VE", "Veszprém megye"
, "ZA", "Zala megye "), nrow=2)

canton_coords <- structure(
    list(abbrev = MegyeNevek.mat[1,-5],
         hu_name = MegyeNevek.mat[2,-5],
         col = c(3L,4L,6L,6L,5L,3L,1L,6L,5L,5L,2L,4L,4L,2L,7L,3L,1L,2L,1L),
         row = c(4L,4L,4L,2L,4L,2L,1L,3L,2L,3L,2L,2L,3L,4L,2L,3L,2L,3L,3L)),
                     .Names = c("abbrev", "hu_name", "col", "row"),
                     class = "data.frame",
                     row.names = c(NA,-19L))

## Source KSH https://www.ksh.hu/docs/hun/xftp/roviditesek.pdf

cantonbins <- function(canton_data, canton_col="abbrev", value_col="value",
                     text_color="black", font_size=3,
                     canton_border_col="white", labels=1:5,
                     brewer_pal="PuBu", plot_title="",
                     plot_subtitle="", plot_caption="") {
    require(ggplot2)
    require(RColorBrewer)
    require(hrbrthemes)

  # Reformat canton_data into a data frame without factors
  # and merge with canton_coords on abbrev key
  canton_data <- data.frame(canton_data, stringsAsFactors=FALSE)
  merge.x <- "abbrev"
  ct.dat <- merge(canton_coords, canton_data,
                  by.x=merge.x, by.y=canton_col, all.y=TRUE)

  # Create tile plot
  gg <- ggplot(ct.dat, aes_string(x="col", y="row", label="abbrev"))
  gg <- gg + geom_tile(aes_string(fill=value_col))
  gg <- gg + geom_tile(color=canton_border_col, aes_string(fill=value_col),
                       size=2, show.legend =FALSE)
  gg <- gg + geom_text(color=text_color, size=font_size)
  
  # Add title
  gg <- gg + labs(title=plot_title, subtitle=plot_subtitle,
                  caption=plot_caption)
  
  # Set scales and coordinates system
  gg <- gg + scale_y_reverse()
  gg <- gg + scale_fill_gradientn(colours = brewer.pal(6, brewer_pal))
  gg <- gg + coord_equal()
  
  # Set minimal theme and remove axis titles, border, grid, 
  # background, axis ticks and axis text
  gg <- gg + theme_ipsum_rc()
  gg <- gg + labs(x=NULL, y=NULL)
  gg <- gg + theme(panel.border=element_blank())
  gg <- gg + theme(panel.grid=element_blank())
  gg <- gg + theme(panel.background=element_blank())
  gg <- gg + theme(axis.ticks=element_blank())
  gg <- gg + theme(axis.text=element_blank())

  return(gg)
}


teszt <- data.frame(abbrev = MegyeNevek.mat[1,-5], value = rnorm(ncol(MegyeNevek.mat)-1))
