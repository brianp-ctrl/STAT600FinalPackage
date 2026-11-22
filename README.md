
# STAT600FinalPackage

<!-- badges: start -->
<!-- badges: end -->

The goal of STAT600FinalPackage is to provide visualization tools for functional
regression models fitted with `refund::pffr()`. Its main function, `individual_pffr_plt()`, 
generates `ggplot2` trajectories comparing each subject's observed functional response against model-predicted curves—with 
options to include or exclude subject-level random effects (`include_re`), filter to specific individuals (`id`), and export plots directly to disk (`where_to_save`).

## Installation

You can install the development version of STAT600FinalPackage from [GitHub](https://github.com/brianp-ctrl/STAT600FinalPackage.git) with:

``` r
# install.packages("devtools")
devtools::install_github("brianp-ctrl/STAT600FinalPackage")
```

## What is left to finish
I need to finish up my tests, and I also plan to add vignette, so I need to work on that.
I also am thinking about adding another function, but i am not sure. Finally, I need to 
finish up doing documentations.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(STAT600FinalPackage)
## basic example code
```

