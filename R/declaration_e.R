#' Title declaration_e
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
declaration_e <- function(DF) {

  N <- nrow(DF)
  str1 <- DF %>%
    dplyr::select(EPSP,SEXE) %>%
    dplyr::group_by(EPSP,SEXE) %>%
    dplyr::summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = SEXE, values_from = tot) %>%
    dplyr::mutate(M=tidyr::replace_na(M,0),F=tidyr::replace_na(F,0),tot=F+M) %>%
    dplyr::mutate(TOT=F+M,
                  SRMF = round(M/F,2),
                  PC = round((TOT/N)*100,3)) %>%
    dplyr::select(EPSP,M,F,TOT,SRMF,PC) %>%
    dplyr::arrange(desc(TOT))
  str2 <- data.frame(
    EPSP="Total",
    M=sum(str1[,"M"]),
    F=sum(str1[,"F"]),
    TOT=sum(str1[,"TOT"]),
    SRMF=round(sum(str1[,"M"])/sum(str1[,"F"]),2),
    PC=round(sum(str1[,"PC"]),0)
  )
  str3 <- rbind(str1,str2)
  knitr::kable(str3,
               col.names = c("EPSP","M","F","N","Sex-ratio","‰"),#p/1000=alt+0137
               align = "lcccrr",
               caption = paste0(" Déclaration MDO par EPSP et Sexe "))

}
