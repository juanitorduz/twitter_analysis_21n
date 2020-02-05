get_text_over_time <- function (tweets_text_df, txt_pattern, no_hashtag = FALSE) {
  
  if (no_hashtag) {
    
    tweets_text_df %>% 
      filter(str_detect(string = clean_text_no_hashtag, pattern = txt_pattern)) %>% 
      count(created_at_round_hour)
  
  } else {
      
    tweets_text_df %>% 
      filter(str_detect(string = clean_text, pattern = txt_pattern)) %>% 
      count(created_at_round_hour)
    
    }
}


get_relatve_word_count <- function (tweets_text_df, stopwords_df, input_word) {
  
  tweets_text_df %>% 
    filter(str_detect(string = clean_text_no_hashtag, pattern = input_word)) %>% 
    unnest_tokens(output = word, input = clean_text_no_hashtag) %>% 
    anti_join(y = stopwords_df, by = "word") %>% 
    filter(word != input_word) %>% 
    count(word) %>% 
    arrange(- n)
}
