dvDeleteStudy <-
function(   objectid, dv=getOption('dvn'),
            user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), browser=FALSE, ...){
    if(inherits(objectid, 'dvStudyAtom'))
        objectid <- objectid$objectId
    if(is.null(user) | is.null(pwd))
        stop('Must specify username (`user`) and password (`pwd`)')
    xml <- dvDepositQuery(  query=paste('edit/study/',objectid,sep=''), user=user, pwd=pwd, dv=dv, browser=browser,
                            httpverb='DELETE', ...)
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE){
		if(xml=='')
            message('Operation appears to have succeeded.')
        return(xml)
    }
}
