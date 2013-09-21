dvAddFile <- function(user, pwd, objectid, xmlfile, dv=getOption('dvn'), browser=FALSE, ...){
    # need to be able to handle xml character string and xml file path
    xml <- dvDepositQuery(  query=paste('edit-media/study/',objectid,sep=''), user=user, pwd=pwd, dv=dv, browser=browser,
                            httpverb='POST', postfields=charToRaw(paste(readLines(xmlfile),collapse="")),
                            httpheader=c(   'Content-Disposition'='filename=example.zip',
                                            'Content-Type'='application/atom+xml',
                                            'Packaging'='http://purl.org/net/sword/package/SimpleZip'))
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
