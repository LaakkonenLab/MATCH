# This code is from mixOmics vignette

library(mixOmics)

browseVignettes("mixOmics")

hdl <- read.csv("HDLs.csv",row.names = 1, header=TRUE)  # load lipid data
prot <- read.csv("proteins.txt",row.names = 1, header=TRUE, sep="\t")  # load protein data



X <- list(lipid = hdl,
          protein = prot)

Y <- Group  # PRE, PERI, or POST group corresponding to each sample


# block PLSDA

MyResult.diablo <- block.plsda(X, Y)
plotVar(MyResult.diablo)


# sparse PLSDA

list.keepX <- list(lipid = c(10, 10),  protein = c(10, 10))

MyResult.diablo2 <- block.splsda(X, Y, keepX=list.keepX)

plotIndiv(MyResult.diablo2)


# plot correlation circle

plotVar(MyResult.diablo2, var.names = c(TRUE,  TRUE),
        legend=TRUE, pch=c(16,16))


# plot CIM heatmap

cimDiablo(MyResult.diablo2, color.blocks = c('darkorchid',  'lightgreen'), comp = 1, margin=c(8,20), legend.position = "right")


