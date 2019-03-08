#Load main package for the graph viz
library(tidyverse)
# Create a simple graph with the mpg dataset
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
# Map categorical value to color class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
# Map categorical variable to continuos parameter
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
# Use more correct aestetics to do the same
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# Use custom change that make more beauty, but no extra info
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
