#' Title decpta_pathologie
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
decpta_pathologie <- function(DF) {

  mdota <- DF %>% dplyr::select(EPSP,AGE,SEXE,PATHOLOGIE,COMMUNE) %>%
    dplyr::mutate(AGE = dplyr::coalesce(AGE, 0)) %>% #drop_na() %>%
    dplyr::mutate(clage=cut(AGE,
                            c(0,10,20,30,40,50,60,70,80,90,200),
                            include.lowest = TRUE,
                            labels = c("00-10",
                                       "10-20",
                                       "20-30",
                                       "30-40",
                                       "40-50",
                                       "50-60",
                                       "60-70",
                                       "70-80",
                                       "80-90",
                                       "90-100"
                            ))) %>%
    dplyr::group_by(clage,PATHOLOGIE) %>%
    dplyr::summarise(nbr=n()) %>%
    tidyr::pivot_wider(names_from = clage, values_from = nbr) %>%
    dplyr::mutate(`00-10`=tidyr::replace_na(`00-10`,0),
                  `10-20`=tidyr::replace_na(`10-20`,0),
                  `20-30`=tidyr::replace_na(`20-30`,0),
                  `30-40`=tidyr::replace_na(`30-40`,0),
                  `40-50`=tidyr::replace_na(`40-50`,0),
                  `50-60`=tidyr::replace_na(`50-60`,0),
                  `60-70`=tidyr::replace_na(`60-70`,0),
                  `70-80`=tidyr::replace_na(`70-80`,0),
                  `80-90`=tidyr::replace_na(`80-90`,0),
                  `90-100`=tidyr::replace_na(`90-100`,0)
    ) %>%
    dplyr::mutate(TOT=`00-10`+`10-20`+`20-30`+`30-40`+`40-50`+
                    `50-60`+`60-70`+`70-80`+`80-90`+`90-100`) #%>%
  #select(clage,M,F,TOT,SRMF)

  mdota1 <- data.frame(
    PATHOLOGIE="Total",
    "00-10"=sum(mdota[,"00-10"]),
    "10-20"=sum(mdota[,"10-20"]),
    "20-30"=sum(mdota[,"20-30"]),
    "30-40"=sum(mdota[,"30-40"]),
    "40-50"=sum(mdota[,"40-50"]),
    "50-60"=sum(mdota[,"50-60"]),
    "60-70"=sum(mdota[,"60-70"]),
    "70-80"=sum(mdota[,"70-80"]),
    "80-90"=sum(mdota[,"80-90"]),
    "90-100"=sum(mdota[,"90-100"]),
    TOT=sum(mdota[,"TOT"])
    # SRMF=round(sum(mdota[,"M"])/sum(mdota[,"F"]),2)
  )
  mdota1 <-  mdota1 %>% rename("00-10"=X00.10,
                               "10-20"=X10.20,
                               "20-30"=X20.30,
                               "30-40"=X30.40,
                               "40-50"=X40.50,
                               "50-60"=X50.60,
                               "60-70"=X60.70,
                               "70-80"=X70.80,
                               "80-90"=X80.90,
                               "90-100"=X90.100
  )
  mdota2 <- rbind(mdota,mdota1)
  knitr::kable(mdota2,
               #align = "lccccccccccr",
               caption = paste0(" Déclaration par tranche d'age et pathologie"))


}
