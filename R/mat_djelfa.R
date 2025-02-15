#' mat_djelfa
#'
#' @param mat value
#' @param wil value
#'
#' @return value
#' @export
#'
#' @examples mat_djelfa
mat_djelfa <- function(mat,wil) {
  wilaya_mat0 <- mat %>%
  dplyr::filter(WILAYA==wil) %>% #view()
    dplyr::select(STRUCTURE,ID,DESIGNATION,NBR) %>%
    group_by(STRUCTURE,DESIGNATION) %>%
    summarise(TOT=sum(NBR)) %>%
    tidyr::pivot_wider(names_from = STRUCTURE, values_from = TOT) %>%
    replace(is.na(.), 0) %>%
    mutate(CHU  = 0 ) %>%
    mutate(EPH  = eph_aioussera+eph_hbb+eph_djelfa+eph_messaad+eph_idrissia+eph_mixte+eph_birine) %>%
    mutate(EHS  = ehs_djelfa+ehs_oph) %>%
    mutate(EH  = 0 ) %>%
    mutate(EPSP = epsp_ainoussera+epsp_hbb+epsp_djelfa+epsp_messaad+epsp_guettara) %>%
    mutate(TOT  = CHU+EPH+EPSP+EHS+EH) %>%
    mutate(INDICE  = 0) %>% #1092182/TOT
    select(DESIGNATION,CHU,EPH,EHS,EH,EPSP,TOT,INDICE)

  wilaya_mat1 <- data.frame(

    DESIGNATION="TOTAL",
    CHU="0",
    EPH=sum(wilaya_mat0[,"EPH"]),
    EHS=sum(wilaya_mat0[,"EHS"]),
    EH="0",
    EPSP=sum(wilaya_mat0[,"EPSP"]),
    TOT=sum(wilaya_mat0[,"TOT"]),
    INDICE="0"
  )

  wilaya_mat2 <- rbind(wilaya_mat0,wilaya_mat1)
  knitr::kable(wilaya_mat2,
               digits=3,
               align='lrrrrrrr',
               caption = paste0("équipements médicaux en services"))

}


# wil <- "djelfa"
# mat <- yahiatiba::mat
# mat_djelfa (mat,wil)
#
#




