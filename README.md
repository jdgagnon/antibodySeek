
<!-- README.md is generated from README.Rmd. Please edit that file -->

# antibodySeek

*by **John D. Gagnon*** <br> *University of California, San Francisco*

### Table of Contents

**[Overview](#overview)**<br> **[Installation](#installation)**<br>
**[Usage](#usage)**<br> **[Session info](#session-info)**<br>
**[License](#license)**<br>

## Overview

A shinyapp-based GUI to identify available antibodies

## Installation

1.  If you do not already have R installed, or your version is out of
    date, download and install the latest
    [version](https://cran.r-project.org).

<!-- end list -->

  - Optionally, install the latest version of [RStudio
    Desktop](https://www.rstudio.com/products/rstudio/#Desktop).

<!-- end list -->

2.  Download the package from GitHub

<!-- end list -->

``` r
install.packages("devtools")
devtools::install_github("jdgagnon/antibodySeek")
```

## Usage

Load the package into the R session.

`library(antibodySeek)`

To initialize the shiny app, paste the following code in your R console
and run it.

`antibodySeek()`

1.  Load a spreadsheet containing the antibody database:

<!-- end list -->

  - Spreadsheet must be in the following format:

| Antibody | PE | FITC | etc… |
| :------- | :- | :--- | :--- |
| CD3      | X  |      |      |
| CD4      |    | X    | X    |
| CD8      | X  | X    | X    |

  - Use the file browser to select a `csv` file

OR

  - Load a spreadsheet from `Google Sheets` by filling out the
    spreadsheet name and clicking `Find Google Sheet`.

  - Choose the approprate worksheet

<!-- end list -->

2.  Select the antibodies from the dropdown menu that you wish to use.

## Session info

Here is the output of `sessionInfo()` on the system on which this
package was developed:

``` r
sessionInfo()
#> R version 3.5.1 (2018-07-02)
#> Platform: x86_64-apple-darwin17.6.0 (64-bit)
#> Running under: macOS High Sierra 10.13.6
#> 
#> Matrix products: default
#> BLAS: /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
#> LAPACK: /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLAPACK.dylib
#> 
#> locale:
#> [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> loaded via a namespace (and not attached):
#>  [1] compiler_3.5.1  backports_1.1.2 magrittr_1.5    rprojroot_1.3-2
#>  [5] tools_3.5.1     htmltools_0.3.6 yaml_2.2.0      Rcpp_0.12.18   
#>  [9] stringi_1.2.4   rmarkdown_1.10  highr_0.7       knitr_1.20     
#> [13] stringr_1.3.1   digest_0.6.17   evaluate_0.11
```

<br><br>

## License

[GNU GPL-3.0-or-later](https://www.gnu.org/licenses/gpl.txt)
