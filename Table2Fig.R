library(readxl)
Table2raw <- as.data.frame(read_excel("Table2Fig.xlsx"))
T2 <- as.data.frame(matrix(as.numeric(unlist(strsplit(x = Table2raw[,2], split = "±"))), ncol = 2, byrow = TRUE))
colnames(T2) <- c("Mean", "SD")
T2 <- cbind(Years = "1921-1950", T2)
ttnew <- as.data.frame(matrix(as.numeric(unlist(strsplit(x = Table2raw[,3], split = "±"))), ncol = 2, byrow = TRUE))
colnames(ttnew) <- c("Mean", "SD")
ttnew <- cbind(Years = "1951-1980", ttnew)
T2 <- rbind(T2, ttnew)
ttnew <- as.data.frame(matrix(as.numeric(unlist(strsplit(x = Table2raw[,4], split = "±"))), ncol = 2, byrow = TRUE))
colnames(ttnew) <- c("Mean", "SD")
ttnew <- cbind(Years = "1981-2010", ttnew)
T2 <- rbind(T2, ttnew)
ttnew <- as.data.frame(matrix(as.numeric(unlist(strsplit(x = Table2raw[,5], split = "±"))), ncol = 2, byrow = TRUE))
colnames(ttnew) <- c("Mean", "SD")
ttnew <- cbind(Years = "1921-1950", ttnew)
T2 <- rbind(T2, ttnew)
ttnew <- as.data.frame(matrix(as.numeric(unlist(strsplit(x = Table2raw[,6], split = "±"))), ncol = 2, byrow = TRUE))
colnames(ttnew) <- c("Mean", "SD")
ttnew <- cbind(Years = "1951-1980", ttnew)
T2 <- rbind(T2, ttnew)
ttnew <- as.data.frame(matrix(as.numeric(unlist(strsplit(x = Table2raw[,7], split = "±"))), ncol = 2, byrow = TRUE))
colnames(ttnew) <- c("Mean", "SD")
ttnew <- cbind(Years = "1981-2010", ttnew)
T2 <- rbind(T2, ttnew)

T2 <- cbind(Land = c("HP", "TL", "TH", "H"), T2)
T2 <- cbind(Param = rep(c("Wheat", "MeanTemp", "PrecFeb", "PrecPETFeb",
                          "Maize", "MaxTemp","PrecMay", "PrecPETMay"), each = 4), T2)

T2$Param <- factor(T2$Param, levels = unique(T2$Param), ordered = TRUE)
T2$Land <- factor(T2$Land, levels = unique(T2$Land), ordered = TRUE)
T2$Years <- factor(T2$Years, levels = unique(T2$Years), ordered = TRUE)

library(ggplot2)

gg <- ggplot(T2, aes(x=Years, y=Mean)) +
    geom_errorbar(aes(ymin = Mean - SD,
                      ymax = Mean + SD)) +
    geom_point() +
    facet_grid(Param ~ Land, scales = "free") +
    theme_classic()

pdf(file = "Table2Fig.pdf")
gg
dev.off()
