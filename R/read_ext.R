#' Title readext
#'
#' @param path value
#'
#' @return value
#' @export
#'
#' @examples value
read_ext <- function(path = NULL) {
  pkgname <- "yahiatiba"
  if (is.null(path)) {
    dir(system.file("extdata", package = pkgname))
  } else {
    system.file("extdata", path, package = pkgname, mustWork = TRUE)
  }
}
