declaration_p <- function(DF) {

  mdo1 <- DF %>% dplyr::select(PATHOLOGIE,DATE_DECL_M) %>%
    tidyr::drop_na() %>%
    dplyr::group_by(PATHOLOGIE,DATE_DECL_M) %>%
    dplyr::summarise(nbr=sum(n() )) %>%
    tidyr::pivot_wider(names_from = DATE_DECL_M, values_from = nbr) %>%
    dplyr::mutate(janv=tidyr::replace_na(janv,0),
                  févr=tidyr::replace_na(févr,0),
                  mars=tidyr::replace_na(mars,0),
                  avr=tidyr::replace_na(avr,0),
                  mai=tidyr::replace_na(mai,0),
                  juin=tidyr::replace_na(juin,0),
                  juil=tidyr::replace_na(juil,0),
                  août=tidyr::replace_na(août,0),
                  sept=tidyr::replace_na(sept,0),
                  oct=tidyr::replace_na(oct,0),
                  nov=tidyr::replace_na(nov,0),
                  déc=tidyr::replace_na(déc,0),
                  TOT=janv+févr+mars+avr+mai+juin+juil+août+sept+oct+nov+déc) %>%
    dplyr::arrange(desc(TOT))

  mdo2 <- data.frame(
    PATHOLOGIE="Total",
    janv=sum(mdo1[,"janv"]),
    févr=sum(mdo1[,"févr"]),
    mars=sum(mdo1[,"mars"]),
    avr=sum(mdo1[,"avr"]),
    mai=sum(mdo1[,"mai"]),
    juin=sum(mdo1[,"juin"]),
    juil=sum(mdo1[,"juil"]),
    août=sum(mdo1[,"août"]),
    sept=sum(mdo1[,"sept"]),
    oct=sum(mdo1[,"oct"]),
    nov=sum(mdo1[,"nov"]),
    déc=sum(mdo1[,"déc"]),
    TOT=sum(mdo1[,"TOT"])
  )

  mdo3 <- rbind(mdo1,mdo2)
  knitr::kable(mdo3,
               col.names = c("Pathologie","janv","févr","mars","avr","mai","juin",
                             "juil","août","sept","oct","nov","déc","total"),
               caption = paste0(" Répartition des MDO "),
               align = "l")
}
