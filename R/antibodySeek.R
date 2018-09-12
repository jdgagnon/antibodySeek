# Copyright 2017-2018 John Gagnon
# This program is distributed under the terms of the GNU General Public License

#' A function to run the antibodySeek shiny app
#'
#' This function runs the antibodySeek app
#' @import shiny
#' @import dplyr
#' @import googlesheets
#' @rawNamespace import(Hmisc, except = c(summarize, src))
#' @importFrom readr  write_csv read_csv
#' @importFrom tidyr gather spread
#' @importFrom stats na.omit
#' @return Table antibodies and the fluorophores available in the Ansel Lab
#' @param ... Any argument that you can pass to shiny::runApp
#' @examples
#' # antibodySeek()
#' @return Runs the antibodySeek shiny app.
#' @export
antibodySeek <- function(...)
{
  appDir <- system.file("app", package = "antibodySeek")
  if (appDir == "") {
    stop("Could not find directory. Try re-installing antibodySeek",
         call. = FALSE)
  }
  shiny::runApp(appDir, launch.browser = TRUE, ...)
}
