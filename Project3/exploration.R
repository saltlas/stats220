library(tidyverse)
library(jsonlite)
library(magick)

# importing the "northern lights" photo data in json format
json_data <- fromJSON("pixabay_data.json")
pixabay_photo_data <- json_data$hits

# the three new variables i decided to generate were:
# has_aurora_tag - checks if the photo has a tag containing the word aurora
# num_tag_words - counts the number of words in the photo's tags
# url_length - counts the number of characters in the page url of the photo
selected_photos <- pixabay_photo_data %>%
  select(id, pageURL, previewURL, views, downloads, likes, tags) %>%
  mutate(has_aurora_tag = ifelse(str_detect(tags, "aurora"), "yes", "no"), 
         num_tag_words = str_count(tags, "\\S+") + 1,
         url_length = nchar(pageURL)) %>%
  filter(id <= min(id) + (median(id) - min(id))/2) 

write_csv(selected_photos, "selected_photos.csv")

# my three summary values, different for variety, self-explanatory variable names
median_likes <- selected_photos$likes %>% median(na.rm = TRUE)
sum_downloads <- selected_photos$downloads %>% sum(na.rm = TRUE)
mean_views <- selected_photos$views %>% mean(na.rm = TRUE)

# showing the mean views based on whether the photo has a tag with "aurora" in it
grouped_summary <- selected_photos %>% group_by(has_aurora_tag) %>% summarise(mean_views = mean(views))

# code adapted from lecture 3B to create gif
img_urls <- selected_photos$previewURL %>% na.omit()
image_read(img_urls) %>%
  image_join() %>%
  image_scale(200) %>%
  image_animate(fps = 2) %>%
  image_write("my_photos.gif")

# creativity section - creating a plot to show correlation between likes and downloads
ggplot(data=pixabay_photo_data, aes(x=likes, y=downloads)) + geom_point()


# creativity section - finding the mode preview width and then the mode height for that width
# in order to generate a gif with photos all of the same size
mode_width <- pixabay_photo_data %>%
  count(previewWidth, sort = TRUE) %>%
  slice(1) %>%
  pull(previewWidth)

mode_height <- pixabay_photo_data %>% 
  filter(previewWidth == mode_width) %>%
  count(previewHeight, sort = TRUE) %>%
  slice(1) %>%
  pull(previewHeight)

same_size_images <- pixabay_photo_data %>% filter(previewWidth == mode_width & previewHeight == mode_height)

# generating second gif
img_urls <- same_size_images$previewURL %>% na.omit()
image_read(img_urls) %>%
  image_join() %>%
  image_scale(200) %>%
  image_animate(fps = 2) %>%
  image_write("my_creative.gif")
