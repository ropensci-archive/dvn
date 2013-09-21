dvUserStudies <- function(user, pwd, dvname, dv=getOption('dvn'), browser=FALSE, ...){
    xml <- dvDepositQuery(query=paste('collection/dataverse/',dvname,sep=''), user=user, pwd=pwd, dv=dv, browser=browser, ...)
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
# `dvname` parameter is the name of a dataverse that you have access to (from `dvServiceDoc`)
