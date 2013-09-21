dvSearch <- function(query, dv = getOption('dvn'), browser=FALSE, ...){
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
	xml <- dvQuery(verb = "metadataSearch", query = query, dv = dv, browser=browser, ...)
	if(is.null(xml))
		invisible(NULL)
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
