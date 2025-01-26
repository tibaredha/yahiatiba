#' mat_aindefla
#'
#' @param mat value
#' @param wil value
#'
#' @return value
#' @export
#'
#' @examples mat_aindefla
mat_aindefla <- function(mat,wil) {
  wilaya_mat0 <- mat %>%
    dplyr::filter(WILAYA==wil) %>% #view()
    select(STRUCTURE,ID,DESIGNATION,NBR) %>%
    group_by(STRUCTURE,DESIGNATION) %>%
    summarise(TOT=sum(NBR)) %>%
    tidyr::pivot_wider(names_from = STRUCTURE, values_from = TOT) %>%
    replace(is.na(.), 0) %>%
    mutate(CHU  = 0 ) %>%
    mutate(EPH  = EPH_AIN_DEFLA+EPH_attaf+EPH_KHEMIS_MILIANA+EPH_MILIANA) %>%
    mutate(EHS  = 0) %>%
    mutate(EH   = 0 ) %>%
    mutate(EPSP = EPSP_ain_lechiakhe+EPSP_BOUMADFAA+EPSP_djelida+EPSP_EL_ABADIA) %>%
    mutate(TOT  = CHU+EPH+EHS+EPSP+EH) %>%
    select(DESIGNATION,CHU,EPH,EHS,EH,EPSP,TOT)

  wilaya_mat1 <- data.frame(

    DESIGNATION="TOTAL",
    CHU="0",
    EPH=sum(wilaya_mat0[,"EPH"]),
    EHS=sum(wilaya_mat0[,"EHS"]),
    EH="0",
    EPSP=sum(wilaya_mat0[,"EPSP"]),
    TOT=sum(wilaya_mat0[,"TOT"]))

  wilaya_mat2 <- rbind(wilaya_mat0,wilaya_mat1)
  knitr::kable(wilaya_mat2,align='lrrrrrr',caption = paste0("équipements médicaux en services"))


}


# wil <- "aindefla"
# mat <- yahiatiba::mat
# mat_aindefla (mat,wil)




