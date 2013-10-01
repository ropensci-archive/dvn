dvExtractFileIds <- function(xml){
	if(is.null(xmlChildren(xmlParse(xml))$codeBook))
        stop("Metadata format not currently supported. Must be 'ddi'.")
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
