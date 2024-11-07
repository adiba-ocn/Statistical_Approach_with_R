# Install necessary packages if you haven't already
install.packages("readxl")
install.packages("ggdendro")  # for a more visually appealing dendrogram

# Load required libraries
library(readxl)
library(stats)     # for hclust and dist functions
library(ggdendro)  # for plotting dendrogram using ggplot2

# Step 1: Load Excel Data
cluster_data<-(Nutrient_Dynamics_KE)
cluster_data_2<-pca_data#[,1:14]

# Step 2: Data Preprocessing
# Ensure the data contains only numerical values
numeric_data <- cluster_data_2[, sapply(cluster_data_2, is.numeric)]  # Keep only numeric columns

# Step 3: Compute Hierarchical Clustering
# Calculate distance matrix (Euclidean by default)
dist_matrix <- dist(numeric_data)

# Perform hierarchical clustering
hc <- hclust(dist_matrix, method = "average")  # You can use 'average', 'single', etc.

# Step 4: Plot the Dendrogram
# Simple base R plot with larger labels
plot(hc, main = "Dendrogram", 
     xlab = "Samples", 
     sub = "", 
     ylab = "Height", 
     cex.main = 1.5,  # Increase title size
     cex.lab = 1.5,   # Increase axis label size
     cex.axis = 1.2,  # Increase axis tick label size
     cex = 1.2)       # Increase the size of leaf labels

# Optional: Enhanced ggplot2-based dendrogram for better visuals
ggdendrogram(hc, rotate = TRUE, theme_dendro = TRUE) +
  theme(
    axis.text = element_text(size = 14),   # Increase size of axis text (leaf labels)
    axis.title = element_text(size = 16),  # Increase size of axis titles
    plot.title = element_text(size = 18)   # Increase size of plot title
  ) +
  labs(title = "HCA Analysis", x = "Samples", y = "Height")  # Add larger title and axis labels

# Print the hierarchical clustering result
print(hc)
