library(usethis)
library(devtools)
library(roxygen2)

# 0.  import library --------
library(bannerCommenter)
banner()
#################################################################
##                        Dr TIBA PISP                         ##
##                          DSP Djelfa                         ##
#################################################################
txt <- "This is the text of a comment"
banner(txt)
boxup(txt, snug = TRUE, bandChar = "=")
section("")
banner("Section 1:", "Data input","hhhh", emph = TRUE)

#### tiba ####
# sdfsdfsd ----



#usethis::use_mit_license()
#library(yahiatiba)
#detach(yahiatiba)
rm(list=ls())
wc_algeria <- yahiatiba::wc_algeria
deces <- yahiatiba::deces
deces %>% dplyr::filter(!complete.cases(.)) %>% view()
glimpse(deces)

drh <- yahiatiba::drh
drh %>% dplyr::filter(!complete.cases(.)) %>% view()
glimpse(drh)

pop <- yahiatiba::pop
df <- yahiatiba::mdo
df %>% dplyr::filter(!complete.cases(.)) %>% view()
glimpse(df)

# df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Brucellose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Tuberculose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Leishmaniose Cutanee")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Rougeole")

yahiatiba::declaration_a(df)
yahiatiba::declaration_e(df)
yahiatiba::declaration_c(df,pop)

yahiatiba::declaration_ta(df)
yahiatiba::declaration_ta1(df,900,300)
yahiatiba::declaration_p(df)
yahiatiba::carte()
yahiatiba::sigmdo(wc_algeria,df)
yahiatiba::mdots(df)

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
  # Code/insert roxygen skeleton
  # devtools::document()

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

  # usethis::use_vignette("my-vignette") create my-vignette.Rmd file  $ knitr to html vignette
  # browseVignettes()
  # browseVignettes("yahiatiba")
  # vignette() vignette("mdo-vignette",package = "yahiatiba")
  # devtools::build_rmd("vignettes/mdo-vignette.Rmd") devtools::build_vignettes()
  # usethis::use_version() to incremente version in description file
  # usethis::use_lifecycle()

# use_r() usethis::use_test() devtools::test() devtools::document() devtools::load_all(".")

