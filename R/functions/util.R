#==============================================================================
# File: util.R
# Author: A. Pucher
# Purpose: Various helpful functions, e.g. normalization, cleaning tweets...
#==============================================================================

# Normalize function
# Check: https://vitalflux.com/data-science-scale-normalize-numeric-data-using-r/

# Alternatively, use Z-score standardization
# e.g. dfNormZ <- as.data.frame( scale(df[1:2] ))
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
  
}

# Pre-clean the tweet for sentiment analysis
cleanTweets<- function(tweet){
  # remove html links, which are not required for sentiment analysis
  tweet = gsub("(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", " ", tweet)
  # Note: atm we want retweets...
  # First we will remove retweet entities from the stored tweets (text)
  # tweet = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ", tweet) 
  # Then remove all "#Hashtag"
  tweet = gsub("#\\w+", " ", tweet) 
  # Then remove all "@people"
  tweet = gsub("@\\w+", " ", tweet)
  # Then remove all the punctuation
  tweet = gsub("[[:punct:]]", " ", tweet)
  # Then remove numbers, we need only text for analytics
  tweet = gsub("[[:digit:]]", " ", tweet)
  # finally, we remove unnecessary spaces (white spaces, tabs etc)
  tweet = gsub("[ \t]{2,}", " ", tweet)
  tweet = gsub("^\\s+|\\s+$", "", tweet)
  # Anything else to remove, e.g. "slang words" using the above methods.
  # ...
  
}
  