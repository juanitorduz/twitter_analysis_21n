library(magrittr)
library(tidyverse)


create_hashtags_df <- function (raw_df) {
  
  hashtags_df <- raw_df %>% 
    filter(! is.na(hashtags)) %>% 
    select(status_id, created_at, screen_name, is_retweet, hashtags) %>% 
    unnest(cols = hashtags)
  
  saveRDS(object = hashtags_df, file = "data/hashtags.rds")
}


get_hashtag_count_df <- function (hashtags_df, to_lower = FALSE) {
  
  if (to_lower) {
    hashtags_df %<>% mutate(hashtags = str_to_lower(hashtags)) 
  }
  
  hashtags_count_df <- hashtags_df %>% 
    count(hashtags) %>% 
    arrange(- n)
  
  return(hashtags_count_df)
}