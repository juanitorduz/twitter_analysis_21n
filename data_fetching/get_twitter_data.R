# Select relevant keywords to fetch data. 
twitter_terms <- c(
  "21N", 
  "#21N", 
  "#21NSomosTodos",
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
  "#YoParoEl21NSinMiedo", 
  "#Cacerolazo", 
  "#22N", 
  "#23N",
  "#ToqueDeQueda"
)

twitter_query <- stringr::str_c(twitter_terms, collapse = " OR ")

raw_df <- rtweet::search_tweets(
  q = twitter_query, 
  n = 5E5, 
  type = "recent", 
  include_rts = TRUE, 
  parse = TRUE, 
  retryonratelimit = TRUE, 
  verbose = TRUE
)

# Save as .rds format. 
# This is needed because the data comes as a nested dataframe with
# columns of type list. 
saveRDS(object = raw_df, file = "data/24_11_2019_twitter_21n.rds")

# Save as json.
jsonlite::write_json(
  x =  raw_df,
  path = "data/24_11_2019_twitter_21n.json"
)
