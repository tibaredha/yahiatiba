
# sauvgarder en intern
# adm <- c(
#   "Administrateur",
#   "Administrateur Conseiller",
#   "Administrateur analyste",
#   "Administrateur en chef des services de santé",
#   "Administrateur principal",
#   "Administrateur principal des services de santé")
# msp <- c(
#   "Praticien spécialiste assistant étrangé",
#   "Praticien spécialiste en chef",
#   "Praticien spécialiste principal de sante publique",
#   "Praticien spécialiste assistant de sante publique")
# mg <- c(
#   "Médecin généraliste de sante publique",
#   "Médecin généraliste en chef de santé publique",
#   "Médecin généraliste étrangers",
#   "Médecin généraliste principal de sante publique")
# phg <- c(
#   "Pharmacien généraliste de sante publique",
#   "Pharmacien généraliste en chef de santé publique",
#   "Pharmacien généraliste principal de sante publique")
# dg <- c(
#   "Chirurgien-dentiste généraliste de sante publique",
#   "Chirurgien-dentiste généraliste en chef de santé publique",
#   "Chirurgien-dentiste généraliste étrangers",
#   "Chirurgien-dentiste généraliste principal de sante publique")
# sgf <- c(
#   "Sage-femme",
#   "Sage-femme de sante publique",
#   "Sage-femme principale",
#   "Sage-femme spécialisée de sante publique")
# trd <- c(
#   "Manipulateur en imagerie médicale de sante publique",
#   "Manipulateur en radiologie diplôme etat",
#   "Manipulateur en imagerie médicale major de sante publique",
#   "Manipulateur en imagerie médicale spécialise de sante publique")
# lbrt <- c(
#   "Laborantin de sante publique",
#   "Laborantin major de sante publique",
#   "Laborantin diplôme etat",
#   "Laborantin spécialise de sante publique")
# amar <- c(# manque
#   "Amar",# modification
#   "Auxiliaire médical en anesthésie réanimation de santé publique ense",
#   "Amar de sante publique",
#   "Amar principal",
#   "Auxiliaire médical en anesthésie réanimation major de santé publiqu")
#
# ats <- c(
#   "Aide-soignant de sante publique",
#   "Aide-soignant principal de sante publique")
#
# isp <- c(
#   "Infirmier breveté",
#   "Infirmier de sante publique",
#   "Infirmier Diplôme d’état",
#   "Infirmier major de sante publique",
#   "Infirmier spécialise de sante publique")
#
# bio <- c(
#   "Biologiste Du 1er Degré De Sante Publique",
#   "Biologiste Du 2ème Degré De Sante Publique",
#   "Biologiste en chef de santé publique",
#   "Biologiste principal de sante publique")

add_cols <- function(df, cols) {
  add <- cols[!cols %in% names(df)]
  if(length(add) !=0 ) df[add] <- 0
  return(df)
}

#' Title drh_str_grade
#'
#' @param df value
#'
#' @return value
#' @export
#'
#' @examples value
drh_str_grade <- function(df) {


  ppg <- df %>%
    select(structure,grade) %>%
    group_by(structure,grade) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = grade, values_from = tot) %>%
    replace(is.na(.), 0) #%>% view()c('Médecin généraliste étrangers')



  ppg <- add_cols(ppg,mg)
  ppg <- add_cols(ppg,msp)
  ppg <- add_cols(ppg,phg)
  ppg <- add_cols(ppg,dg)
  ppg <- add_cols(ppg,sgf)
  ppg <- add_cols(ppg,amar)
  ppg <- add_cols(ppg,lbrt)
  ppg <- add_cols(ppg,trd)
  ppg <- add_cols(ppg,ats)
  ppg <- add_cols(ppg,isp)
  ppg <- add_cols(ppg,adm)
  ppg <- add_cols(ppg,bio)

  ppg0 <- ppg %>%
    select(structure,mg,msp,phg,dg,sgf,amar,lbrt,trd,ats,isp,adm,bio) %>%
    mutate(Mg = sum(c_across(1:4), na.rm = T)) %>%
    mutate(Ms = sum(c_across(5:8), na.rm = T)) %>%
    mutate(Ph = sum(c_across(9:11), na.rm = T)) %>%
    mutate(Cd = sum(c_across(12:15), na.rm = T)) %>%
    mutate(Sf = sum(c_across(16:19), na.rm = T)) %>%
    mutate(Amar = sum(c_across(20:24), na.rm = T)) %>%
    mutate(Labo = sum(c_across(25:28), na.rm = T)) %>%
    mutate(Trx = sum(c_across(29:32), na.rm = T)) %>%
    mutate(Ats = sum(c_across(33:34), na.rm = T)) %>%
    mutate(Isp = sum(c_across(35:39), na.rm = T)) %>%
    mutate(Adm = sum(c_across(40:45), na.rm = T)) %>%
    mutate(Bio = sum(c_across(46:49), na.rm = T)) %>%
    select(structure,Adm,Ms,Mg,Ph,Cd,Sf,Amar,Labo,Bio,Trx,Ats,Isp)

  ppg1 <- data.frame(
    structure="Total",
    Adm=sum(ppg0[,"Adm"]),
    Ms=sum(ppg0[,"Ms"]),
    Mg=sum(ppg0[,"Mg"]),
    Ph=sum(ppg0[,"Ph"]),
    Cd=sum(ppg0[,"Cd"]),
    Sf=sum(ppg0[,"Sf"]),
    Amar=sum(ppg0[,"Amar"]),
    Labo=sum(ppg0[,"Labo"]),
    Bio=sum(ppg0[,"Bio"]),
    Trx=sum(ppg0[,"Trx"]),
    Ats=sum(ppg0[,"Ats"]),
    Isp=sum(ppg0[,"Isp"]))

  ppg2 <- rbind(ppg0,ppg1)
  knitr::kable(ppg2,caption = paste0(" Répartition par Structure et Grade"))

}
