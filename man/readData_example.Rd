% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readData_example.R
\name{readData_example}
\alias{readData_example}
\title{Get path to readData example}
\usage{
readData_example(path = NULL)
}
\arguments{
\item{path}{Name of file. If `NULL`, the example files will be listed.}
}
\value{
Located example excel file in package
}
\description{
readData comes bundled with a example files in its `inst/app/www`
directory. This function makes them easy to access.
}
\examples{
readData_example(path = "antibodies.csv")
}
