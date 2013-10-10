dvAddFile <-
function(   objectid, filename, filesize=1e7, dv=getOption('dvn'),
            user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), browser=FALSE, ...){
    if(is.null(user) | is.null(pwd))
        stop('Must specify username (`user`) and password (`pwd`)')
    if(is.null(filename))
        stop("Must specify filename as .zip, a vector of filenames, or the name of an R dataframe")
    if(length(filename)>1 || (length(filename)==1 && !tools::file_ext(filename)=='zip')){
        tmp <- tempfile(fileext='.zip')
        zip(tmp, filename)
        filename <- tmp
    }
    xml <- dvDepositQuery(  query=paste('edit-media/study/',objectid,sep=''), user=user, pwd=pwd, dv=dv, browser=browser,
                            httpverb='POST', #upload=TRUE,
                            postfields=readBin(filename,what='raw',file.info(filename)$size),
                            httpheader=c(   'Content-Disposition'=paste('attachment; filename',filename,sep='='),
                                            'Content-Type'='application/zip',
                                            'Packaging'='http://purl.org/net/sword/package/SimpleZip'))
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE)
		return(xml)
}
