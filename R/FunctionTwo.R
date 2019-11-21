#' Mapping queried data on a global map
#'
#' Data available in the table is filtered and mapped based of longitude and latitude on a global map that interactively changes based on your zoom.
#'
#'@param penguin_df a data frame contianing scientificName, decimal latitude, and decimal longitude
#'@export

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
