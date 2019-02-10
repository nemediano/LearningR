#Simple batch to analize of the slot machine
#A vector that contain each possible output of each event
wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
#Since we have three independent events (thee wheel spin per play)
#Generate the list of all experiments
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
#these are the probablities of each outcome per event
prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, 
          "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)
# now we update the data frame with the probability of each outcome
combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]
# Since they are independen event the probability of each experiment
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3
# Sum the probabilities of each event. Just to be sure
# This should be one
print(sum(combos$prob))
# Add new column to store the reward of each experiment
combos$prize <- NA
# Now fill the prize
for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
# Expected value or payout rate
payout_rate <- sum(combos$prize * combos$prob)
