#' Title declaration_c
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
declaration_c <- function(DF) {

  str1 <- DF %>%
    dplyr::select(COMMUNE,SEXE) %>%
    dplyr::group_by(COMMUNE,SEXE) %>%
    dplyr::summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = SEXE, values_from = tot) %>%
    dplyr::mutate(M=tidyr::replace_na(M,0),F=tidyr::replace_na(F,0),tot=F+M) %>%
    dplyr::mutate(TOT=F+M,
                  SRMF=round(M/F,2)) %>%
    dplyr::select(COMMUNE,M,F,TOT,SRMF) %>%
    dplyr::arrange(desc(TOT))
  str2 <- data.frame(
    COMMUNE="Total",
    M=sum(str1[,"M"]),
    F=sum(str1[,"F"]),
    TOT=sum(str1[,"TOT"]),
    SRMF=round(sum(str1[,"M"])/sum(str1[,"F"]),2)
  )
  str3 <- rbind(str1,str2)
  knitr::kable(str3,align = "lcccc",caption = paste0(" Déclaration MDO par Commune et Sexe "))

}
