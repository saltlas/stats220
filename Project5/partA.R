library(tidyverse)
library(rvest)


# My data context is the popularity and progression of the media format of online interactive stories.
# Information that may be useful to scrape for such purposes would be the numbers and stats of a wide variety of such stories, in order to compare them.
# Such stats may include 'likes', word counts, dates of latest chapter release, ratings, overall word count, how long the story has been going for, etc.

# Sufficient Velocity is appropriate for web scraping as it has nothing in its ToS or robots.txt disallowing people from scraping the forum listings for data, which means any statistical data scraped is ethically sourced.
url <- "https://forums.sufficientvelocity.com/forums/quests.29/page-2"

page <- read_html(url)

# This scrapes the number of words in each chapter of the story published.
words <- page %>% html_elements(".structItem-cell--meta") %>% html_text2()

# This scrapes the "stats" section of each story listing, including view count and such.
stats <- page %>% html_elements(".structItem-story-stats") %>% html_text2()

# This scrapes all timestamps on the page, as theyre useful for visualisations.
times <- page %>% html_elements("time") %>% html_text2()

# This scrapes the start dates of each interactive story
start_dates <- page %>% html_elements(".structItem-startDate") %>% html_text2()

words
stats
times
start_dates
