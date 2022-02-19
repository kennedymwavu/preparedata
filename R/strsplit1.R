#' Split a string
#'
#' @param .x A character vector of length 1.
#' @param .split What to split on.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- "alpha, omega, start, end"
#' strsplit1(x, ",")
strsplit1 <- function(.x, .split) {
  strsplit(x = .x, split = .split)[[1]]
}
