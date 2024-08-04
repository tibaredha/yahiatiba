#' Title str.lit_com
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
str.lit_com <- function(DF) {

  lit1_e <- DF %>% select(COMMUNE,ETA,SERVICE,UNITE,LT,LO) %>%
    group_by(COMMUNE) %>%
    summarise(T_SERVICE=n(),T_UNITE=sum(UNITE),T_LT=sum(LT),T_LO=sum(LO)) #%>% view()
  lit2_e <- data.frame(
    COMMUNE = paste0("Total: ",nrow(lit1_e)),
    T_SERVICE = sum(lit1_e[,"T_SERVICE"]),
    T_UNITE = sum(lit1_e[,"T_UNITE"]),
    T_LT = sum(lit1_e[,"T_LT"]),
    T_LO = sum(lit1_e[,"T_LO"])
  )
  lit3_e <- rbind(lit1_e,lit2_e)
  rm(lit1_e,lit2_e)
  knitr::kable(lit3_e,
               #align = "lccccrrr",
               caption = paste0(" Nbr de lit par Communes "))
}
