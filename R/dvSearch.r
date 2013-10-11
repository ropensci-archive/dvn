dvSearch <- function(query, boolean='AND', dv = getOption('dvn'), browser=FALSE, ...){
	if(is.null(query))
		stop("Must specify query as named list or character string")
	else{
		if(is.list(query)){
			q <- ""
			for(i in 1:length(query)){
				q <- paste(q,names(query)[i],":",query[[i]],sep="")
				if(i<length(query))
					q <- paste(q,"%20",boolean,"%20",sep="")
			}
			query <- q
		}
		else if(is.character(query))
			query <- query
		else
			stop("Must specify query as named list or character string")
	}
	xml <- dvQuery(verb = "metadataSearch", query = query, dv = dv, browser=browser, ...)
	if(is.null(xml))
		invisible(NULL)
	if(browser==FALSE){
		results <- unlist(xpathApply(xmlParse(xml),"//study", fun=xmlAttrs))
		if(length(results))
			d <- data.frame(objectId=results)
		else
			d <- NULL
		message(nrow(d), ' search results returned\n')
		return(d)
	}
}
