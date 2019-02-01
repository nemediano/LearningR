# Uses closure to simulate a class
CreateDeck <- function(deck) {
  # Here deck will become a "member variable", since it is pass by copy to the function
  
  # Keep a pristine copy of the original set of cards.
  # Another member variable
  ORIGINAL <- deck
  
  # A method
  # Removes and returns the top most card of the current deck
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  # A method
  # Shuffles the currents cards on the deck
  SHUFFLE <- function() {
    # Generates a vector of random indices
    random <- sample(1:nrow(deck), size = nrow(deck))
    # Shuffles the deck
    assign("deck", deck[random, ], envir = parent.env(environment()))
  }
  
  # A method
  # Set the value of the remaining cards on deck to play War
  SET_WAR <- function() {
    tmpCopy <- deck
    aces <- tmpCopy$face == "ace"
    # This should work by enviroment resolution rules
    tmpCopy$value[aces] <- 14
    assign("deck", tmpCopy, envir = parent.env(environment()))
  }
  
  # A method
  # Set the value of the remaining cards on deck to play Hearths
  SET_HEARTHS <- function() {
    tmpCopy <- deck
    tmpCopy$value <- 0
    hearts <- tmpCopy$suit == "hearts"
    tmpCopy$value[hearts] <- 1
    queenOfSpades <- tmpCopy$suit == "spades" & tmpCopy$face == "queen"
    tmpCopy$value[queenOfSpades] <- 13
    assign("deck", tmpCopy, envir = parent.env(environment()))
  }
  
  # A method
  # Set the value of the remaining cards on deck to play BlackJack
  SET_BLACKJACK <- function() {
    royals <- deck$face == "king" | deck$face == "queen" | deck$face == "jack"
    deck$value[royals] <- 10
    aces <- deckface == "ace"
    deck$value[aces] <- NA
  }
  
  # A method
  # Reset the current deck to the initial pristine copy
  RESET <- function() {
    assign("deck", ORIGINAL, envir = parent.env(environment()))
  }
  
  # All methods are private "by default", to make them public we need to expose them here
  list(deal = DEAL, shuffle = SHUFFLE, setWar = SET_WAR, setHearths = SET_HEARTHS, setBlackJack = SET_BLACKJACK,
       reset = RESET)
}