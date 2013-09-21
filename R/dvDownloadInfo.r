dvDownloadInfo <- function(fileid, dv = getOption('dvn'), browser=FALSE, ...){
	if(is.null(fileid))
		stop("Must specify fileId")
	xml <- dvQuery(verb = "downloadInfo", query = fileid, dv = dv, browser=browser, ...)
	if(is.null(xml))
		invisible(NULL)
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
