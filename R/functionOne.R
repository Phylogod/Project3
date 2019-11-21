#' Queries data from genbank.
#' 
#' Each object listed in the list is searched inside genbank and all availble data
#' is converted into a dataframe containg an assortment of topics for each data input. 
#' 
#' @import rgbif
#' @param taxalist A list containing mulitple species and genus names you would like to query genbank for data for. 
#' @return megataxa A dataframe of all the species or genus you searched for and their associated data.
#' @export query_id4 

query_id4 <- function(taxalist) {
  ids <-c()
  for (taxa in taxalist){
    print(taxa)
    raw <- rgbif::name_suggest(taxa)
    print(raw)
    ids[taxa] <- c(raw$key)
  }
  taxa_occurrences <- lapply(ids, rgbif::occ_search, return = "data")
  mega_taxa <- dplyr::bind_rows(taxa_occurrences, .id = "column_labels")
  return(mega_taxa)
}
