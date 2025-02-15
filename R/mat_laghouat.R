#' mat_laghouat
#'
#' @param mat value
#' @param wil value
#'
#' @return value
#' @export
#'
#' @examples mat_laghouat
mat_laghouat <- function(mat,wil) {
  wilaya_mat0 <- mat %>%
    dplyr::filter(WILAYA==wil) %>% #view()
    select(STRUCTURE,ID,DESIGNATION,NBR) %>%
    group_by(STRUCTURE,DESIGNATION) %>%
    summarise(TOT=sum(NBR)) %>%
    tidyr::pivot_wider(names_from = STRUCTURE, values_from = TOT) %>%
    replace(is.na(.), 0) %>%
    mutate(CHU  = 0 ) %>%
    mutate(EPH  = eph_aflou+eph_kasrelhirane+eph_laghouat+eph_mixte) %>%
    mutate(EHS  = ehs_aflou+ehs_laghouat ) %>%
    mutate(EH   = 0 ) %>%
    mutate(EPSP = epsp_aflou+epsp_ainmadhi+epsp_brida+epsp_gss+epsp_hassidalaa+epsp_ksarelhirane+epsp_laghouat) %>%
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


# wil <- "laghouat"
# mat <- yahiatiba::mat
# mat_laghouat (mat,wil)
#
#




