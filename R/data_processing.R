source(file = "R/hashtags.R")
source(file = "R/text_cleaning.R")

raw_df <- readRDS(file = "data/19_11_2019_twitter_21n.rds")

hashtags_df <- create_hashtags_df(raw_df = raw_df)
saveRDS(object = hashtags_df, file = "data/hashtags.rds")

clean_text_tweets_df <- clean_tweets(tweet_text = raw_df$text)
saveRDS(object = clean_text_tweets_df, file = "data/clean_text_tweets.rds")