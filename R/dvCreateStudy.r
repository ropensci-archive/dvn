dvCreateStudy <- function(user, pwd, dvname, xmlfile, dv=getOption('dvn'), browser=FALSE, ...){
    # need to be able to handle xml character string and xml file path
    xml <- dvDepositQuery(  query=paste('collection/dataverse/',dvname,sep=''), user=user, pwd=pwd, dv=dv, browser=browser,
                            httpverb='POST', postfields=charToRaw(paste(readLines(xmlfile),collapse="")),
                            httpheader=c('Content-Type'='application/atom+xml'))
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
