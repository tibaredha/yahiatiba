library(usethis)
library(devtools)
library(roxygen2)



#https://forum.posit.co/t/install-packages-does-not-install-dependencies-on-ubuntu-linux-very-bad-problem/175106/7
# https://www.youtube.com/@DrJBanta/videos
to_reinstall <- installed.packages()
write.csv(to_reinstall,"./packages.csv")
.libPaths()
to_reinstall[,1]
to_reinstall <- read.csv("SOMEWHERE SAFE")
#install.packages(to_reinstall[,1], ask = FALSE)



session_info()
file.path(R.home(), "usr/bin")
list.files()


# Sys.setenv(PATH = paste("C:/rtools40/bin/", Sys.getenv("PATH"), sep=";"))
# Sys.setenv(PATH = paste("C:/rtools40/mingw32/bin/", Sys.getenv("PATH"), sep=";"))
# Sys.setenv(PATH = paste("C:/rtools40/mingw64/bin/", Sys.getenv("PATH"), sep=";"))
# Sys.setenv(PATH = paste("C:/rtools40/ucrt64/bin/", Sys.getenv("PATH"), sep=";"))
# Sys.setenv(PATH = paste("C:/rtools40/usr/bin/", Sys.getenv("PATH"), sep=";"))
#
# Sys.setenv(BINPREF = "C:/Rtools/mingw32/bin/")
# Sys.setenv(BINPREF = "C:/Rtools/mingw64/bin/")
# Sys.setenv(BINPREF = "C:/Rtools/ucrt64/bin/")

writeLines(strsplit(Sys.getenv("PATH"), ";")[[1]])
Sys.getenv("PATH")
Sys.getenv("BINPREF")
Sys.getenv("nom")
Sys.getenv("prenom")
Sys.getenv("RTOOLS40_HOME")
#Sys.setenv(PATH = paste("C:\\rtools40\\mingw64\\bin\\", Sys.getenv("PATH"), sep=";"))



Sys.which("make")
Sys.which("gcc")

#write('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', file = "~/.Renviron", append = TRUE)

pkgbuild::check_rtools(TRUE)
pkgbuild::has_rtools(TRUE)
pkgbuild::has_build_tools(debug=TRUE)
devtools::find_rtools(debug=TRUE)
remotes::install_github("tibaredha/yahiatiba")





#usethis::use_mit_license()
#library(yahiatiba)
#detach(yahiatiba)
rm(list=ls())
wc_algeria <- yahiatiba::wc_algeria
#deces <- yahiatiba::deces
#deces %>% dplyr::filter(!complete.cases(.)) %>% view()
#glimpse(deces)

#drh <- yahiatiba::drh
#drh %>% dplyr::filter(!complete.cases(.)) %>% view()
#glimpse(drh)

pop <- yahiatiba::pop
df <- yahiatiba::mdo
#df %>% dplyr::filter(!complete.cases(.)) %>% view()
glimpse(df)

df %>% dplyr::select(DATE) %>%
  tidyr::separate(DATE, into = c("y", "m","d"), sep = "-") %>%
  tidyr::unite(date2,c("y","m","d"),sep = "-") %>%
  view()



# df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Brucellose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Tuberculose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Leishmaniose Cutanee")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Rougeole")


yahiatiba::declaration_a(df) # année mois
yahiatiba::declaration_e(df) # etatblissement sexe
yahiatiba::declaration_c(df,pop) # commune sexe population

yahiatiba::declaration_ta(df)
yahiatiba::decpta_epsp(df)
yahiatiba::decpta_commune(df)
yahiatiba::decpta_pathologie(df)

yahiatiba::declaration_ta1(df,900,300)
yahiatiba::declaration_p(df)
yahiatiba::carte()
yahiatiba::sigmdo(wc_algeria,df)
yahiatiba::mdots(df)

library(tseries)
library(forecast)




# time series exemple

ac <- function(tsn) {
  par(mfrow=c(1,3))
  acf(tsn,type = "covariance")
  acf(tsn,type = "correlation")
  pacf(tsn)
  par(mfrow=c(1,1))
}


z <- df %>% dplyr::select(DATE_DECL_Y,DATE_DECL_M,DATE) %>%
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
  #dplyr::group_by(DATE) %>%
  dplyr::summarise(nbr=sum(n())) #%>%

ts1 <- ts(z, start = 2018, frequency=12)
ts2 <- ts1[,2]
plot(ts2)

tsd <- decompose(ts2)
plot(tsd)

