# Copyright 2017-2018 John Gagnon
# This program is distributed under the terms of the GNU General Public License

#' Get path to readData example
#'
#' readData comes bundled with a example files in its `inst/app/www`
#' directory. This function makes them easy to access.
#' @import shiny
#' @import dplyr
#' @import googlesheets
#' @rawNamespace import(Hmisc, except = c(summarize, src))
#' @importFrom readr  write_csv read_csv
#' @importFrom tidyr gather spread
#' @importFrom stats na.omit
#' @param path Name of file. If `NULL`, the example files will be listed.
#' @return Located example excel file in package
#' @examples
#' readData_example(path = "antibodies.csv")
#' @export
readData_example <- function(path = NULL) {
  if (is.null(path)) {
    dir(system.file("app/www", package = "antibodySeek"))
  } else {
    system.file("app/www",
                path,
                package = "antibodySeek",
                mustWork = TRUE)
  }
}
