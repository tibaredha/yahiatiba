#' Title drh_str2
#'
#' @param djelfa_drh value
#'
#' @return value
#' @export
#'
#' @examples value
drh_str2 <- function(djelfa_drh) {
  epsp <- unique(djelfa_drh$structure)
  for (i in epsp) {
    cat("\\newpage")
    cat(paste0("### ",i))
    print(knitr::kable(yahiatiba::drh_str1(djelfa_drh,i), caption = paste0("Structure Sanitaire ",i)))
    cat('\n\n<!-- -->\n\n')
  }

}
