dvUserStudies <-
function(   dvname, dv=getOption('dvn'), user=getOption('dvn.user'),
            pwd=getOption('dvn.pwd'), browser=FALSE, ...){
    if(is.null(user) | is.null(pwd))
        stop('Must specify username (`user`) and password (`pwd`)')
    xml <- dvDepositQuery(query=paste('collection/dataverse/',dvname,sep=''), user=user, pwd=pwd, dv=dv, browser=browser, ...)
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
