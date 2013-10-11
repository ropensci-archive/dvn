dvCreateStudy <-
function(   dvname, xmlfile, dv=getOption('dvn'),
            user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), browser=FALSE, ...){
    if(is.null(user) | is.null(pwd))
        stop('Must specify username (`user`) and password (`pwd`)')
    if(is.null(xmlfile) || !is.character(xmlfile))
        stop('`xmlfile` must be xml character string or path to xml file')
    if(inherits(dvname,'dvServiceDoc')){
        tmp <- dvServiceDoc()$dataverses$dvn
        if(length(tmp)>1)
            warning('Multiple dataverses available for this user. Results returned for first collection: \'',tmp[1],'\'.')
        dvname <- tmp[1]
    }
    if(file.exists(xmlfile))
        filetosend <- charToRaw(paste(readLines(xmlfile),collapse=""))
    else
        filetosend <- charToRaw(xmlfile)
    xml <- dvDepositQuery(  query=paste('collection/dataverse/',dvname,sep=''), user=user, pwd=pwd, dv=dv, browser=browser,
                            httpverb='POST', postfields=filetosend,
                            httpheader=c('Content-Type'='application/atom+xml'))
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		.dvParseAtom(xml)
}
