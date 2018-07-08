#==============================================================================
# File: auth.R
# Author: A. Pucher
# Purpose: Functions for getting access to Twitter and Facebook APIs,
#          authentication with keys and access tokens
# Comment: Check https://csgillespie.github.io/efficientR/r-startup.html#renviron
#==============================================================================

### All the keys and tokens are read from a file ".Renviron" from the project´s workarea, check the documentation (URL) mentioned above. 
### This mentioned file will not be published as it is private and confidential, hence it contains all the credentials.
### A parameter in ".Renviron" looks like this:
### tw_consumer_key = "secretxyz"

### Get access to TW
auth_twitter <- function() {
  
  require(twitteR)
  setup_twitter_oauth(Sys.getenv("tw_consumer_key"),
                      Sys.getenv("tw_consumer_secret"),
                      Sys.getenv("tw_access_token"),
                      Sys.getenv("tw_access_secret"))
}




### Get access to FB
auth_facebook <- function() {
  
  require(Rfacebook)
  
  # Set scope
  scope <- c("user_status","user_likes")
  
  # Set extended permission = true, for following permissions:
  # scope <- c("user_birthday", "user_hometown", "user_location", "user_relationships",
  # "publish_actions","user_status","user_likes")
  
  fb_oauth <- fbOAuth(app_id = Sys.getenv("fb_app_id"),
          app_secret = Sys.getenv("fb_app_secret"))
  
  # after authentication
  save(fb_oauth, file=".fb_oauth")
  load(".fb_oauth")
  
}