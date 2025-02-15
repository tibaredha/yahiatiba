#' mat_region
#'
#' @param mat value
#' @param wil value
#'
#' @return value
#' @export
#'
#' @examples mat_region
mat_region <- function(mat,wil) {
  mat0 <- mat %>%
    select(WILAYA,STRUCTURE,ID,DESIGNATION,NBR) %>%
    group_by(WILAYA,DESIGNATION) %>%
    summarise(TOT=sum(NBR)) %>%
    tidyr::pivot_wider(names_from = WILAYA, values_from = TOT) %>%
    #replace(is.na(.), 0) %>%
    mutate(TOT  = aindefla+djelfa+msila+laghouat+chlef) #%>%
  #select(DESIGNATION,EPH,EHS,EPSP,TOT) %>% view()


  mat1 <- data.frame(
    DESIGNATION="TOTAL",
    aindefla=sum(mat0[,"aindefla"]), #NBR=sum(mat0[,"NBR"])
    djelfa=sum(mat0[,"djelfa"]),
    msila=sum(mat0[,"msila"]),
    laghouat=sum(mat0[,"laghouat"]),
    chlef=sum(mat0[,"chlef"]),
    TOT=sum(mat0[,"TOT"])
  )

  mat2 <- rbind(mat0,mat1)

  knitr::kable(mat2,caption = "Etat des équipements médicaux en services par wilaya") #View()

}


# wil <- "djelfa"
# mat <- yahiatiba::mat
# mat_region (mat,wil)
#
#




