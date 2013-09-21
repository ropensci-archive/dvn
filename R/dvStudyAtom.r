dvStudyAtom <- function(user, pwd, objectid, dv=getOption('dvn'), browser=FALSE, ...){
    xml <- dvDepositQuery(query=paste('edit/study/',objectid,sep=''), user=user, pwd=pwd, dv=dv, browser=browser, ...)
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
