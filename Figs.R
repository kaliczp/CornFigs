# http://www.gadm.org/
wheat <- read.table("Wheat.txt", sep = ";", head = TRUE)
library(sf)
Hungary <- st_read("gadm/gadm40_HUN_1.shp")
plot(Hungary[,"NAME_1"])

megye_names <- Hungary[,"NAME_1", drop = TRUE]

Mountains <- st_union(Hungary[
    megye_names == "Borsod-Abaúj-Zemplén" |
    megye_names == "Nógrád" |
    megye_names == "Heves"
   ,"NAME_1"]
    )

Transdanubia_Hills <- st_union(Hungary[
    megye_names == "Komárom-Esztergom" |
    megye_names == "Pest" |
    megye_names == "Budapest" |
    megye_names == "Vas" |
    megye_names == "Veszprém" |
    megye_names == "Zala"
   ,"NAME_1"]
    )

Hungarian_Plain <- st_union(Hungary[
    megye_names == "Szabolcs-Szatmár-Bereg" |
    megye_names == "Hajdú-Bihar" |
    megye_names == "Jász-Nagykun-Szolnok" |
    megye_names == "Bács-Kiskun" |
    megye_names == "Békés" |
    megye_names == "Csongrád"
   ,"NAME_1"]
    )

Transdanubia_Lowlands <- st_union(Hungary[
    megye_names == "Fejér" |
    megye_names == "Gyor-Moson-Sopron" |
    megye_names == "Somogy" |
    megye_names == "Baranya" |
    megye_names == "Tolna"
   ,"NAME_1"]
    )

HunRegions <- c(Hungarian_Plain, Transdanubia_Lowlands, Transdanubia_Hills, Mountains)

wheat.transform <- t(wheat[,-1])
colnames(wheat.transform) <- c("Temp1922-1950",
                               "Temp1951-1980",
                               "Temp1981-2010",
                               "ET1981-2010")

wheat.sf <- st_sf(wheat.transform, HunRegions)
row.names(wheat.sf) <- c("Hungarian_Plain",
                         "Transdanubia_Lowlands",
                         "Transdanubia_Hills",
                         "Mountains")

pdf(height=4.3)
par(oma = c(0, 1.5, 0, 1), las = 1)
plot(wheat.sf[,1], main = "Temperature 1922-1950", axes = TRUE, graticule = TRUE)
dev.off()
