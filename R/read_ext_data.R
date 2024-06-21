#' read ext data create path to
#'
#' @param pkgname  value
#' @param path     value
#'
#' @return         value
#' @export
#'
#' @examples   value
read_ext_data <- function(pkgname,path = NULL) {
  #pkgname <- "yahiatiba"
  if (is.null(path)) {
    dir(system.file("extdata", package = pkgname))
  } else {
    system.file("extdata", path, package = pkgname, mustWork = TRUE)
  }
}

