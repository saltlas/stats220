library(tidyverse)
library(magick)
youtube_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRVcUuVYq5dqoj8jIm_llfgRsSnKvaa2f0cV-A-UQYdBlx-SWMQ03fG-CJRg1ZwpXwW8mLBnzlpueQi/pub?gid=0&single=true&output=csv")
youtube_data

options(scipen = 999)
my_scale = scale_color_manual(values=c("@themiracleforest" = "#fe9929", "@Vihart" = "#d95f0e"))
my_theme = theme(panel.background = element_rect(fill="#ffffd4"),
                 plot.background = element_rect(fill="#ffffd4"),
                 panel.grid = element_line("#fed98e"))


plot1_data <- separate_rows(youtube_data, title, sep=" ")
plot1_data$title <- str_remove_all(plot1_data$title, "[^a-zA-Z]") 

plot1_data <- plot1_data %>%
  mutate(word=str_to_lower(title)) %>%
  filter(title != "") %>%
  group_by(word, channelName) %>%
  summarise(count = n()) %>%
  tibble() %>%
  arrange(desc(ave(count, word, FUN=sum))) %>%
  slice(1:45)


plot1 <- ggplot(data=plot1_data, aes(y = reorder(word, count, sum), x = count, color=channelName)) + 
  geom_col() +
  labs(title="Most common words used in video titles by frequency", x="Frequency", y="Word", color="Channel name") +
  my_scale + my_theme


plot2_data <- youtube_data %>%
  mutate(month = format(as.Date(datePublished), "%Y-%m")) %>%
  group_by(month, channelName) %>%
  summarise(count = n()) %>%
  tibble() %>%
  mutate(month_date=as.Date(str_glue("{month}-01")))

plot2 <- ggplot(data=plot2_data, aes(x = month_date, y=count, group=channelName, colour=channelName)) +
  geom_point() + geom_smooth() +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y", expand = c(0, 0), guide = guide_axis(check.overlap = TRUE)) +
  labs(title="Upload rate per month for each channel", x="Month", y="Number of videos uploaded that month", color="Channel name") +
  my_scale + my_theme



plot3_data <- youtube_data %>%
  group_by(channelName) %>%
  summarise(mean_duration=mean(duration)/60)

plot3 <- ggplot(data=plot3_data, aes(x=channelName, y=mean_duration, color=channelName, label=mean_duration)) + 
  geom_bar(stat="identity") +
  geom_text(color="black", vjust=0) +
  labs(title="Mean duration of videos per channel in minutes", x = "Channel name", y = "Mean duration (minutes)", color = "Channel name") +
  my_scale + my_theme

plot4_data <- youtube_data %>%
  select(viewCount, likeCount, channelName)
plot4 <- ggplot(data=plot4_data, aes(x=viewCount, y=likeCount, group=channelName, color=channelName)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  my_scale + my_theme

plot5 <- ggplot(data=youtube_data, aes(x=viewCount, group=channelName, color=channelName)) +
  geom_density() + my_scale + my_theme

ggsave('plot1.png', plot1, height = 4, width = 12)
ggsave('plot2.png', plot2, height = 4, width = 12)
ggsave('plot3.png', plot3, height = 4, width = 12)
ggsave('plot4.png', plot4, height = 4, width = 12)
ggsave('plot5.png', plot5, height = 4, width = 12)

plot6_data <- separate_rows(youtube_data, title, sep=" ")

plot6_data$title <- str_remove_all(plot6_data$title, "[^a-zA-Z]") 

plot6_data <- plot6_data %>%
  mutate(word=str_to_lower(title)) %>%
  filter(title != "") %>%
  group_by(word, channelName) %>%
  summarise(count = n()) %>%
  tibble() %>%
  arrange(desc(ave(count, word, FUN=sum)))

plot6 <- ggplot(data=plot6_data, aes(y = reorder(word, count, sum), x = count, color=channelName)) + 
  geom_col() +
  labs(title="Most common words used in video titles by frequency", x="Frequency", y="Word", color="Channel name") +
  my_scale + my_theme + geom_text(size=2, aes(label=count, color="black"), hjust=-1) + theme(legend.position = "top")
ggsave('plot6.png', plot6, height=48, width=12)

frames <- c()
plot_ = image_read('plot6.png') %>% image_scale("1200x4800")
for (i in 1:480) {
  heightloc = (i-1)*10
  temp <- image_crop(plot_, str_glue("1200x400+0+{heightloc}"))
  frames <- c(frames, temp)
  }
frames <- image_join(frames)
plot_ = image_animate(frames, fps=5)

image_write(plot_, "my_animation.gif")
