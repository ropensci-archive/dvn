.onLoad <- function(libname, pkgname) {
    options(dvn = 'https://thedata.harvard.edu/dvn/') # set default dataverse
    options(dvn.user = '') # initialize dataverse username option
    options(dvn.pwd = '') # initialize dataverse password option
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
   "Note: 'dvn' only works with Dataverse 3 servers.",
   "For servers using Dataverse >= v4.0, please use",
   "the 'dataverse' package, available from:",
   "https://github.com/IQSS/dataverse-client-r")
}
