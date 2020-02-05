library(magrittr)
library(tidyverse)


get_hashtags_count_df <- function (data_df) {
  
  hashtags_vect <- data_df %>% 
    filter(! is.na(hashtags)) %>% 
    pull(hashtags) %>% 
    unlist()
  
  hashtags_count_df <- tibble(hashtag = hashtags_vect) %>% 
    mutate(hashtag = str_to_lower(string = hashtag)) %>% 
    count(hashtag) %>% 
    arrange(-n)
  
  return(hashtags_count_df)
}

#TODO: the `unnest` function is very slow and this function
# takes too much time to run. Need to optimize it. 
create_hashtags_df <- function (data_df) {
  
  hashtags_df <- data_df %>% 
    select(status_id, created_at, screen_name, is_retweet, hashtags) %>% 
    filter(! is.na(hashtags)) %>% 
    unnest(cols = hashtags)
  
  return(hashtags_df)
}


get_hashtag_count_df_2 <- function (hashtags_df, to_lower = FALSE) {
  
  if (to_lower) {
    hashtags_df %<>% mutate(hashtags = str_to_lower(hashtags)) 
  }
  
  hashtags_count_df <- hashtags_df %>% 
    count(hashtags) %>% 
    arrange(- n)
  
  return(hashtags_count_df)
}

get_top_hashtags_df <- function (hashtags_df, n) {
  
  hashtag_count_df <- get_hashtag_count_df(hashtags_df = hashtags_df, to_lower = TRUE)
  
  top_hashtags <- hashtag_count_df %>% head(n) %>% pull(hashtags)
  
  top_hashtags_df <- hashtags_df %>% 
    select(created_at, hashtags) %>% 
    mutate(hashtags = str_to_lower(string = hashtags)) %>% 
    filter(hashtags %in% top_hashtags) %>% 
    mutate(created_at_round_hour = created_at %>% round(units = "hour") %>% as.POSIXct()) %>% 
    select(- created_at) %>% 
    count(created_at_round_hour, hashtags) %>% 
    replace(is.na(.), 0)
  
  return(top_hashtags_df)
}