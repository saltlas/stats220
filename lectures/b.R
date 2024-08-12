library(tidyverse)
a <- c(97, 85, 81, 67, 67, 90, 96, 85, 67, 33, 87, 74, 85, 92, 87, 59, 90, 90, 86, 71, 91, 94, 96, 88, 90, 83, 79, 92, 81, 93, 81, 76, 68, 93, 74, 85, 83, 75, 91, 74, 91, 87, 93, 76, 85, 75, 79, 76, 89, 70, 80, 100, 85, 88, 89, 73, 95, 92, 87, 96, 71, 72, 98, 93, 83, 80, 89, 92, 96, 74, 95, 83, 86, 76, 83, 91, 82, 82, 94, 85, 95, 70, 92, 92, 96, 83, 87)
sum(a[54:68])

b <- sort(a)

b[69]

a[20] <= a[54]

c <- a < 174680

length(a[c])


f <- c(161840, 185422, 173182, 193346, 216120, 167480, 143901, 270586, 186173, 193506, 205946, 204316, 153000, 242965, 173381, 254181, 136266, 178147, 225664, 214613, 227527, 258799, 184893, 96825, 200000, 174000, 141805, 133613, 191013, 212878, 212000, 162680, 179426, 226088, 231041, 164818, 173549, 187943, 225148, 187111, 168601, 179720, 195013, 175163, 194050, 160239, 157890, 210560, 169237, 152137, 207065, 174680, 257213, 165772, 202735, 213718, 213493, 172626, 214416, 256000, 161853, 207853, 231832, 189560, 215281, 185680, 202133, 161266, 224773, 185600, 136760, 174728, 193279, 214405, 198324, 168873, 195760, 200547, 197442, 175344, 160656, 224694, 186538, 176146, 216764, 206772, 263288, 238805, 185855, 153190, 203807, 186677, 278440, 145800, 188918)

c <- f == 210560

length(f[c])


song_title <- song_title <- c("When I’m Gone (with Katy Perry)", "Need to Know", "MAMIII", "Rumors (feat. Lil Durk)", "THATS WHAT I WANT", "Bussin", "Slow Down Summer", "Nail Tech", "Ghost", "half of my hometown (feat. Kenny Chesney)", "You Should Probably Leave", "Scorpio", "23", "Do We Have A Problem?", "You Right", "Closer (feat. H.E.R.)", "Meet Me At Our Spot", "Fancy Like", "love nwantiti (ah ah ah)", "Still D.R.E.", "Numb Little Bug", "Bad Habits", "STAY (with Justin Bieber)", "Knife Talk (with 21 Savage ft. Project Pat)", "All Of You", "TO THE MOON", "Good Morning Gorgeous", "Cold Heart - PNAU Remix", "Light Switch", "By Your Side", "Never Say Never (with Lainey Wilson)", "she's all i wanna be", "Peru", "What Else Can I Do?", "Doin' This", "Worst Day", "good 4 u", "AHHH HA", "Big Energy", "Oh My God", "Easy On Me", "Smokin Out The Window", "Cigarettes", "I Wish", "abcdefu", "Never Wanted To Be That Girl", "Hrs and Hrs", "Do It To It", "Buy Dirt", "To Be Loved By You", "Me or Sum (feat. Future & Lil Baby)", "The Family Madrigal", "Heat Waves", "Shivers", "Heart On Fire", "Save Your Tears (with Ariana Grande) (Remix)", "The Joker And The Queen (feat. Taylor Swift)", "Come Back As A Country Boy", "Sacrifice", "I Hate YoungBoy", "Enemy (with JID) - from the series Arcane League of Legends", "Don't Play That", "Super Gremlin", "Woman", "I Love You So", "INDUSTRY BABY (feat. Jack Harlow)", "Boyfriend", "We Don't Talk About Bruno", "AA", "Surface Pressure", "If I Was a Cowboy", "pushin P (feat. Young Thug)", "One Mississippi", "Rocking A Cardigan in Atlanta", "Sand In My Boots", "City of Gods", "Dos Oruguitas", "Circles Around This Town", "Broadway Girls (feat. Morgan Wallen)", "Iffy", "Essence (feat. Justin Bieber & Tems)", "Home Sweet", "Beautiful Lies", "Beers On Me", "Usain Boo", "Levitating", "One Right Now (with The Weeknd)", "P power (feat. Drake)", "Fingers Crossed", "Pressure", "'Til You Can't", "Flower Shops (feat. Morgan Wallen)", "Waiting On A Miracle", "High")

song_title[nchar(song_title) < 11]

song_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vS8ynnfEAOH9G59D6ZS0EhW6X9taKBE2ou0Z6qO_XJUzwCuD_DjNvDNRNuouNivlgptmqyqBZYsrKTs/pub?gid=1515567882&single=true&output=csv")
arrange(song_data, track_name)$track_id

song_data <- filter(song_data, rand_var < 0.72)
nrow(song_data)

song_title <- c("Peru", "Broadway Girls (feat. Morgan Wallen)", "Do We Have A Problem?", "Boyfriend", "23", "Better Days (NEIKED x Mae Muller x Polo G)", "half of my hometown (feat. Kenny Chesney)", "Oh My God", "Never Say Never (with Lainey Wilson)", "Dos Oruguitas", "Sacrifice", "she's all i wanna be", "Me or Sum (feat. Future & Lil Baby)", "Numb Little Bug", "AA")

song_length <- c(187111, 185600, 207065, 153000, 179720, 160656, 231832, 225148, 176146, 214613, 188918, 206772, 225664, 169237, 189560)

song_popularity <- c(85, 85, 86, 94, 77, 90, 71, 93, 74, 86, 92, 92, 76, 89, 74)

song_data <- tibble(song_title, song_length, song_popularity)

song_data <- mutate(song_data, song_income = song_length * 0.03)

song_data$song_title_lower

song_data <- mutate(song_data, song_title_lower = str_to_lower(song_title)) %>% filter(str_detect(song_title_lower, "b"))
nrow(song_data)
