library(magick)


title <- image_blank(width = 1200, 
                           height = 400, 
                           color = "#ffffd4") %>%
  image_annotate(text = "A comparison of the two YouTube channels Vihart and Miracle Forest",
                 color = "#000000",
                 size = 30,
                 font = "Segoe UI",
                 gravity = "center",
                 weight = "700") %>% 
  image_annotate(text = "as part of a submission for Project 4 of STATS 220 2024",
                 color = "#000000",
                 size = 20,
                 font = "Segoe UI",
                 gravity = "center",
                 location = "+0+40",
                 weight = "700") 

intro <- image_blank(width = 1200, 
                     height = 400, 
                     color = "#ffffd4") %>%
  image_annotate(text = "Introduction",
                 color = "#000000",
                 size = 25,
                 font = "Segoe UI",
                 gravity = "north",
                 location = "+0+20",
                 weight = "700") %>% 
  image_annotate(text = "It was difficult to find statistically significant ways to compare these two vastly different channels that still made plots that were
readable and understandable. As such, this data story will mostly be a study in how little the two channels have in common, as well as
indicative of some of the difficulties of displaying vast amounts of data on a single plot.",
                 color = "#000000",
                 size = 20,
                 font = "Segoe UI",
                 gravity = "center",
                 location = "+0+0") 
plot1 <- image_read('plot1.png') %>% image_scale("1200x400")
plot2 <- image_read('plot2.png') %>% image_scale("1200x400")
plot3 <- image_read('plot3.png') %>% image_scale("1200x400")
plot4 <- image_read('plot4.png') %>% image_scale("1200x400")
plot5 <- image_read('plot5.png') %>% image_scale("1200x400")

slide1 <- plot1 %>% image_annotate(text = "This plot displays the most commonly 
used words in video titles
from the data collected.
It's actually quite impressive
how there are almost
no words in common aside from
words like 'and'.",
                                   color = "#000000",
                                   size = 12,
                                   font = "Segoe UI",
                                   gravity = "east",
                                   location = "+10+110",
                                   boxcolor="#993404"
                                   )

slide2 <- plot2 %>% image_annotate(text = "This plot shows the upload rate for
each channel by month. The two 
channels had vastly different peak
times and peak upload periods
and even the lifespan differs 
as Miracle Forest only begins uploads
partway through the plot. Trend lines
have been added as there is a lot of data 
so readable ways to discern statistic 
significance are needed. Further difficulty with
displaying such a range with ggplot
is shown by the x axis labels not being clear 
as to the exact corresponding month",
                                color = "#000000",
                                size = 9,
                                font = "Segoe UI",
                                gravity = "east",
                                location = "+5+110",
                                boxcolor="#993404"
)
slide3 <- plot3 %>% image_annotate(text = "This plot is simpler and just shows
the mean video duration for 
each channel in minutes.
The difference even here is
relatively very large.",
                                   color = "#000000",
                                   size = 12,
                                   font = "Segoe UI",
                                   gravity = "east",
                                   location = "+10+110",
                                   boxcolor="#993404"
)


midgif <- image_blank(width = 1200, 
                      height = 400, 
                      color = "#ffffd4") %>%
  image_annotate(text = "As I didn't know what counted as statistically significant or what counted as creative,
I have two more plots that I made to show, and one creative item at the end.",
                 color = "#000000",
                 size = 30,
                 font = "Segoe UI",
                 gravity = "center",
                 location = "+0+0") 

slide4 <- plot4 %>% image_annotate(text = "This plot displays the correlation between
view count and like count.
It reveals what seems to be a 
weak correlation and opens up questions 
about whether channels in the same 
'genre' of youtube channel would 
have closer lines of correlation than
these two channels do.
It also demonstrates a difficulty in 
displaying different ranges of data, as one
channel hides the other, and outliers mean 
that most of the data is too
clustered together to be visible.",
                                   color = "#000000",
                                   size = 10,
                                   font = "Segoe UI",
                                   gravity = "east",
                                   location = "+10+110",
                                   boxcolor="#993404"
)


slide5 <- plot5 %>% image_annotate(text = "This plot shows the density of view count
per channel. It gives us insight into
how popular the channels are and perhaps
how many outliers in terms of viral
or poorly performing videos they've had.
Again, this plot shows a difficulty in
displaying data that differs heavily, as
the two ranges combine to make a rather
broad x axis.",
                                   color = "#000000",
                                   size = 12,
                                   font = "Segoe UI",
                                   gravity = "east",
                                   location = "+10+110",
                                   boxcolor="#993404"
)


preface <- image_blank(width = 1200, 
                       height = 400, 
                       color = "#ffffd4") %>%
  image_annotate(text = "For my final demonstration of 'creativity' please see my project report",
                 color = "#000000",
                 size = 30,
                 font = "Segoe UI",
                 gravity = "center",
                 location = "+0+0") 

conclusion <- image_blank(width = 1200, 
                          height = 400, 
                          color = "#ffffd4") %>%
  image_annotate(text = "We can see that the two channels have vastly different variables in almost
everything. They cater to different audiences with their video titles, they have had different lifespans and peaks over the past 15 years,
they have different average video durations, ratios of views to likes and view distributions. As a result of pretty much nothing
about them being the same, data comparing them is often tricky to display on one plot.",
                 color = "#000000",
                 size = 20,
                 font = "Segoe UI",
                 gravity = "center",
                 location = "+0+0") 


data_story <- c(title, intro, slide1, slide2, slide3, midgif, slide4, slide5, preface, conclusion) %>%
  image_join() %>% image_animate(fps=1, delay=500)

image_write(data_story, "data_story.gif")
