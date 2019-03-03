#Load main package for the graph viz
library(tidyverse)
# Create a simple graph with the mpg dataset
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))