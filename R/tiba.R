.onAttach <- function(libname, pkgname)
{
ver <- as.character(read.dcf(file.path(libname, pkgname, "DESCRIPTION"), "Version"))
packageStartupMessage("====================================================================================================")
packageStartupMessage("Package yahiatiba  ", ver, " is loaded", appendLF = TRUE)
packageStartupMessage("Type help(yahiatiba.about) for summary information")
packageStartupMessage("Type browseVignettes(package = 'yahiatiba') to learn how to use epiR for applied epidemiological analyses")
packageStartupMessage("====================================================================================================")
packageStartupMessage("onAttach from tiba redha")
packageStartupMessage("====================================================================================================")
packageStartupMessage("detach(\"package:yahiatiba\", unload=TRUE)")
packageStartupMessage("\n")
}

#detach("package:yahiatiba", unload=TRUE)
.onDetach <- function(libpath){packageStartupMessage("onDetach from tiba redha")}

# Packages can supply functions to be called when loaded, attached, detached or unloaded.
# .onAttach(libname, pkgname)
# .onDetach(libpath)

#.onLoad(libname, pkgname){packageStartupMessage("onLoad from tiba redha")}
#.onUnload(libpath){packageStartupMessage("onUnload from tiba redha")}

# .Last.lib(libpath)





