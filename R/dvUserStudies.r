dvUserStudies <-
function(   dvname, dv=getOption('dvn'), user=getOption('dvn.user'),
            pwd=getOption('dvn.pwd'), browser=FALSE, ...){
    if(is.null(user) | is.null(pwd))
        stop('Must specify username (`user`) and password (`pwd`)')
    xml <- dvDepositQuery(query=paste('collection/dataverse/',dvname,sep=''), user=user, pwd=pwd, dv=dv, browser=browser, ...)
    if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE){
		z <- xmlToList(xml)
        tmp <- list()
        tmp$dvtitle <- z$title$text
        tmp$released <- z$dataverseHasBeenReleased
        tmp$generator <- z$generator
        tmp$studies <- do.call(rbind,lapply(z[names(z)=='entry'], function(i) c(title=i$title$text, objectId=i$id)))
        rownames(tmp$studies) <- seq(rownames(tmp$studies))
        tmp$studies <- as.data.frame(tmp$studies, stringsAsFactors=FALSE)
        tmp$studies$objectId <- sapply(tmp$studies$objectId,function(i) strsplit(i,'study/')[[1]][2])
        tmp$xml <- xml
        return(tmp)
    }
}
