# Twitter Analysis: [21N Colombia](https://es.wikipedia.org/wiki/Protestas_en_Colombia_de_2019-2020)

## Description:

Analysis of available Tweets from the 21N protests in Colombia (Work In Progress!).
The available data covers all tweets sent from the before the beginning of the protests on the 21st of November, to a couple of days after. The actual demonstrations lasted for weeks, but we focused on the data from the beginning of the event. 

![im](images/network_screenshot.png)

Note: The colors in the graph are the result of a topic detection algorithms.  
## Contributors 

- [Sebastián Martínez](https://github.com/martinezsebastian)
- [Juan Camilo Orduz](https://github.com/juanitorduz)

## Data Source:

We used the [`rtweet`](https://github.com/ropensci/rtweet) [R](https://www.r-project.org/) package to fetch a sample of tweets during the protests period. We tried to cover a large topic spectrum via the following keywords:
```R
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
```
[Here](https://github.com/juanitorduz/twitter_analysis_21n/blob/master/data_fetching/get_twitter_data.R) is the script we used to fetch the data. The sample data is stored as an `.rds` file and contains 1,006,484 tweets.

![image2](images/tweets_over_time.png)

## Analysis Status

In this repository you can find some data pre-processing and initial exploratory data analysis: word counts, topic modeling and network (retweet) analysis.

We have not had the capacity to dig deeper into the analysis, but we believe there are interesting insights to be extracted from this data. If you would like to have access to the data and/or contribute to this repository please do not hesitate to [contact us](mailto:juanitorduz@gmail.com). You could also create an issue to suggest ideas or directions for future development. 

## Data Processing

```bash
Rscript R/data_processing.R
```



