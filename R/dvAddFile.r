dvAddFile <- function(user, pwd, objectid, filename, dv=getOption('dvn'), browser=FALSE, ...){
    xml <- dvDepositQuery(  query=paste('edit-media/study/',objectid,sep=''), user=user, pwd=pwd, dv=dv, browser=browser,
                            httpverb='POST', #upload=TRUE,
                            #readfunction = RCurl:::uploadFunctionHandler(filename, FALSE),
                            postfields=readBin(filename,what='raw',1e7),
                            httpheader=c(   'Content-Disposition'=paste('attachment; filename',filename,sep='='),
                                            'Content-Type'='application/zip',
                                            'Packaging'='http://purl.org/net/sword/package/SimpleZip'))
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
