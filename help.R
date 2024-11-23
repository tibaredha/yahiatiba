
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
  # usethis::use_build_ignore("extdata/")                            to ignore ext data in build proces
  # Raw data file inst/extdata/                                      use file <- yahiatiba::read_ext_data("yahiatiba","djelfa.shp")  # to get file path
  # CRAN  in R pakages is limitede to 5 megabyte ????
  # install.packages("data.table")                                   which provides efficient tools for working with large datasets.
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
  # pkgdown  create a web_site  for mypakages : https://pkgdown.r-lib.org/
  # usethis::use_pkgdown_github_pages() # Run this once to publish your site regularly

  # usethis::use_pakgdown()
  # pakgdown::build_site()


# 4 version
  # usethis::use_version()      to incremente version in description file
  # usethis::use_lifecycle()    generate svg file and look at the read me file
  # lifecycle::badge("experimental") ??
  # lifecycle::badge('superseded') ??
  # lifecycle::badge('deprecated') ??

# use_r() usethis::use_test() devtools::test() devtools::document() devtools::load_all(".")
