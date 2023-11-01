# This code is from the mixOmics vignette

library(mixOmics)


browseVignettes("mixOmics")


MyPalette = c("#DE2B9D","#2ca0e1","#a9c926") 


Proteins <- read.csv("Proteins_original_values_for_PLSDA.txt",row.names = 1, header=TRUE,sep="\t" ) 

X <- Proteins[,-1] # First column contains group information

Y <- Proteins[,1]

results <- plsda(X,Y, ncomp = 5)


plotIndiv(results, ind.names = FALSE, legend=TRUE,
          comp=c(1,2), ellipse = TRUE, col.per.group= MyPalette,
          title = 'Proteins',
          X.label = 'comp 1', Y.label = 'comp 2')

