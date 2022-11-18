# SQL Questions & Solutions

| Day | Source    | My Solution                                                                            | Link                                                                        | Remarks                                                                                                                                                                                           |
| --- | --------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 001 | DataLemur | [Data Science Skills](/datalemur/01-DataScienceSkills.sql)                             | [Link :link:](https://datalemur.com/questions/matching-skills)              |
|     | DataLemur | [Page With No Likes](/datalemur/02-PageWithNoLikes.sql)                                | [Link :link:](https://datalemur.com/questions/sql-page-with-no-likes)       |
| 002 | DataLemur | [Unfinished Parts](/datalemur/03-UnfinishedParts.sql)                                  | [Link :link:](https://datalemur.com/questions/tesla-unfinished-parts)       |
| 003 | DataLemur | [Laptop vs Mobile Viewership](/datalemur/04-LaptopVsMobileViewership.sql)              | [Link :link:](https://datalemur.com/questions/laptop-mobile-viewership)     | Case when                                                                                                                                                                                         |
|     | DataLemur | [Cities with Completed Trades](/datalemur/05-CitiesWithCompletedTrades.sql)            | [Link :link:](https://datalemur.com/questions/completed-trades)             | Joins, order of execution                                                                                                                                                                         |
| 004 | DataLemur | [Duplicate Job Listings](/datalemur/06-DuplicateJobListings.sql)                       | [Link :link:](https://datalemur.com/questions/duplicate-job-listings)       | CTE                                                                                                                                                                                               |
|     | DataLemur | [Final Account Balance](/datalemur/07-FinalAccountBalance.sql)                         | [Link :link:](https://datalemur.com/questions/final-account-balance)        | CTE                                                                                                                                                                                               |
|     | DataLemur | [Histogram of Tweets](/datalemur/08-HistogramOfTweets.sql)                             | [Link :link:](https://datalemur.com/questions/sql-histogram-tweets)         |
| 005 | DataLemur | [User's Third Transaction](/datalemur/UsersThirdTransaction.sql)                       | [Link :link:](https://datalemur.com/questions/sql-third-transaction)        | window functions with partition by, over by                                                                                                                                                       |
| 006 | DataLemur | [Compensation Outliers](/datalemur/CompensationOutliers.sql)                           | [Link :link:](https://datalemur.com/questions/compensation-outliers)        | use `CASE WHEN` result in `WHERE` clause with CTE/subquery                                                                                                                                        |
| 007 | DataLemur | [Sending vs. Opening Snaps](/datalemur/SendingVsOpeningSnaps.sql)                      | [Link :link:](https://datalemur.com/questions/time-spent-snaps)             | aggregation x2                                                                                                                                                                                    |
| 008 | DataLemur | [Tweets' Rolling Averages](/datalemur/TweetsRollingAverage.sql)                        | [Link :link:](https://datalemur.com/questions/rolling-average-tweets)       | Rollmean                                                                                                                                                                                          |
| 009 | DataLemur | [Odd and Even Measurements](/datalemur/OddAndEvenMeasurements.sql)                     | [Link :link:](https://datalemur.com/questions/odd-even-measurements)        | window function (`ROW_NUMBER`)                                                                                                                                                                    |
| 010 | DataLemur | [Highest-Grossing Items](/datalemur/HighestGrossingItems.sql)                          | [Link :link:](https://datalemur.com/questions/sql-highest-grossing)         | First n rows, grouped                                                                                                                                                                             |
| 011 | DataLemur | [First Transaction](/datalemur/FirstTransaction.sql)                                   | [Link :link:](https://datalemur.com/questions/sql-first-transaction)        | First row in each group with `ROW_NUMBER()`                                                                                                                                                       |
| 012 | DataLemur | [Linkedin Power Creators (Part 1)](/datalemur/LinkedinPowerCreatorsPart1.sql)          | [Link :link:](https://datalemur.com/questions/sql-highest-grossing)         | joins                                                                                                                                                                                             |
|     | DataLemur | [Linkedin Power Creators (Part 2)](/datalemur/LinkedinPowerCreatorsPart2.sql)          | [Link :link:](https://datalemur.com/questions/sql-highest-grossing)         | `HAVING`                                                                                                                                                                                          |
| 013 | DataLemur | [Top 5 Artists](/datalemur/Top5Artists.sql)                                            | [Link :link:](https://datalemur.com/questions/sql-highest-grossing)         | `DENSE_RANK()`, multiple CTEs, using aggregated columns in `LIMIT`                                                                                                                                |
| 014 | DataLemur | [Signup Confirmation Rate](/datalemur/SignupConfirmationRate.sql)                      | [Link :link:](https://datalemur.com/questions/signup-confirmation-rate)     | `JOIN` with `AND`, integer divisions in postgres discards fractional part, ``::DECIMAL``                                                                                                          |
| 015 | DataLemur | [Fill Missing Client Data](/datalemur/FillMissingClientData.sql)                       | [Link :link:](https://datalemur.com/questions/fill-missing-product)         | [select the previous non-null value](https://stackoverflow.com/questions/18987791/how-do-i-efficiently-select-the-previous-non-null-value); `OVER (ORDER BY ...)`; `COUNT` ignores `NULL`         |
| 016 | DataLemur | [Consulting Bench Time](/datalemur/ConsultingBenchTime.sql)                            | [Link :link:](https://datalemur.com/questions/consulting-bench-time)        | date difference                                                                                                                                                                                   |
| 017 | DataLemur | [Spotify Streaming History](/datalemur/SpotifyStreamingHistory.sql)                    | [Link :link:](https://datalemur.com/questions/spotify-streaming-history)    | `UNION` removes duplicates while `UNION ALL` does not; datetype casting when comparing datetimes                                                                                                  |
| 018 | DataLemur | [Histogram of Users and Purchases](/datalemur/HistogramOfUsersAndPurchases.sql)        | [Link :link:](https://datalemur.com/questions/histogram-users-purchases)    |
| 019 | DataLemur | [Unique Money Transfer Relationships](/datalemur/UniqueMoneyTransferRelationships.sql) | [Link :link:](https://datalemur.com/questions/money-transfer-relationships) | `INTERESECT` on two selections (columns flipped) returns unique pairs **twice**, useful for counting the number of rows. Use `DISTINCT` and `CASE WHEN` to return the exact list of unique pairs. |
| 020 | DataLemur | [Pharmacy Analytics (Part 4)](/datalemur/PharmacyAnalyticsPart4.sql)                   | [Link :link:](https://datalemur.com/questions/top-drugs-sold)               | First n rows by group, with `ROW_NUMBER()`                                                                                                                                                        |