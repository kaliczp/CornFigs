wheat2 <- read.table("Wheat2.txt", sep = ";", head = TRUE)
wheat2.transform <- t(wheat2[,-c(1,2)])

wheat2ok <- wheat2.transform[,1:3]

## Fig 3

Fig3.raw <- read.table("Fig3.txt", sep = ";", head = TRUE)
Fig3.ok <- t(Fig3.raw[,-c(1,2)])
