install.packages("rgbif")
install.packages("tidyverse")
install.packages("leaflet")
library(rgbif)
library(leaflet)
library(tidyverse)
penguins <- c("Eudyptes chrysolophus", "Eudyptes filholi", "Eudyptes chrysocome", "Eudyptes moseleyi", "Eudyptes pachyrhynchus")

ids <-c()
for (penguin in penguins){
  print(penguin)
  raw <- name_suggest(penguin)
  print(raw)
  ids[penguin] <- c(raw$key)
}

pen_occurrences <- lapply(ids, occ_search, return = "data")


mega_pen <- bind_rows(pen_occurrences, .id = "column_labels")