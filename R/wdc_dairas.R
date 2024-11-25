#' Title wdc_dairas
#'
#' @param df  df
#' @param variables Wilaya
#'
#' @return  table
#' @export
#'
#' @examples yahiatiba::wdc_dairas(wdc,"Djelfa")
wdc_dairas <- function(df,variables) {
  wilayapop2 <- df %>%
    dplyr::select(WILAYA,DAIRA,POP,SUP) %>% #IDD,COMMUNE,EPH,EHS,PLC,SS,IDC
    dplyr::filter(WILAYA==variables) %>% # View() acorigé dans csv
    dplyr::mutate(DAIRA = as.factor(DAIRA)) %>%
    dplyr::group_by(DAIRA) %>%
    dplyr::summarise(POPW = sum(POP),
                     SUPT=sum(SUP),
                     NCT=n()) %>%
    dplyr::mutate(DENS = round(POPW/SUPT, digits = 2)) %>%
    dplyr::arrange(DAIRA)
  g <- c("NCT","POPW","SUPT")
  totalpop22  <- data.frame(DAIRA='Total',DENS="***", t(colSums(wilayapop2[, g])))
  # 4=POPW
  # 5=SUPT
  N=nrow(wilayapop2)
  # commune=paste0("Total : ",N),
  redha <- round(totalpop22[4]/totalpop22[5], digits = 2)
  totalpop2  <- data.frame(DAIRA=paste0("Total : ",N),
                           DENS=redha[,],
                           t(colSums(wilayapop2[, g])))

  df_new2 <- rbind(wilayapop2,totalpop2) #sep,
  df_new2 %>%
    select(DAIRA,NCT,POPW,SUPT,DENS) %>%
    knitr::kable(caption = paste0("Démographie par Dairas Wilaya de ",variables),align = "lrrrrrrrr")
}
