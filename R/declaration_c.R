#' Title declaration_c
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
declaration_c <- function(DF,POPMDO) {

  N <- nrow(DF)
  str1 <- DF %>%
    dplyr::select(COMMUNE,SEXE) %>%
    dplyr::group_by(COMMUNE,SEXE) %>%
    dplyr::summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = SEXE, values_from = tot) %>%
    dplyr::mutate(M=tidyr::replace_na(M,0),F=tidyr::replace_na(F,0),tot=F+M) %>%
    dplyr::mutate(TOT=F+M,
                  SRMF=round(M/F,2),
                  PC= round((TOT/N)*100,3)) %>%
    dplyr::select(COMMUNE,M,F,TOT,SRMF,PC) %>%
    dplyr::arrange(desc(TOT))

  str1 <- merge(x = str1 , y = POPMDO, by.x = "COMMUNE", by.y = "COMMUNE")
  str1 <- str1 %>% dplyr::select(COMMUNE,M,F,TOT,SRMF,PC,POP) %>%
    dplyr::mutate(ICD = round((TOT/POP)*1000,2)) %>%
    dplyr::arrange(desc(ICD)) %>%
    dplyr::select(COMMUNE,M,F,TOT,SRMF,PC,PC,POP,ICD)
  str2 <- data.frame(
    COMMUNE = "Total",
    M = sum(str1[,"M"]),
    F = sum(str1[,"F"]),
    TOT = sum(str1[,"TOT"]),
    SRMF = round(sum(str1[,"M"])/sum(str1[,"F"]),2),
    PC = round(sum(str1[,"PC"]),0),
    POP = sum(str1[,"POP"]),
    ICD = round(sum(str1[,"TOT"])/sum(str1[,"POP"]),2)
  )
  str3 <- rbind(str1,str2)
  knitr::kable(str3,
               align = "lccccrrr",
               caption = paste0(" Déclaration MDO par Commune et Sexe "))

}
