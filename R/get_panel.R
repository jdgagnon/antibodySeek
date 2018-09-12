# Copyright 2017-2018 John Gagnon
# This program is distributed under the terms of the GNU General Public License

#' A function to create table of antibodies
#'
#' This function takes a list of antibodies and returns a table of fluorophores
#' for each antibody that are available in the Ansel lab
#' @import shiny
#' @import dplyr
#' @import googlesheets
#' @rawNamespace import(Hmisc, except = c(summarize, src))
#' @importFrom readr  write_csv read_csv
#' @importFrom tidyr gather spread
#' @importFrom stats na.omit
#' @param spreadsheet spreadsheet of antibodies
#' @param antibodies list of antibodies to search for
#' @return Table antibodies and the fluorophores available in the Ansel Lab
#' @examples
#' file <- antibodySeek::readData_example(path = "antibodies.csv")
#' spreadsheet <- readr::read_csv(file, col_names = TRUE)
#' spreadsheet <- tidyr::gather(spreadsheet,
#' Fluorophore, 
#' value, 
#' -Antibodies)
#' spreadsheet$Fluorophore <- factor(spreadsheet$Fluorophore,
#' levels = unique(spreadsheet$Fluorophore))
#' antibodies <- c("CD3", "CD4", "CD8", "Foxp3")
#' antibodySeek::get_panel(spreadsheet, antibodies)
#' @export
get_panel <- function(spreadsheet = NULL, antibodies = NULL){
  db <- spreadsheet
  panel <- db %>%
    dplyr::filter(Antibodies %in% antibodies) %>%
    na.omit(.) %>%
    tidyr::spread(Fluorophore, value)
  return(panel)
}