#' Title str.lit1_e_x
#'
#' @param DF  value
#' @param xeta vualue
#'
#' @return value
#' @export
#'
#' @examples value
str.lit1_e_x <- function(DF,xeta) {

  lit1_e_0 <- DF %>% select(ETA,SERVICE,UNITE,LT,LO) %>%
    dplyr::filter(ETA==xeta) %>%
    dplyr::mutate(DNL=LT-LO) %>%
    select(SERVICE,UNITE,LT,LO,DNL) #%>% view()

  lit2_e_0 <- data.frame(
    SERVICE = paste0("Total: ",nrow(lit1_e_0)),
    UNITE = sum(lit1_e_0[,"UNITE"]),
    LT = sum(lit1_e_0[,"LT"]),
    LO = sum(lit1_e_0[,"LO"]),
    DNL = sum(lit1_e_0[,"LT"])-sum(lit1_e_0[,"LO"])
  )

  lit3_e_0 <- rbind(lit1_e_0,lit2_e_0)
  rm(lit1_e_0,lit2_e_0)
  knitr::kable(lit3_e_0,
               #align = "lccccrrr",
               caption = paste0(" Nbr de lit par etablissement : ",xeta))

}
