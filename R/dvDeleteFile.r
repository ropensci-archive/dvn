dvDeleteFile <- function(user, pwd, fileid, dv=getOption('dvn'), browser=FALSE, ...){
    # need to be able to handle xml character string and xml file path
    xml <- dvDepositQuery(  query=paste('edit-media/file/',fileid,sep=''), user=user, pwd=pwd, dv=dv, browser=browser,
                            httpverb='DELETE')
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
