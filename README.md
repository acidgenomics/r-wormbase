# worminfo

[![Build Status](https://travis-ci.org/steinbaugh/worminfo.svg?branch=master)](https://travis-ci.org/steinbaugh/worminfo)
[![Project Status: Suspended – Initial development has started, but there has not yet been a stable, usable release; work has been stopped for the time being but the author(s) intend on resuming work.](http://www.repostatus.org/badges/latest/suspended.svg)](http://www.repostatus.org/#suspended)

*C. elegans* genome annotations assembled from [WormBase](http://www.wormbase.org), [Ensembl](http://www.ensembl.org/Caenorhabditis_elegans), and [PANTHER](http://pantherdb.org). RNAi clone mapping support for [ORFeome](http://worfdb.dfci.harvard.edu) and [Ahringer](http://www.us.lifesciences.sourcebioscience.com/clone-products/non-mammalian/c-elegans/c-elegans-rnai-library/) libraries.

## Installation

This is an [R](https://www.r-project.org) package.

[`devtools`](https://cran.r-project.org/package=devtools) is required to install the latest version directly from GitHub:

``` r
install.packages("devtools")
devtools::install_github("steinbaugh/worminfo", build_vignettes = TRUE)
```

Instructions on how to use the functions in this package are available as vignettes:

``` r
browseVignettes("worminfo")
```
