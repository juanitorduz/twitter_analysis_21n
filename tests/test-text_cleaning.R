library(testthat)

source("../R/text_cleaning.R")
print(1)
test_that(desc = "Clean Tweet Text", code = {
  clean_text_1 <- clean_tweets(tweet_text = "  ** https://google.com.co juanito.. ..")
  clean_text_2 <- clean_tweets(tweet_text = "!!! tabitas http://google.com.co")
  clean_text_3 <- clean_tweets(tweet_text = "!!!   *+     --    ")
  clean_text_4 <- clean_tweets(tweet_text = " #elguay")
  expect_equal(clean_text_1, "juanito")
  expect_equal(clean_text_2, "tabitas")
  expect_equal(clean_text_3, "")
  expect_equal(clean_text_4, "#elguay")
})

test_that(desc = "Remove Hashtags", code = {
  clean_text_1 <- rm_hashtags(x = "hola #como estas")
  clean_text_2 <- rm_hashtags(x = "#foo")
  clean_text_3 <- rm_hashtags(x = "#foo#bar")
  expect_equal(clean_text_1, "hola  estas")
  expect_equal(clean_text_2, "")
  expect_equal(clean_text_3, "")
})