#' mat_chlef
#'
#' @param mat value
#' @param wil value
#'
#' @return value
#' @export
#'
#' @examples mat_chlef
mat_chlef <- function(mat,wil) {
  wilaya_mat0 <- mat %>%
    dplyr::filter(WILAYA==wil) %>% #view()
    select(STRUCTURE,ID,DESIGNATION,NBR) %>%
    group_by(STRUCTURE,DESIGNATION) %>%
    summarise(TOT=sum(NBR)) %>%
    tidyr::pivot_wider(names_from = STRUCTURE, values_from = TOT) %>%
    replace(is.na(.), 0) %>%
    mutate(CHU  = 0 ) %>%
    mutate(EPH  = EPH_A_BOURAS_TENES+EPH_AIN_MERANE+EPH_CHETTIA+EPH_CHORFA+EPH_OULED_MOHAMED+EPH_SOBHA+EPH_SOEURS_BEDJ+EPH_ZIGHOUD_Y_TENES) %>%
    mutate(EHS  = EHS_TENES) %>%
    mutate(EH  = 0 ) %>%
    mutate(EPSP = EPSP_BENI_HAOUA+EPSP_BOUKADER+EPSP_OUED_FODDA+EPSP_OULED_FARES+EPSP_TAOUGRIT+EPSP_TENES) %>%
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


# wil <- "chlef"
# mat <- yahiatiba::mat
# mat_chlef (mat,wil)
#
#