tseries::adf.test(ts2)

ac(ts2)

tibaautoarima <- forecast::auto.arima(ts2,ic = "aic",trace = TRUE)

tibaautoarima


tibaautoarima1 <- forecast::auto.arima(ts2)

tibaautoarima1


#### lits structure hospitaliere ####

data(region_e_lit)
str <- region_e_lit
rm(region_e_lit)
glimpse(str)
levels(str$ETA)
library(kableExtra)
# aindefla
yahiatiba::str_lit1_e_x(str,"MAKOUR_Hamou")     #
yahiatiba::str_lit1_e_x(str,"eph_atf")          #
yahiatiba::str_lit1_e_x(str,"LATRACHE_Ahmed")   #
yahiatiba::str_lit1_e_x(str,"FARES_Yahia")      #

#chlef
yahiatiba::str_lit1_e_x(str,"eph_amr")      #
yahiatiba::str_lit1_e_x(str,"eph_chr")      #
yahiatiba::str_lit1_e_x(str,"eph_cht")      #
yahiatiba::str_lit1_e_x(str,"eph_olm")      #
yahiatiba::str_lit1_e_x(str,"eph_sbh")      #
yahiatiba::str_lit1_e_x(str,"eph_srb")      #
yahiatiba::str_lit1_e_x(str,"eph_tnsa")     #
yahiatiba::str_lit1_e_x(str,"eph_tnsz")     #
yahiatiba::str_lit1_e_x(str,"ehs_tns")      #

#medea
yahiatiba::str_lit1_e_x(str,"eph_abcf")      #
yahiatiba::str_lit1_e_x(str,"Benyoucef_Benkhedda")      #
yahiatiba::str_lit1_e_x(str,"eph_bslm")      #
yahiatiba::str_lit1_e_x(str,"eph_chl")      #
yahiatiba::str_lit1_e_x(str,"eph_kbk")      #
yahiatiba::str_lit1_e_x(str,"Mohamed_Boudiaf")      #
yahiatiba::str_lit1_e_x(str,"eph_tblt")      #

# djelfa
yahiatiba::str_lit1_e_x(str,"eph_bi")           #eph birine
yahiatiba::str_lit1_e_x(str,"SAADAOUI_Mokhtar") #eph_ao
yahiatiba::str_lit1_e_x(str,"BOUGERA_Ahmed")    #eph_hbb
yahiatiba::str_lit1_e_x(str,"MOUHAD_Abdelkader")#eph_dje
yahiatiba::str_lit1_e_x(str,"HATHAT_Boubaker")  #eph_mi
yahiatiba::str_lit1_e_x(str,"KAKI_Mohamed")     #ehs_me
yahiatiba::str_lit1_e_x(str,"ehs_oph")          #"h ophtalmo
yahiatiba::str_lit1_e_x(str,"BENCHERIF_Ahmed")  #ehs_cac
yahiatiba::str_lit1_e_x(str,"HANI_Mohamed")#    eph_ma
yahiatiba::str_lit1_e_x(str,"HENICHI_Mostapha") #eph_id

#msila
yahiatiba::str_lit1_e_x(str,"eph_alm")      #
yahiatiba::str_lit1_e_x(str,"eph_bns")      #
yahiatiba::str_lit1_e_x(str,"eph_sda")      #
yahiatiba::str_lit1_e_x(str,"eph_bsd")      #
yahiatiba::str_lit1_e_x(str,"eph_mgr")      #
yahiatiba::str_lit1_e_x(str,"eph_msl")      #
yahiatiba::str_lit1_e_x(str,"ehs_me")      #
yahiatiba::str_lit1_e_x(str,"ehs_psc")      #

#laghouat
yahiatiba::str_lit1_e_x(str,"eph_lgt")      #
yahiatiba::str_lit1_e_x(str,"eph_mxt")      #
yahiatiba::str_lit1_e_x(str,"eph_afl")      #
yahiatiba::str_lit1_e_x(str,"eph_ksh")      #
yahiatiba::str_lit1_e_x(str,"ehs_mel")      #
yahiatiba::str_lit1_e_x(str,"ehs_mea")      #

str_lit_wil(str)
str_lit_dai(str)
str_lit_com (str)
str_lit_cs(str)
str_lit_typ (str)
str_lit_eta(str)
str_lit_ser (str)

