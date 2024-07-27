#' Title mdots
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
mdots <- function(DF) {

  z <- DF %>% dplyr::select(DATE_DECL_Y,DATE_DECL_M) %>%
    dplyr::mutate(DATE_DECL_M = recode(DATE_DECL_M,
                                       "janv"="01",
                                       "fevr"="02",
                                       "mars"="03",
                                       "avr"="04",
                                       "mai"="05",
                                       "juin"="06",
                                       "juil"="07",
                                       "aout"="08",
                                       "sept"="09",
                                       "oct"="10",
                                       "nov"="11",
                                       "dec"="12" )) %>%

    dplyr::mutate(datets=paste(DATE_DECL_Y,"-",DATE_DECL_M)) %>%
    dplyr::group_by(datets) %>%
    dplyr::summarise(nbr=sum(n())) #%>%

  ts1 <- ts(z, start = 2018, frequency=12)
  ts2 <- ts1[,2]
  plot(ts2)
}
