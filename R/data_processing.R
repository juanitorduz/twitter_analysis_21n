source(file = "R/hashtags.R")
source(file = "R/text_cleaning.R")
source(file = "R/time.R")

print("Reading Raw Data")

raw_df <- readRDS(file = "data/25_11_2019_twitter_21n.rds")

print("Add Time Features")
data_df <- add_time_features(raw_df = raw_df)
saveRDS(object = data_df, file = "data/data_df.rds")

#print("Unnest Hashtags")
#hashtags_df <- create_hashtags_df(data_df = data_df )
#saveRDS(object = hashtags_df, file = "data/hashtags.rds")

print("Get Hashtag Count")
hashtags_count_df <- get_hashtags_count_df(data_df = data_df)
saveRDS(object = hashtags_count_df, file = "data/hashtags_count.rds")

print("Clean Text")
clean_text_tweets <- clean_tweets(tweet_text = data_df$text)

clean_text_tweets_df <- tibble(clean_text = clean_text_tweets) %>% 
  mutate(clean_text_no_hashtag = str_trim(rm_hashtags(clean_text), side = "both"))

tweets_text_df <- bind_cols(
  data_df %>% select(created_at, screen_name, is_retweet),
  clean_text_tweets_df
)

tweets_text_df %<>% 
  add_column(created_at_round_hour = NA , .before = "created_at") %>% 
  mutate(created_at_round_hour = created_at %>% round(units = "hour") %>% as.POSIXct()) %>% 
  select(- created_at)

saveRDS(object = tweets_text_df, file = "data/tweets_text_df.rds")
