library(igraph)
library(tidyverse)


get_retweet_network_df <- function (data_df, weight_threshold = 0.0) {
  
  retweet_network_df <- data_df %>% 
    filter(is_retweet == TRUE, screen_name != retweet_screen_name) %>%  
    select(screen_name, retweet_screen_name) %>% 
    count(screen_name, retweet_screen_name) %>% 
    rename(weight = n) %>% 
    filter(weight >= weight_threshold)
  
  return(retweet_network_df)
}


get_retweet_network <- function (retweet_network_df) {
  
  retweet_network <- graph_from_data_frame(d = retweet_network_df, directed = TRUE)
  
  V(retweet_network)$tweets_in <- strength(graph = retweet_network, mode = "in")
  V(retweet_network)$tweets_out <- strength(graph = retweet_network, mode = "out")
  
  E(retweet_network)$weight_scaled <- E(retweet_network)$weight/max(E(retweet_network)$weight)
  
  return(retweet_network)
}


get_retweets_deg_df <- function (retweets_network) {
  
  retweets_deg_df <- tibble(
    screen_name = V(retweet_network)$name, 
    tweets_in = V(retweet_network)$tweets_in,
    tweets_out = V(retweet_network)$tweets_out
  )
  
  return(retweets_deg_df)
}