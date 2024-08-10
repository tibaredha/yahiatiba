#' Title drh_grades
#'
#' @param drh  value
#'
#' @return value
#' @export
#'
#' @examples value
drh_grades <- function(drh) {

  grd1 <- drh %>%
    dplyr::select(grade,sexe) %>%
    dplyr::group_by(grade,sexe) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = sexe, values_from = tot) %>%
    dplyr::mutate(
      homme=replace_na(homme,0),
      femme=replace_na(femme,0),
      TOT=femme+homme) %>%
    select(grade,homme,femme,TOT) %>%
    arrange(grade)

  grd2 <- data.frame(
    grade="Total",
    homme=sum(grd1[,"homme"]),
    femme=sum(grd1[,"femme"]),
    TOT=sum(grd1[,"TOT"])
  )

  grd3 <- rbind(grd1,grd2)
  knitr::kable(grd3)
}
