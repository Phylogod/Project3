#The packages below will be used to organize the appropriate data as well as visualize the data of choice. In this example we will be visualizing the data frame in terms of their global positions.
#They will be grouped and the map created is interactive based on your zoom.
install.packages("tidyverse")
install.packages("leaflet")
library(leaflet)
library(tidyverse)
# You can define the function below. The parameters of this function require Scientific Name, Latitude, and Longitude to be in the dataframe.

visualize_taxa <- function(penguin_df) {
  mega_taxafilt <- select(penguin_df, scientificName, decimalLatitude, decimalLongitude)
  mega_taxavis <-mega_taxafilt %>%
    group_by(decimalLatitude) %>% 
    mutate(n_areas = n()) %>% 
    leaflet() %>% 
    addTiles() %>% 
    addCircleMarkers(~decimalLongitude, ~decimalLatitude, radius = ~n_areas, color = c("green"))
  mega_taxavis
}
#Using the function defined above, input the dataframe that has the appropairte paramaters to create a mapping of the specimen locations.
#Required fields in the data table include scientificName, decimalLatitude, and decimalLongitude.
visualize_taxa(penguin_df)
# Example I inputed my "penguin_df" data table contain the neccesary parameters, into my defined functions.