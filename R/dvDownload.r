dvDownload <- function(fileid, query=NULL, dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE, ...){
	if(is.null(fileid))
		stop("Must specify fileId")
	direct <- dvDownloadInfo(fileid)
	if(is.null(direct))
		stop("downloadInfo unavailable")
	if(direct$directAccess=="false")
		stop(direct$accessRestrictions,"\nData cannot be accessed directly...try using URI from dvExtractFileIds(dvMetadata())")
	if(is.null(query)){
		xml <- dvQuery(verb = "download", query = fileid, dv = dv, browser=browser)
		return(xml)
	}
	else{
		if(is.list(query)){
			q <- ""
			for(i in 1:length(query)){
				q <- paste(q,names(query)[i],"=",query[[i]],sep="")
				if(i<length(query))
					q <- paste(q,"&",sep="")
			}
			query <- q
		}
		else if(is.character(query))
			query <- query
		else
			stop("Must specify query as named list or character string")
		xml <- dvQuery(verb = "download", query = paste(fileid,query,sep=""), dv = dv, browser=browser, ...)
	}
}
