#' Split a string
#'
#' @param string A character vector of length 1.
#' @inheritParams stringr::str_split
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- "alpha, omega, start, end"
#' str_split_one(string = x, pattern = ", ")
#'
#' y <- "192.168.0.1"
#' str_split_one(string = y, pattern = stringr::fixed("."))
str_split_one <- function(string, pattern, n = Inf) {
  stopifnot(is.character(string), length(string) <= 1)
  if (length(string) == 1) {
    stringr::str_split(string = string, pattern = pattern, n = n)[[1]]
  } else {
    character()
  }
}
