
<!-- README.md is generated from README.Rmd. Please edit that file -->

# preparedata

<!-- badges: start -->

[![R-CMD-check](https://github.com/kennedymwavu/preparedata/workflows/R-CMD-check/badge.svg)](https://github.com/kennedymwavu/preparedata/actions)
[![Codecov test
coverage](https://codecov.io/gh/kennedymwavu/preparedata/branch/master/graph/badge.svg)](https://app.codecov.io/gh/kennedymwavu/preparedata?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/preparedata)](https://CRAN.R-project.org/package=preparedata)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Functions to make data preparation easier. Preparing data entails
putting your column and row names (if any) in the required format,
dealing with missing values, making sure each column is of the required
type.

## Installation

You can install the development version of preparedata from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kennedymwavu/preparedata")
```

## Example

A fairly common task when dealing with strings is the need to split a
string. This is what `base::strsplit()` and `stringr::str_split()` do.

``` r
(x <- "a, b, c")
#> [1] "a, b, c"

strsplit(x = x, split = ", ")
#> [[1]]
#> [1] "a" "b" "c"

stringr::str_split(string = x, pattern = ", ")
#> [[1]]
#> [1] "a" "b" "c"
```

Notice how the return value is a **list** of length 1, where the first
element holds the character vector. Often, the shape of this output is
inconvenient, ie. we want the unlisted version.

That’s exactly what `preparedata::str_split_one()` does:

``` r
library(preparedata)

str_split_one(string = x, pattern = ", ")
#> [1] "a" "b" "c"
```

Use `str_split_one()` when the input is known to be a single string. For
safety, it will error when its input has a length greater than one.

``` r
str_split_one(string = c("a,b", "b,c"), pattern = ",")
```

> Error in str_split_one(string = c(“a,b”, “b,c”), pattern = “,”) :
> length(string) \<= 1 is not TRUE

`str_split_one()` is built on top of `stringr::str_split()`, so you can
use it’s `n` argument and `stringr`’s general interface for describing
the pattern to be matched.

``` r
(x <- "a,b,c")
#> [1] "a,b,c"
str_split_one(string = x, pattern = ",", n = 2)
#> [1] "a"   "b,c"

(y <- "192.168.0.1")
#> [1] "192.168.0.1"
str_split_one(string = y, pattern = stringr::fixed("."))
#> [1] "192" "168" "0"   "1"
```
