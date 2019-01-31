# Load and visualize the cards as a DataFrame
deck <- read.csv("deck.csv", stringsAsFactors=FALSE)
# Make pristine copy of the deck
# deck2 <-  deck
# Funtcion to deal a card from the deck
shuffle <- function (cards) {
  # Random indices to shuffle the cards
  randomIndices <- sample(1:length(cards), size = length(cards))
  cards[randomIndices, ]
}
# Deal the topmost card of the deck
deal <- function (cards) {
  cards[1, ]
}

# Set a deck to play hearts
# All cards have 0 value
# Except the hearts whose value is 1
# And the queen of spades whose value is 13
setHearts <- function (cards) {
  cards$value <- 0
  hearts <- cards$suit == "hearts"
  cards$value[hearts] <- 1
  queenOfSpades <- cards$suit == "spades" & cards$face == "queen"
  cards$value[queenOfSpades] <- 13
  cards
}

# Set a deck to play War
# All the aces have 14 value
setWar <- function (cards) {
  aces <- cards$face == "ace"
  cards$value[aces] <- 14
  cards
}

# Set a deck to play BlackJack
# All the aces have NA value
# All the face cards have 10 value
# The rest have the numerical value
setBlackJack <- function (cards) {
  royals <- cards$face == "king" | cards$face == "queen" | cards$face == "jack"
  cards$value[royals] <- 10
  aces <- cards$face == "ace"
  cards$value[aces] <- NA
  cards
}
