# Load package for using qplot
library("ggplot2")
# Create rool function to simulate dice rolling
roll <- function(die = 1:6) {
  # Create a weight function to make die unfair
  w <- c(rep(1, length(die) - 1), 3)
  w <- w / sum(w)
  # Roll a pair of dice
  dice <- sample(die, size = 2, replace = TRUE, prob = w)
  # Return the sum 
  sum(dice)
}

# Make an experiment anr rool our unfair dice 10000 times
rolls <- replicate(10000, expr = roll())
# Create a histogram of the resulting numbers
histogram <- qplot(rolls, binwidth = 1)
# Print the plot into the output (in source mode thi si not automatically)
print(histogram)