str_ser_lit(str,"gyneco obstetrique")
str_ser_lit(str,"pediatrie")
str_ser_lit(str,"chirurgie generale")
str_ser_lit(str,"medecine interne")
str_ser_lit(str,"ophtalmologie")
str_ser_lit(str,"reanimation")
str_ser_lit(str,"umc")


#### drh ####
library(yahiatiba)
wilaya_nom <- "Wilaya de Djelfa"
data(djelfa_drh)

colnames(djelfa_drh)
# debut  trasformation pour regler le probleme d encodage
# names(djelfa_drh)[8] <- "specialité"  # change the name of column with problem
# colnames(djelfa_drh)
# djelfa_drh <- djelfa_drh %>%
#   mutate(specialité=iconv(specialité, "LATIN2", "UTF-8")) #%>% view()
# djelfa_drh <- djelfa_drh %>%
#   mutate(grade=iconv(grade, "LATIN2", "UTF-8")) #%>% view()
# fin transformation

profvis::profvis(yahiatiba::drh_str(djelfa_drh))# verifier le temp dexecution
yahiatiba::drh_str(djelfa_drh)
yahiatiba::drh_sa(djelfa_drh,wilaya_nom)
yahiatiba::drh_ta(djelfa_drh,wilaya_nom)
yahiatiba::drh_str_grade(djelfa_drh)
suppressWarnings(yahiatiba::drh_grade(djelfa_drh))
suppressWarnings(yahiatiba::drh_grade1(djelfa_drh,wilaya_nom))
suppressWarnings(yahiatiba::drh_grades(djelfa_drh))
suppressWarnings(yahiatiba::drh_specialite(djelfa_drh))
suppressWarnings(yahiatiba::drh_str2(djelfa_drh))
suppressWarnings(yahiatiba::drh_specialiste_str(djelfa_drh))
suppressWarnings(yahiatiba::drh_specialiste_str1(djelfa_drh))



rm(list=ls())
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,lubridate,ggthemes,sf,mapsf)

carte_w_c_pv <- function(df,wilaya_x) {

  # filec <- yahiatiba::read_ext_data("yahiatiba","shp/gadm41_DZA_2.shp")
  # dzc <- read_sf(filec) %>%
  #   dplyr::select(CC_2,NAME_1,NAME_2) %>%
  #   dplyr::rename("CC"= CC_2,"WILAYA"= NAME_1,"COMMUNE"= NAME_2) %>%
  #   dplyr::mutate("CC"= as.numeric(CC)) %>%
  #   dplyr::mutate(WILAYA = recode(WILAYA,
  #                                 "Médéa"="Medea",
  #                                 "Aïn Defla"="Aindefla",
  #                                 "M'Sila"="Msila")) %>%
  #
  #   dplyr::filter(WILAYA %in%  c("Chlef","Aindefla","Medea","Djelfa","Laghouat","Msila")) %>%
  dzc <- df %>%
    dplyr::filter(WILAYA == wilaya_x) %>%
    dplyr::arrange(CC)
  #unique(dzc$WILAYA)
  demographie <- yahiatiba::wdc %>%
    dplyr::filter(WILAYA == wilaya_x)

  sigf <- merge(x = dzc, y = demographie, by.x = "CC", by.y = "IDC")
  sigf <- sigf %>% dplyr::select(CC,POP,COMMUNE.x)
  #rm(filec,dzc,demographie)
  rm(dzc,demographie)

  mf_theme("candy")
  mf_shadow(sigf)
  mf_map(sigf,
         type="choro",
         var="POP",
         add = TRUE,#pal = "Blues 3",
         leg_pos = "topright",  #leg_pos = "bottomleft",
         leg_title = "Pop")
  mf_arrow()
  mf_scale(size = 5)
  mf_credits(txt = paste0("Sources: R.TIBA,DSP Djelfa,","mapsf ", packageVersion("mapsf"),"\n"))
  mf_title(paste("Wilaya de ",wilaya_x))
  #mf_annotation(sigf[1, ],txt = "wilaya")
  mf_label(x = sigf,var = "COMMUNE.x",cex = 0.5,col= "black", halo = TRUE,overlap = FALSE,lines = FALSE)
}




#%>%%>% View()

df <- yahiatiba::wc_region
carte_w_c_pv (df,'Chlef')
carte_w_c_pv (df,'Aindefla')
carte_w_c_pv (df,'Medea')
carte_w_c_pv (df,'Djelfa')
carte_w_c_pv (df,'Laghouat')
carte_w_c_pv (df,'Msila')

#
#plot(sigf["POP"])

























