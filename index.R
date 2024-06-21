library(usethis)
library(devtools)
library(roxygen2)

#usethis::use_mit_license()


#library(yahiatiba)
#detach(yahiatiba)
rm(list=ls())
wc_algeria <- yahiatiba::wc_algeria
df <- yahiatiba::mdo
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Brucellose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Tuberculose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Leishmaniose Cutanee")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Rougeole")

yahiatiba::declaration_a(df)
yahiatiba::declaration_e(df)
yahiatiba::declaration_c(df)
yahiatiba::sigmdo(wc_algeria,df)
yahiatiba::declaration_ta(df)
yahiatiba::declaration_ta1(df,900,300)
yahiatiba::declaration_p(df)


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
  # usethis::use_data(data name)  create  a folder data and *.rda file
  # usethis::use_data_raw()  create  a folder  data-raw  then edit script file to prepare data
  # usethis::use_data(internal_this, internal_that, internal = TRUE) create R/sysdata.rda
  # Raw data file inst/extdata/  use file <- yahiatiba::read_ext_data("yahiatiba","djelfa.shp")
  # to get file path

# 1 create a function
  # use_r("function name")

# 2 test the function
  # usethis::use_testthat()  # create a folder test
  # usethis::use_test()      # you must open a file  with a function to test befor
  # devtools::test()         # test functions


# 3 document
  # package           usethis::use_package_doc()
  # Documenting data
  # Documenting function  roxygen2
  # devtools::document()
  # citation("yahiatiba")
  # usethis::use_vignette("my-vignette") create my-vignette.Rmd file
  # browseVignettes()
  # usethis::use_version() to incremente version in description file
  # usethis::use_lifecycle()

# use_r() usethis::use_test() devtools::test() devtools::document() devtools::load_all(".")




