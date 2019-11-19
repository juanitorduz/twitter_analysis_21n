# Select relevant keywords to fetch data. 
twitter_terms <- c(
  "21N", 
  "#21N", 
  "#Paro21N", 
  "#YoMarchoEste21",
  "#YoMarchoEl21",
  "#YoNoMarchoEste21",
  "#YoNoMarchoEl21",
  "#RazonesParaMarchar",
  "#RazonesParaNoMarchar",
  "#100RazonesParaMarchar", 
  "#100RazonesParaNoMarchar", 
  "#YoNoParo",
  "#YoParoEl21NSinMiedo"
)

twitter_query <- stringr::str_c(twitter_terms, collapse = " OR ")

# Fetch data usinng rtweet. 

raw_df <- rtweet::search_tweets(
  q = twitter_query, 
  n = 2E5, 
  type = "recent", 
  include_rts = TRUE, 
  parse = TRUE, 
  retryonratelimit = TRUE, 
  verbose = TRUE
)

# Save as .rds format. 
# This is needed because the data comes as a nested dataframe with
# columns of type list. 
# saveRDS(object = raw_df, file = "19_11_2019_twitter_21n.rds")
