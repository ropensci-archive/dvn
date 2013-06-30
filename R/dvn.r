dvQuery <- function(verb, query = NULL, dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE){
	# workhorse query function
	if(!verb %in% c("metadataSearchFields", "metadataSearch", "metadataFormatsAvailable", "metadata", "downloadInfo", "download"))
		stop("API query verb not recognized")
	if(is.null(dv) || dv=="")
		stop("Must specify Dataverse URL as 'dv'")
	else{
		https <- substring(dv,1,5)
		if(!https=="https")
			stop("API query must use https")
		slash <- substring(dv,nchar(dv),nchar(dv))
		if(!slash=="/")
			dv <- paste(dv,"/",sep="")
	}
	url <- paste(dv,"api/",verb,sep="")
	if(!is.null(query))
		url <- paste(url,query,sep="/")
	if(browser)
		browseURL(url)
	else{
		xml <- getURL(url, followlocation = TRUE, 
					ssl.verifypeer = TRUE, ssl.verifyhost = TRUE, 
					cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
		return(xml)
	}
}



dvSearchFields <- function(dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE){
	xml <- dvQuery(verb = "metadataSearchFields", query = NULL, dv = dv, browser=browser)
	if(browser==FALSE){
		searchterms <- xpathApply(xmlParse(xml),"//SearchableField")
		d <- data.frame(matrix(nrow=length(searchterms),ncol=2))
		names(d) <- c("fieldName","fieldDescription")
		for(i in 1:length(searchterms)){
			d$fieldName[i] <- xmlValue(xmlChildren(searchterms[[i]])$fieldName)
			d$fieldDescription[i] <- xmlValue(xmlChildren(searchterms[[i]])$fieldDescription)
		}
		return(d)
	}
}


dvSearch <- function(query, dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE){
	if(is.null(query))
		stop("Must specify query as named list or character string")
	else{
		if(is.list(query)){
			q <- ""
			for(i in 1:length(query)){
				q <- paste(q,names(query)[i],":",query[[i]],sep="")
				if(i<length(query))
					q <- paste(q," AND ",sep="")
			}
			query <- q
		}
		else if(is.character(query))
			query <- query
		else
			stop("Must specify query as named list or character string")
	}
	xml <- dvQuery(verb = "metadataSearch", query = query, dv = dv, browser=browser)
	if(browser==FALSE){
		results <- xpathApply(xmlParse(xml),"//study")
		d <- data.frame(matrix(nrow=length(results),ncol=1))
		names(d) <- c("objectid")
		for(i in 1:length(results)){
			d$objectid[i] <- xmlAttrs(results[[i]])
		}
		return(d)
	}
}

dvMetadataFormats <- function(objectid, dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE){
	xml <- dvQuery(verb = "metadataFormatsAvailable", query = objectid, dv = dv, browser=browser)
	if(browser==FALSE){
		searchterms <- xpathApply(xmlParse(xml),"//formatAvailable")
		if(length(searchterms)>0){
			d <- data.frame(matrix(nrow=length(searchterms),ncol=3))
			names(d) <- c("formatName","formatSchema","formatMime")
			for(i in 1:length(searchterms)){
				d$formatName[i] <- xmlValue(xmlChildren(searchterms[[i]])$formatName)
				d$formatSchema[i] <- xmlValue(xmlChildren(searchterms[[i]])$formatSchema)
				d$formatMime[i] <- xmlValue(xmlChildren(searchterms[[i]])$formatMime)
			}
			return(d)
		}
		else
			return(NULL)
	}
}

dvMetadata <- function(objectid, format.type=NULL, include=NULL, exclude=NULL,
						dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE){
	if(is.null(format.type)){
		query <- objectid
		if(!is.null(include))
			query <- paste(query,"/?partialInclude=",include,sep="")
		if(!is.null(exclude))
			query <- paste(query,"/?partialExclude=",exclude,sep="")
	}
	else{
		query <- paste(objectid,"/?formatType=",format.type,sep="")
		if(!is.null(include))
			query <- paste(query,"&partialInclude=",include,sep="")
		if(!is.null(exclude))
			query <- paste(query,"&partialExclude=",exclude,sep="")
	}
	xml <- dvQuery(verb = "metadata", query = query, dv = dv, browser=browser)
	if(browser==FALSE)
		return(xml)
}

dvExtractFileIds <- function(xml){
	nodes <- xmlChildren(xmlChildren(xmlParse(xml))$codeBook)
	dscrs <- nodes[names(nodes)=="fileDscr"]
	d <- data.frame(matrix(nrow=length(dscrs),ncol=5))
	names(d) <- c("fileName","fileId","URI","caseQnty","varQnty")
	for(i in 1:length(dscrs)){
		attrs <- xmlAttrs(dscrs[[i]])
		d$fileName[i] <- xmlValue(xmlChildren(xmlChildren(dscrs[[i]])$fileTxt)$fileName)
		d$fileId[i] <- attrs[names(attrs)=="ID"]
		d$fileId[i] <- substring(d$fileId[i],2,nchar(d$fileId[i])) # remove leading 'f' from fileId
		d$URI[i] <- attrs[names(attrs)=="URI"]
		dims <- xmlChildren(xmlChildren(xmlChildren(dscrs[[i]])$fileTxt)$dimensns)
		d$caseQnty[i] <- xmlValue(dims$caseQnty)
		d$varQnty[i] <- xmlValue(dims$varQnty)
	}
	return(d)
}

dvDownloadInfo <- function(fileid, dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE){
	if(is.null(fileid))
		stop("Must specify fileId")
	xml <- dvQuery(verb = "downloadInfo", query = fileid, dv = dv, browser=browser)
	if(browser==FALSE){
		details <- list()
		services <- xpathApply(xmlParse(xml),"//accessService")
		attrs <- xmlAttrs(xpathApply(xmlParse(xml),"//studyFile")[[1]])
		details$fileId <- as.character(attrs[names(attrs)=="fileId"])
		details$fileName <- xmlValue(xpathApply(xmlParse(xml),"//fileName")[[1]])
		details$fileMimeType <- xmlValue(xpathApply(xmlParse(xml),"//fileMimeType")[[1]])
		details$fileSize <- xmlValue(xpathApply(xmlParse(xml),"//fileSize")[[1]])
		details$authMethod <- xmlValue(xpathApply(xmlParse(xml),"//authMethod")[[1]])
		attrs <- xmlAttrs(xpathApply(xmlParse(xml),"//Authorization")[[1]])
		details$directAccess <- as.character(attrs[names(attrs)=="directAccess"])
		x <- xpathApply(xmlParse(xml),"//accessPermissions")
		if(length(x)>0)
			details$accessPermissions <- xmlValue(x[[1]])
		x <- xpathApply(xmlParse(xml),"//accessRestrictions")
		if(length(x)>0)
			details$accessRestrictions <- xmlValue(x[[1]])
		else
			details$accessRestrictions <- ""
		
		details$accessServicesSupported <- data.frame(matrix(nrow=length(services),ncol=4))
		names(details$accessServicesSupported) <- c("serviceName","serviceArgs","contentType","serviceDesc")
		for(i in 1:length(services)){
			c <- xmlChildren(services[[i]])
			details$accessServicesSupported$serviceName[i] <- xmlValue(c$serviceName)
			details$accessServicesSupported$serviceArgs[i] <- xmlValue(c$serviceArgs)
			details$accessServicesSupported$contentType[i] <- xmlValue(c$contentType)
			details$accessServicesSupported$serviceDesc[i] <- xmlValue(c$serviceDesc)
		}
		invisible(details)
	}
}

dvDownload <- function(fileid, query=NULL, dv = "https://dvn.iq.harvard.edu/dvn/", browser=FALSE){
	if(is.null(fileid))
		stop("Must specify fileId")
	direct <- dvDownloadInfo(fileid)
	if(direct$directAccess=="false")
		stop("Data cannot be accessed directly (",direct$accessRestrictions,")...try using URI from dvExtractFileIds(dvMetadata())")
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
		xml <- dvQuery(verb = "download", query = paste(fileid,query,sep=""), dv = dv, browser=browser)
	}
}
