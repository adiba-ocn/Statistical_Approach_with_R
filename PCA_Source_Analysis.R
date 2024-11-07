library(readxl)
library(FactoMineR)
library(factoextra)
library(ggplot2)

# Load the data from the second sheet of your Excel file and PCA analysis
pca_data <- Heavy_metal_Data
pca_data_2<-pca_data [,2:14]
pca_result <- prcomp(pca_data_2, center = TRUE, scale. = TRUE)

# Perform PCA on the dataset
#pca_result <- PCA(pca_data_2, graph = FALSE)

# PCA summary and screeplot
summary(pca_result)
screeplot(pca_result, cex.main=1.5, cex.lab=1.5, cex.axis=1.2)  # Increase label size

# Attributes and print the result
attributes(pca_result)
print(pca_result)

# Calculate explained variance
var1 <- round(pca_result$sdev[1]^2/sum(pca_result$sdev^2)*100, 2)
var2 <- round(pca_result$sdev[2]^2/sum(pca_result$sdev^2)*100, 2)
var3 <- round(pca_result$sdev[3]^2/sum(pca_result$sdev^2)*100, 2)

#Biplot visualization
fviz_eig(pca_result, addlebels= TRUE, ylim= c(0,50))
fviz_eig(pca_result, repel= TRUE, col.var= "blue")
fviz_pca_biplot(pca_result, repel= TRUE, col.var = "blue", col.ind="red")






# Basic plot with larger labels
plot(pca_result, main="PCA Result", 
     cex.main=1.5,      # Title size
     cex.lab=1.5,       # Axis label size
     cex.axis=1.2)      # Axis tick size

# factoextra plot with larger labels
library("factoextra")
library(ggplot2)
fviz_eig(pca_result, 
         labelsize=14,   # Increase label size
         main="Screeplot",
         xlab="Dimensions",    # X-axis label
         ylab="Percentage of explained variance",    # Y-axis label
         cex.main=3,             # Size of main title
         cex.lab=5,            # Size of axis labels
         cex.axis=5)


# Biplot with larger labels
biplot(pca_result, cex=1.5)  # Increase label size on biplot

# ggfortify plot with larger labels
library("ggfortify")
autoplot(pca_result, data=pca_data_2,
         loadings=TRUE, loadings.color="blue", 
         loadings.label=TRUE, loadings.label.size=7,  # Increase loadings label size
         label.size=8,   # Increase point label size
         main="PCA Biplot")  # Title


