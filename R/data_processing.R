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
clean_text_tweets_df <- clean_tweets(tweet_text = data_df$text)
saveRDS(object = clean_text_tweets_df, file = "data/clean_text_tweets.rds")