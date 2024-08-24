library(usethis)
library(devtools)
library(roxygen2)

# 0.  import library --------
library(bannerCommenter)
txt <- "This is the text of a comment"
banner(txt)
boxup(txt, snug = TRUE, bandChar = "=")
section("")
banner("Section 1:", "Data input","hhhh", emph = TRUE)

#### tiba ####

#https://forum.posit.co/t/install-packages-does-not-install-dependencies-on-ubuntu-linux-very-bad-problem/175106/7
# https://www.youtube.com/@DrJBanta/videos
to_reinstall <- installed.packages()
write.csv(to_reinstall,"./packages.csv")
.libPaths()
to_reinstall[,1]
to_reinstall <- read.csv("SOMEWHERE SAFE")
install.packages(to_reinstall[,1], ask = FALSE)



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


yahiatiba::declaration_a(df)
yahiatiba::declaration_e(df)
yahiatiba::declaration_c(df,pop)

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



#import ( graphics )            #Pour le package integralement
#importFrom ( graphics , plot ) #Pour une unique fonction en lui pr´ecisant le nom du package puis celui de la fonction


# cfg
  # usethis::use_package("dplyr")
  # usethis::use_package("dplyr", min_version = "1.0.0")
  # usethis::use_package("dplyr", min_version = TRUE)
  # usethis::use_package("ggplot2", "Suggests")
  # usethis::use_package("ggplot2", "imports")
  # usethis::use_readme_md()
  # usethis::use_news_md()
  # usethis::use_roxygen_md()
  # usethis::use_pipe()
  # usethis::use_mit_license()

# data
  # usethis::use_data_raw("***")                                     create  a folder  data-raw  then edit script file to prepare data
  # usethis::use_data(data name, overwrite= TRUE)                    create  a folder  data and data name.rda file
  # usethis::use_data(compress = "bzip2")                            bzip2,gzip,xz
  # usethis::use_data(internal_this, internal_that, internal = TRUE) create  R/sysdata.rda
  # usethis::use_build_ignore("extdata/") to ignore ext data in build proces
  # Raw data file inst/extdata/   use file <- yahiatiba::read_ext_data("yahiatiba","djelfa.shp")  # to get file path
  # CRAN  in R pakages is limitede to 5 megabyte ????
  # install.packages("data.table") which provides efficient tools for working with large datasets.
  # tools::resave   tools::checkRdafiles(). ????
  # document your data
	#' World Health Organization TB data
	#'
	#' A subset of data from the World Health Organization Global Tuberculosis
	#' Report ...
	#'
	#' @format ## `who`
	#' A data frame with 7,240 rows and 60 columns:
	#' \describe{
	#'   \item{country}{Country name}
	#'   \item{iso2, iso3}{2 & 3 letter ISO country codes}
	#'   \item{year}{Year}
	#'   ...
	#' }
	#' @source <https://www.who.int/teams/global-tuberculosis-programme/data>
	# "who"
  # check if LazyData: true in your DESCRIPTION




# 1 create a function
  # use_r("function name")
  # edit function
  # vignette("rd") =  Block are broken up by tag  = @tagName tagValue
  # Code/insert roxygen2 skeleton
  # devtools::document() or roxygen2::roxygenise()
  # create man/function name.rd in latex form R uses to generate the documentation you see when you type ?str_length.
  # help(function name) or ?function name to display the help of my function
  # usethis::use_package_doc() create R/{pkgname}-package.R

# 2 test the function
  # usethis::use_testthat()  # create a folder test
  # usethis::use_test()      # you must open a file  with a function to test befor
  # devtools::test()         # test functions


# 3 document
  # package           usethis::use_package_doc()
  # Documenting data  use_r("data") the template is below
  # Documenting function  roxygen2
  # devtools::document()
  # citation("yahiatiba")

  # vignette :: A vignette is a long-form guide to your package
  # usethis::use_vignette("my-vignette") create my-vignette.Rmd file  $ knitr to html vignette usethis::use_vignette("my-vignette")
  # browseVignettes()
  # browseVignettes("yahiatiba")
  # vignette() vignette("mdo-vignette",package = "yahiatiba")
  # devtools::build_rmd("vignettes/mdo-vignette.Rmd") devtools::build_vignettes()
  
  # pkgdown  create a web_site  for mypakages
  # usethis::use_pakgdown()
  # pakgdown::build_site()


# 4 version
  # usethis::use_version()      to incremente version in description file
  # usethis::use_lifecycle()    generate svg file and look at the read me file
  # lifecycle::badge("experimental") ??
  # lifecycle::badge('superseded') ??
  # lifecycle::badge('deprecated') ??

# use_r() usethis::use_test() devtools::test() devtools::document() devtools::load_all(".")

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

yahiatiba::str_lit1_e_x(str,"SAADAOUI_Mokhtar") #eph_ao
yahiatiba::str_lit1_e_x(str,"eph_bi")
yahiatiba::str_lit1_e_x(str,"BOUGERA_Ahmed")    #eph_hbb
yahiatiba::str_lit1_e_x(str,"MOUHAD_Abdelkader")#eph_dje
yahiatiba::str_lit1_e_x(str,"HATHAT_Boubaker")  #eph_mi
yahiatiba::str_lit1_e_x(str,"HANI_Mohamed")#    eph_ma
yahiatiba::str_lit1_e_x(str,"HENICHI_Mostapha") #eph_id
yahiatiba::str_lit1_e_x(str,"KAKI_Mohamed")     #ehs_me
yahiatiba::str_lit1_e_x(str,"ehs_oph")
yahiatiba::str_lit1_e_x(str,"BENCHERIF_Ahmed")  #ehs_cac

yahiatiba::str_lit1_e_x(str,"eph_khm")  #
yahiatiba::str_lit1_e_x(str,"eph_sbh")  #

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
names(djelfa_drh)[8] <- "specialité"  # change the name of column with problem
colnames(djelfa_drh)
djelfa_drh <- djelfa_drh %>%
  mutate(specialité=iconv(specialité, "LATIN2", "UTF-8")) #%>% view()
djelfa_drh <- djelfa_drh %>%
  mutate(grade=iconv(grade, "LATIN2", "UTF-8")) #%>% view()
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









