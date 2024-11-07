# Install packages if not already installed
if (!require("openair")) install.packages("openair")
if (!require("fields")) install.packages("fields")
if (!require("plotrix")) install.packages("plotrix")

# Load libraries
library(openair)
library(fields)
library(plotrix)

# Example observed and model data
obs <- c(...)  # Replace with your observed data
mod <- c(...)  # Replace with your model data

# Extract the value columns (assuming the data frame has a column named "Value")
obs_value <- obs_data$Variable
mod_values <- mod_data$Variable


# Check lengths and remove NA values
obs <- na.omit(obs)
mod <- na.omit(mod)

# Create a data frame for the Taylor diagram function
data <- data.frame(observed = obs, model = mod)

# Taylor diagram plotting
taylorDiagram(data, obs = "observed", mod = "model",
              main = "Taylor Diagram",
              show.gamma = TRUE,
              sd.arcs = TRUE,
              col = "blue", pch = 19,
              annotate = "RMSE", # Annotation type
              key = list(space = "right", columns = 1, cex = 1.5), # External legend
              cex.axis = 1.2,  # Axis label size
              cex.lab = 1.2,   # Axis title size
              cex.main = 1.5,  # Main title size
              col.key = "darkred") # Key color

# Calculate observed standard deviation
obs_sd <- sd(obs)
mod_sd<- sd(mod)

# Add the observed point at the intersection (standard deviation of observed data and correlation of 1)
points(x = obs_sd, y = 0, pch = 19, col = "red", cex = 1.5)  # Change color and shape as needed

# Optional additional styling
legend("topright", legend = c("Model vs Observed", "Observed Point"),
       col = c("blue", "red"), pch = c(19, 4), cex = 1.5, bty = "n")

