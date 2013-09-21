dvServiceDoc <- function(user, pwd, dv=getOption('dvn'), browser=FALSE, ...){
    xml <- dvDepositQuery(query='service-document', user=user, pwd=pwd, dv=dv, browser=browser, ...)
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
