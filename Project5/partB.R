library(tidyverse)
library(rvest)

# I have selected Paul Goldsmith.
# I've noticed that the number of paragraphs is somewhat variable between releases, but the size of the paragraphs are roughly the same.
# Longer words are used than I would imagine are present in less formal prose, such as a blog post.
url <- "https://www.beehive.govt.nz/minister/hon-paul-goldsmith"

pages <- read_html(url) %>%
  html_elements(".release__wrapper") %>%
  html_elements("h2") %>%
  html_elements("a") %>%
  html_attr("href") %>%
  paste0("https://www.beehive.govt.nz", .)


page_url <- pages[11]

page <- read_html(page_url)

release_title <- page %>% html_elements(".article__title") %>% html_text2()

release_content <- page %>% html_elements(".prose.field.field--name-body.field--type-text-with-summary.field--label-hidden.field--item") %>% html_elements("p") %>% html_text2()




get_release <- function(page_url){
  Sys.sleep(2)
  # print the page_url so if things go wrong
  # we can see which page caused issues
  print(page_url)
  page <- read_html(page_url)
  
  # add code to scrape the release title and release content
  release_title <- page %>% html_elements(".article__title") %>% html_text2()
  release_content <- page %>% html_elements(".prose.field.field--name-body.field--type-text-with-summary.field--label-hidden.field--item") %>% html_elements("p") %>% html_text2()
  
  # add code to return a tibble created using these data objects
  tibble(release_title, content = release_content)
}
release_data <- map_df(pages, get_release)

average_words_per_paragraph <- str_count(release_data$content, "\\S+") %>% mean()



paragraphs_per_article <- release_data %>% group_by(release_title) %>% summarise(count=n())
avg_paragraphs <- mean(paragraphs_per_article$count)

stripped_data <- release_data$content %>% str_replace_all("\n", " ") %>% 
  str_to_lower() %>% 
  str_remove_all("[[:punct:]]") %>%
  str_squish() 
avg_word_length <- mean(str_count(words))



words_per_article <- release_data %>% mutate(wordcount = str_count(content, "\\S+")) %>% group_by(release_title) %>% summarise(count=sum(wordcount))
max_words <- max(words_per_article$count)


average_words_per_paragraph
avg_paragraphs
avg_word_length
max_words
