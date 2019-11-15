#' Queries data from genbank.
#' 
#' Each object listed in the list is searched inside genbank and all availble data
#' is converted into a dataframe containg an assortment of topics for each data input. 
#' 
#' 
#' @param taxalist A list containing mulitple species and genus names you would like to query genbank for data for. 
#' @return megataxa A dataframe of all the species or genies you searched for and their associated data.
#' @export query_id4 






#To set your environment and have the correct functions, you should install the packages listed below.
install.packages("rgbif")
install.packages("tidyverse")
library(rgbif)
library(tidyverse)
#To use this function you must first develop a list of taxa that you want to search data for! Listed below is my example. Whatever you define this list will be the input after the function is defined.
penguins <- c("Eudyptes chrysolophus", "Eudyptes filholi", "Eudyptes chrysocome", "Eudyptes moseleyi", "Eudyptes pachyrhynchus")
#The function below is used to query the data based of the list you provide! The data will then be combined into a large dataframe.
query_id4 <- function(taxalist) {
  ids <-c()
  for (taxa in taxalist){
    print(taxa)
    raw <- name_suggest(taxa)
    print(raw)
    ids[taxa] <- c(raw$key)
  }
  taxa_occurrences <- lapply(ids, occ_search, return = "data")
  mega_taxa <- bind_rows(taxa_occurrences, .id = "column_labels")
  return(mega_taxa)
}
#After defining your function, you can now use the function based of the list you defined taxa list. I used "penguins".
query_id4(penguins)
#You can define that resulting data frame created to a varible to view as a data frame!
penguin_df <- query_id4(penguins)
#In our case our "mega_taxa" data frame will be called "penguin_df"
View(penguin_df)
#Recommendations for later data use, would be to filter "mega_taxa" data frame that contains only the columns you need.