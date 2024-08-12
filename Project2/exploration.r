library(tidyverse)

learning_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vT8Q1JuHaVX5cWvAAOEddu_xgOZmYJAimbvCJsu1neE_sryJRuU2dT5COnWkrV2CKpOMEymb8gWa0zS/pub?gid=400502560&single=true&output=csv")

learning_data <- rename(learning_data, enjoy_reading = 2, read_this_wk = 3,
                        media = 4, hrs_this_wk = 5, days_this_wk = 6, acquisition = 7,
                        format = 8, genre = 9)



learning_data_no_na <- na.omit(learning_data)

paste("The respondent who read for the most amount of hours this week read for",
      max(learning_data_no_na$hrs_this_wk), "hour(s).",
      "The respondent who read for the least amount of hours this week read for",
      min(learning_data_no_na$hrs_this_wk), "hour(s).", collapse = " ")


ggplot(data = learning_data_no_na) +
  geom_bar(aes(x = genre, color=genre)) + theme(legend.position = "none")

ggplot(data = separate_rows(learning_data_no_na, media, sep=", ")) +
  geom_bar(aes(x = media, color=media)) + theme(legend.position = "none")

did_read <- learning_data[learning_data$read_this_wk == "Yes"]
didnt_read <- learning_data[learning_data$read_this_wk == "No"]

ggplot(data=learning_data) + geom_bar(aes(fill=read_this_wk, x=enjoy_reading)) + labs(fill = "Read this week", x = "Enjoys reading", title="How much respondents enjoyed reading", subtitle="on a scale of 1 to 5")
