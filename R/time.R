utc_to_colombian_time <- function (x) {x  - (5*3600)}


add_time_features <- function (raw_df) {
  
  data_df <- raw_df %>% 
    mutate(created_at = utc_to_colombian_time(x = created_at)) %>% 
    mutate(created_at_round_hour = created_at %>% round(units = "hour") %>% as.POSIXct())
  
  return(data_df)
}
