wheat2 <- read.table("Wheat2.txt", sep = ";", head = TRUE)
wheat2.transform <- t(wheat2[,-c(1,2)])

wheat2ok <- wheat2.transform[,1:3]

## Fig 3

Fig3.raw <- read.table("Fig5exFig3.csv", sep = ";", head = TRUE)
Fig3.ok <- t(Fig3.raw[,-c(1,2)])

## Fig 4

Fig4.raw <- read.table("Fig4.txt", sep = ";", head = TRUE)
## Manipulation to make figure matrix
Fig4.raw[3:4, "Date"] <- "1981-2011"
Fig4.raw[3:4, "Param"] <- Fig4.raw[1:2, "Param"]
Fig4.ok <- t(Fig4.raw[,-c(1,2)])
