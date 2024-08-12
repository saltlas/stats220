library(tidyverse)
library(magick)

image_blank(width=400, height=400) %>%
  image_annotate("hello", gravity="center")


