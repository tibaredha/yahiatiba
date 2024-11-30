#devtools::install_github("hoxo-m/githubinstall") # name/pkgname
#install.packages("devtools")
# * import library --------
library(usethis)
library(devtools)
library(roxygen2)



# library(bannerCommenter)
# txt <- "This is the text of a comment"
# banner(txt)
# boxup(txt, snug = TRUE, bandChar = "=")
# section("")
# banner("Section 1:", "Data input","hhhh", emph = TRUE)


#import ( graphics )            #Pour le package integralement
#importFrom ( graphics , plot ) #Pour une unique fonction en lui pr?ecisant le nom du package puis celui de la fonction


# * create a cfg ----
  # usethis::use_package("ggplot2", type = "imports")   packages that your package requires to work
  # usethis::use_package("ggplot2", type = "suggests")  packages that developers of your package need
  # usethis::use_package("dplyr")
  # usethis::use_package("dplyr", min_version = "1.0.0")
  # usethis::use_package("dplyr", min_version = TRUE)

  # usethis::use_readme_md()
  # usethis::use_news_md()
  # usethis::use_roxygen_md()
  # usethis::use_pipe()
  # usethis::use_mit_license()

# 0 create a data ----
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




# 1 create a function ----
  # use_r("function name")
  # edit function
  # vignette("rd") =  Block are broken up by tag  = @tagName tagValue
  # Code/insert roxygen2 skeleton
  # devtools::document() or roxygen2::roxygenise()
  # create man/function name.rd in latex form R uses to generate the documentation you see when you type ?str_length.
  # help(function name) or ?function name to display the help of my function
  # usethis::use_package_doc() create R/{pkgname}-package.R

# 2 test the function ----
  # usethis::use_testthat()  # create a folder test
  # usethis::use_test()      # you must open a file  with a function to test befor
  # devtools::test()         # test functions


# 3 document ----
  # 3.1 package
  # usethis::use_package_doc()  create a fille R/{pkgname}-package.R dont work ?????
  # create a file R/{pkgname}.R  like yahiatiba.R                    work ok
  # Documenting data  use_r("data") the template is below
  # Documenting function  roxygen2
  # devtools::document()
  # citation("yahiatiba")

  # 3.2 vignette : A vignette is a long-form guide to your package
  # 1-usethis::use_vignette("my-vignette") create my-vignette.Rmd file  and clic butun knit to get  html vignette
  # 2-devtools::build_vignettes()
  # 3-browseVignettes("yahiatiba") to display the vignette
  # 4-browseVignettes()

  # 3.3 pkgdown :  create a web_site  for mypakages : https://pkgdown.r-lib.org/
  # 1- usethis::use_pkgdown()
  # 2- pkgdown::build_site()
  # 3-usethis::use_pkgdown_github_pages() # Run this once to publish your site regularly
  # error  add folder : man/figures/*.svg to docs/

# 4 version ----
  # usethis::use_version()      to incremente version in description file
  # usethis::use_lifecycle()    generate svg file and look at the read me file
  # lifecycle::badge("experimental") ??
  # lifecycle::badge('superseded') ??
  # lifecycle::badge('deprecated') ??

# use_r() usethis::use_test() devtools::test() devtools::document() devtools::load_all(".")







