#' Title drh_str1
#'
#' @param drh  value
#' @param x  value
#'
#' @return value
#' @export
#'
#' @examples value
drh_str1 <- function(drh,x) {

  str11 <- drh %>%
    dplyr::select(structure,grade,sexe) %>%
    dplyr::filter(structure==x) %>%
    dplyr::group_by(grade,sexe) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = sexe, values_from = tot) %>%
    dplyr::mutate(homme=replace_na(homme,0),femme=replace_na(femme,0),TOT=femme+homme) %>%
    dplyr::select(grade,homme,femme,TOT)
  str22 <- data.frame(
    grade="Total",
    homme=sum(str11[,"homme"]),
    femme=sum(str11[,"femme"]),
    TOT=sum(str11[,"TOT"])
  )
  str33 <- rbind(str11,str22)
  return(str33)
}
