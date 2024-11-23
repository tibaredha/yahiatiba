# fichier 3 RH


#### 1-aindefla ####
#### 2-chlef ####
#### 3-medea ####
#### 4-djelfa ####
djelfa_drh <- yahiatiba::read_ext("./djelfa/drh/drh.csv")
djelfa_drh <- read.csv(djelfa_drh, sep=";")
djelfa_drh <- djelfa_drh %>%
  dplyr::select(wilaya,structure,sexe,datenaissance,echelon,grade,dateinstalation,specialité)%>%
  dplyr::mutate(wilaya = as.factor(wilaya)) %>%
  dplyr::mutate(structure = as.factor(structure)) %>%
  dplyr::mutate(structure = recode(structure,
                                   "DSP Direction de la santé et de la population de la wilaya de Djelfa"="DSP Djelfa",
                                   "EPH Etablissement Public Hospitalier BIRINE"="EPH Birine",
                                   "EPH Etablissement Public Hospitalier AIN OUSSARA"="EPH Ain Oussera",
                                   "EPSP Etablissement Public de Santé de Proximité Ain Ouassara"="EPSP Ain Ouassara",
                                   "EPSP Etablissement Public de Santé de Proximité HASSI BAHBAH"="EPSP Hassi Bahbah",
                                   "EPH Etablissement Public Hospitalier de HASSI BAHBAH"="EPH Hassi Bahbah",
                                   "EPSP Etablissement Public de Santé de Proximité DJELFA"="EPSP Djelfa",
                                   "EPH Etablissement Public Hospitalier DJELFA"="EPH Djelfa",
                                   "EHS Etablissement Hospitalier Spécialisé MERE ET ENFANT DR KAKI MOHAMED DJELFA"="EHS Kaki Mohamed",
                                   "EPH HOPITAL MIXTE DE DJELFA MOUDJAHID HATHAT BOUBAKEUR"="EPH Hathat Boubakeur",
                                   "EPH Etablissement Public Hospitalier El Idrissia"="EPH Idrissia",
                                   "INFPM Institut de Formation Paramédicale Djelfa"="INFPM Djelfa",
                                   "EPSP Etablissement Public de Santé de Proximité MESSAAD"="EPSP Messaad",
                                   "EPH Etablissement Public Hospitalier MESSAAD"="EPH Messaad",
                                   "EPSP Etablissement Public de Santé de Proximité GUETTARA"="EPSP Guettara",
                                   "EH Etablissement hospitalier Ophtalm Djelfa"="EH Ophtalmo")) %>%
  dplyr::mutate(sexe=as.factor(sexe)) %>%
  dplyr::mutate(datenaissance=dmy(datenaissance))%>%
  dplyr::mutate(age=trunc((datenaissance %--% Sys.Date()) / years(1))) %>%
  dplyr::mutate(grade = recode(grade,
                               "0 Praticien spécialiste assistant"="Praticien spécialiste assistant étrangé",
                               "72 Praticien spécialiste en chef"="Praticien spécialiste en chef",
                               "73 Praticien spécialiste principal de sante publique"="Praticien spécialiste principal de sante publique",
                               "74 Praticien spécialiste assistant de sante publique"="Praticien spécialiste assistant de sante publique"))%>%
  dplyr::mutate(grade = as.factor(grade)) %>%
  dplyr::mutate(dateinstalation=dmy(dateinstalation))%>%
  dplyr::mutate(specialité = as.factor(specialité)) %>% glimpse()

usethis::use_data(djelfa_drh, overwrite = TRUE)
#### 5-laghouat ####
#### 6-msila ####


#### data en interne ####
adm <- c(
  "Administrateur",
  "Administrateur Conseiller",
  "Administrateur analyste",
  "Administrateur en chef des services de santé",
  "Administrateur principal",
  "Administrateur principal des services de santé")
msp <- c(
  "Praticien spécialiste assistant étrangé",
  "Praticien spécialiste en chef",
  "Praticien spécialiste principal de sante publique",
  "Praticien spécialiste assistant de sante publique")
mg <- c(
  "Médecin généraliste de sante publique",
  "Médecin généraliste en chef de santé publique",
  "Médecin généraliste étrangers",
  "Médecin généraliste principal de sante publique")
phg <- c(
  "Pharmacien généraliste de sante publique",
  "Pharmacien généraliste en chef de santé publique",
  "Pharmacien généraliste principal de sante publique")
dg <- c(
  "Chirurgien-dentiste généraliste de sante publique",
  "Chirurgien-dentiste généraliste en chef de santé publique",
  "Chirurgien-dentiste généraliste étrangers",
  "Chirurgien-dentiste généraliste principal de sante publique")
sgf <- c(
  "Sage-femme",
  "Sage-femme de sante publique",
  "Sage-femme principale",
  "Sage-femme spécialisée de sante publique")
trd <- c(
  "Manipulateur en imagerie médicale de sante publique",
  "Manipulateur en radiologie diplôme etat",
  "Manipulateur en imagerie médicale major de sante publique",
  "Manipulateur en imagerie médicale spécialise de sante publique")
lbrt <- c(
  "Laborantin de sante publique",
  "Laborantin major de sante publique",
  "Laborantin diplôme etat",
  "Laborantin spécialise de sante publique")
amar <- c(# manque
  "Amar",# modification
  "Auxiliaire médical en anesthésie réanimation de santé publique ense",
  "Amar de sante publique",
  "Amar principal",
  "Auxiliaire médical en anesthésie réanimation major de santé publiqu")
ats <- c(
  "Aide-soignant de sante publique",
  "Aide-soignant principal de sante publique")
isp <- c(
  "Infirmier breveté",
  "Infirmier de sante publique",
  "Infirmier Diplôme d’état",
  "Infirmier major de sante publique",
  "Infirmier spécialise de sante publique")
bio <- c(
  "Biologiste Du 1er Degré De Sante Publique",
  "Biologiste Du 2ème Degré De Sante Publique",
  "Biologiste en chef de santé publique",
  "Biologiste principal de sante publique")



usethis::use_data(adm,msp,mg,phg,dg,sgf,trd,lbrt,amar,ats,isp,isp,bio,
                  internal = TRUE, overwrite = TRUE)



# methode 1 inst/extdata
# file <- yahiatiba::read_ext("drh.csv")
# drh <- read.csv(file,sep = ";")
# usethis::use_data(drh, overwrite = TRUE)

# methode 2 locale
# drh1 <- read.csv(here::here("data-raw","drh.csv"),sep = ";")
# usethis::use_data(drh1, overwrite = TRUE)

# methode 3 internal
# x <- 3
# y <- 10
# usethis::use_data(x,y, internal = TRUE)
