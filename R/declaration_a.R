#' Title declaration_a
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
declaration_a <- function(DF) {

  N <- nrow(DF)
  mdo1 <- DF %>% dplyr::select(DATE_DECL_Y,DATE_DECL_M) %>%
    #dplyr::mutate(DATE_DECL_Y=as.character(DATE_DECL_Y)) %>%
    tidyr::drop_na() %>%
    dplyr::group_by(DATE_DECL_Y,DATE_DECL_M) %>%
    dplyr::summarise(nbr=sum(n() )) %>%
    tidyr::pivot_wider(names_from = DATE_DECL_M, values_from = nbr) %>%
    dplyr::mutate(janv=tidyr::replace_na(janv,0),
                  fevr=tidyr::replace_na(fevr,0),
                  mars=tidyr::replace_na(mars,0),
                  avr=tidyr::replace_na(avr,0),
                  mai=tidyr::replace_na(mai,0),
                  juin=tidyr::replace_na(juin,0),
                  juil=tidyr::replace_na(juil,0),
                  aout=tidyr::replace_na(aout,0),
                  sept=tidyr::replace_na(sept,0),
                  oct=tidyr::replace_na(oct,0),
                  nov=tidyr::replace_na(nov,0),
                  dec=tidyr::replace_na(dec,0),
                  TOT=janv+fevr+mars+avr+mai+juin+juil+aout+sept+oct+nov+dec,
                  PC= round((TOT/N)*100,3))

  mdo2 <- data.frame(
    DATE_DECL_Y="Total",
    janv=sum(mdo1[,"janv"]),
    fevr=sum(mdo1[,"fevr"]),
    mars=sum(mdo1[,"mars"]),
    avr=sum(mdo1[,"avr"]),
    mai=sum(mdo1[,"mai"]),
    juin=sum(mdo1[,"juin"]),
    juil=sum(mdo1[,"juil"]),
    aout=sum(mdo1[,"aout"]),
    sept=sum(mdo1[,"sept"]),
    oct=sum(mdo1[,"oct"]),
    nov=sum(mdo1[,"nov"]),
    dec=sum(mdo1[,"dec"]),
    TOT=sum(mdo1[,"TOT"]),
    PC=round(sum(mdo1[,"PC"]),0)
  )

  mdo3 <- rbind(mdo1,mdo2)
  knitr::kable(mdo3,
               col.names = c("Années","janv","fevr","mars","avr","mai","juin",
                             "juil","aout","sept","oct","nov","dec","total","PC"),
               caption = paste0(" Répartition des declaration MDO "),
               align = "cccccccccccccrr")
}
