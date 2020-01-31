library(testthat)

source("../R/text_cleaning.R")

test_that(desc = "Clean Tweet Text", code = {
  clean_text_1 <- clean_tweets(tweet_text = "  ** https://google.com.co juanito.. ..")
  clean_text_2 <- clean_tweets(tweet_text = "!!! tabitas http://google.com.co")
  clean_text_3 <- clean_tweets(tweet_text = "!!!   *+     --    ")
  expect_equal(clean_text_1, "juanito")
  expect_equal(clean_text_2, "tabitas")
  expect_equal(clean_text_3, "")
})


