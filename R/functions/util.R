#==============================================================================
# File: util.R
# Author: A. Pucher
# Purpose: Various helpful functions, e.g. normalization.
#==============================================================================

# Normalize function
# Check: https://vitalflux.com/data-science-scale-normalize-numeric-data-using-r/
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# Alternatively, use Z-score standardization
# e.g. dfNormZ <- as.data.frame( scale(df[1:2] ))