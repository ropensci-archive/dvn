.dvParseAtom <- function(xml){
    xmllist <- xmlToList(xml)
    xmlout <- list( bibliographicCitation = xmllist$bibliographicCitation,
                    generator = xmllist$generator,
                    id = xmllist$id)
    xmlout$objectId <- strsplit(xmlout$id,'study/')[[1]][2]
    xmlout$xml <- xml
    return(xmlout)
}