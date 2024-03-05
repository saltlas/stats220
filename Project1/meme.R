library(magick)

# top section of meme including text and bullet points
top_section <- image_blank(width = 500, 
                           height = 400, 
                           color = "#DEF1F7") %>%
  image_annotate(text = "STOP DOING R",
                 color = "#000000",
                 size = 50,
                 font = "Segoe UI",
                 gravity = "north",
                 weight = "700") %>%
  
  image_annotate(text = "• IMAGES WERE NOT SUPPOSED TO BE EASY TO GENERATE\n",
                 location = "+40+70",
                 color = "#000000",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "northwest",
                 weight = "400") %>%
  
  image_annotate(text = "• YEARS OF GRAPHICS TECH yet NO REAL-WORLD USE FOUND for\ndoing better than MS PAINT\n",
                 location = "+40+110",
                 color = "#000000",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "northwest",
                 weight = "400") %>%
  
  image_annotate(text = "• Wanted to go higher anyway for a laugh? We had a tool for\nthat: It was called \"USING MS OFFICE PRODUCTS AND \nBURSTING INTO TEARS\"\n",
                 location = "+40+170",
                 color = "#000000",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "northwest",
                 weight = "400") %>%
  
  image_annotate(text = "• \"Yes please give me %>% of something. Please start counting\nyour list indices from ONE.\" - Statements dreamed up by the\nutterly Deranged",
                 location = "+40+250",
                 color = "#000000",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "northwest",
                 weight = "400") %>%
  
  image_annotate(text = "LOOK at what Statisticians have been demanding your Respect for\nall this time, with all the Python & Google Sheets we built for them",
                 location = "+20+330",
                 color = "#000000",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "northwest",
                 weight = "400") %>% 
  
  image_annotate(text = "(This is REAL R done by REAL R Programmers)",
                 location = "+0+380",
                 color = "#000000",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "north",
                 weight = "700") 



# mid section of meme uses 3 images, which i then append to create the mid section of the meme to be stacked later
mid1 <- image_read("https://pbs.twimg.com/media/GHzYqFNXwAA2fTS?format=jpg&name=4096x4096") %>%
  image_scale("x4096") %>%
  image_crop("0x1000+0+0") %>%
  image_scale("170x150!") %>%
  image_border("#DEF1F7", "15x20") %>%
  image_annotate(text = "???????????",
                 color = "#FE4748",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "south",
                 weight = "700") 

mid2 <- image_read("https://www.shutterstock.com/shutterstock/photos/1030308751/display_1500/stock-photo-r-keyboard-key-button-press-type-close-up-macro-desktop-laptop-computer-black-silver-detail-1030308751.jpg") %>%
  image_scale("150x150!") %>%
  image_border("#DEF1F7", "25x20") %>%
  image_annotate(text = "????????",
                 color = "#FE4748",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "south",
                 weight = "700") 

mid3 <- image_read("https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Normal_distribution_50%25_CI_illustration.svg/1200px-Normal_distribution_50%25_CI_illustration.svg.png") %>%
  image_scale("150x150!") %>%
  image_border("#DEF1F7", "25x20") %>%
  image_annotate(text = "????",
                 color = "#FE4748",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "south",
                 weight = "700") 

mid_section <- image_append(c(mid3, mid2, mid1)) %>%
  image_scale(500)


# bottom section involves some more text and an image in the middle

apples_img <- image_read("https://cdn.discordapp.com/attachments/896269789142601728/1214098864064172053/image.png?ex=65f7e0ae&is=65e56bae&hm=90f9aa8eac3417bd5e375f53fe656c79b86ef61a9e7ed4bf4059cf7361103e1b&") %>%
  image_scale("190x20!")

bottom_section <- image_blank(width = 500, 
                              height = 50, 
                              color = "#DEF1F7") %>%
  image_annotate(text = "\"Hello I would like",
                 location = "+10",
                 color = "#000000",
                 size = 20,
                 font = "Segoe UI",
                 gravity = "northwest",
                 weight = "400") %>%
  image_annotate(text = "apples please\"",
                 location="+10",
                 color = "#000000",
                 size = 20,
                 font = "Segoe UI",
                 gravity = "northeast",
                 weight = "400") %>%
  image_annotate(text = "They have played us for absolute fools",
                 color = "#000000",
                 size = 15,
                 font = "Segoe UI",
                 gravity = "south",
                 weight = "700") %>%
  image_composite(apples_img,
                  offset = "+170+5")

# stacking all three sections on top of each other
final_meme <- image_append(c(top_section, mid_section, bottom_section), stack = TRUE)

image_write(final_meme, "my_meme.png")

# animation part, i'm giving it legs and arms (idk)
leg <- image_read("https://em-content.zobj.net/source/emojione/211/leg_1f9b5.png") %>%
  image_scale(90)

arm <- image_read("https://www.clker.com/cliparts/B/S/n/E/q/F/frog-green-right-arm-hi.png") %>%
  image_scale(80)

# generating different orientations for the arms for diff frames
arm1 <- arm
arm2 <- image_rotate(arm, 10) %>%
  image_transparent("white")
arm3 <- image_rotate(arm, 20) %>%
  image_transparent("white")
arm4 <- image_rotate(arm, -10) %>%
  image_transparent("white")
arm5 <- image_rotate(arm, -20) %>%
  image_transparent("white")

arms <- c(arm1, arm2, arm3, arm2, arm1, arm4, arm5, arm4)
arm_gif <- image_animate(arms)

# same thing for legs
leg1 <- leg
leg2 <- image_rotate(leg, 10) %>%
  image_transparent("white")
leg3 <- image_rotate(leg, 20) %>%
  image_transparent("white")
leg4 <- image_rotate(leg, -10) %>%
  image_transparent("white")
leg5 <- image_rotate(leg, -20) %>%
  image_transparent("white")

legs <- c(leg1, leg2, leg3, leg2, leg1, leg4, leg5, leg4)
leg_gif <- image_animate(legs)

# copy of the meme with a border for space for the limbs
blank <- image_border(final_meme, "white", "70x70") 

# placeholder initialization for the vector of frames
frames

for (frame in 1:8){
  # generating the gifs individually and then composite-ing them together gave me 4096 frames so we're doing it this way
  current_frame <- image_composite(anim, legs[frame], offset="+0+650") %>%
    image_composite(image_flop(legs[frame]), offset="+550+650") %>%
    image_composite(image_flop(arms[frame]), offset="+0+100") %>%
    image_composite(arms[frame], offset="+550+100")
  frames <- c(frames, current_frame)
}

final_gif <- image_animate(frames)
final_gif
image_write(final_gif, "my_animation.gif")



