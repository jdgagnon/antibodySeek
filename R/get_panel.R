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
#' @importFrom readr  write_csv
#' @importFrom tidyr gather spread
#' @param spreadsheet spreadsheet of antibodies
#' @param antibodies list of antibodies to search for
#' @return Table antibodies and the fluorophores available in the Ansel Lab
#' @examples
#' get_panel(antibodies)
#' @export
get_panel <- function(spreadsheet = NULL, antibodies = NULL){
  db <- spreadsheet
  panel <- db %>%
    dplyr::filter(Antibodies %in% antibodies) %>%
    na.omit(.) %>%
    tidyr::spread(Fluorophore, value)
  return(panel)
}