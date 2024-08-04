#' Title str.lit_cs
#'
#' @param DF  value
#'
#' @return value
#' @export
#'
#' @examples value
str.lit_cs<- function(DF) {

  lit1_e <- DF %>% select(CS,ETA,SERVICE,UNITE,LT,LO) %>%
    group_by(CS) %>%
    summarise(T_SERVICE=n(),T_UNITE=sum(UNITE),T_LT=sum(LT),T_LO=sum(LO)) #%>% view()
  lit2_e <- data.frame(
    CS = paste0("Total: ",nrow(lit1_e)),
    T_SERVICE = sum(lit1_e[,"T_SERVICE"]),
    T_UNITE = sum(lit1_e[,"T_UNITE"]),
    T_LT = sum(lit1_e[,"T_LT"]),
    T_LO = sum(lit1_e[,"T_LO"])
  )
  lit2_x <- data.frame(  # a suprimé  en cas d'ajout des epsp  ????? !!!!!!
    CS = "Guettara",
    T_SERVICE = 0,
    T_UNITE = 0,
    T_LT = 0,
    T_LO = 0
  )
  lit3_e <- rbind(lit1_e,lit2_x,lit2_e)
  rm(lit1_e,lit2_e)
  knitr::kable(lit3_e,
               #align = "lccccrrr",
               caption = paste0(" Nbr de lit par Circonscription sanitaire "))
}
