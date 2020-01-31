library(magrittr)

rm_pattern <- tm::content_transformer( 
  function (x, pattern) stringr::str_remove_all(string = x, pattern = pattern)
)

trim_both <- tm::content_transformer( 
  function (x) stringr::str_trim(string = x, side = "both")
)

clean_tweets <- function(tweet_text) {
  
  tweet_text_lwr <- stringr::str_to_lower(tweet_text)
  
  tweet_corpus <- tm::VCorpus(x = tm::VectorSource(tweet_text_lwr))
  
  url_pattern <- "(f|ht)(tp)(s?):(//)?\\S+"
  
  clean_tweet_corpus <- tweet_corpus %>% 
    tm::tm_map(rm_pattern, "/") %>% 
    tm::tm_map(rm_pattern, "\\|") %>% 
    tm::tm_map(rm_pattern, url_pattern) %>% 
    tm::tm_map(tm::removePunctuation) %>% 
    tm::tm_map(trim_both)
  
    clean_tweet_text <- sapply(
      X = clean_tweet_corpus, 
      FUN = function(x) x$content
    )
    
    clean_tweet_text <- as.vector(clean_tweet_text)
    
  return(clean_tweet_text)
}
