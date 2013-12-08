.dvExtractUNF <- function(xml){
    if(is.null(xmlChildren(xmlParse(xml))$codeBook))
        stop("Metadata format not currently supported. Must be 'ddi'.")
    nodes <- xmlChildren(xmlChildren(xmlParse(xml))$codeBook)
    files <- nodes[names(nodes)=='fileDscr']
    
    fileids <- sapply(files, function(i) xmlAttrs(i)['ID'])
    fileunfs <- unlist(sapply(files, function(i) {
        notes <- xmlChildren(i)[names(xmlChildren(i))=='notes']
        x <- sapply(notes, function(i) if(any(xmlAttrs(i)=='Universal Numeric Fingerprint')) xmlValue(i))
        x[!sapply(x, is.null)]
    }))
    v <- strsplit(fileunfs[1],':')[[1]][2]
    
    unfs <- t(sapply(xmlChildren(nodes$dataDscr), function(i){
        child <- xmlChildren(i)
        fileid <- xmlAttrs(child$location)[names(xmlAttrs(child$location))=='fileid']
        note <- child[names(child)=='notes']
        varunf <- sapply(note, function(i){
            if('Universal Numeric Fingerprint' %in% xmlAttrs(i)){
                s <- strsplit(xmlValue(i),':')[[1]]
                s[length(s)]
            }
        })
        return(list(fileid,unname(varunf[1])))
    }))
    rownames(unfs) <- sapply(xmlChildren(nodes$dataDscr), function(i) xmlAttrs(i)['name'])
    colnames(unfs) <- c('fileid','UNF')
    vars <- lapply(unique(unfs[,'fileid']), function(i) {
        o <- unfs[unfs[,'fileid']==i,'UNF']
        class(o) <- 'UNF'
        o
    })
    names(vars) <- unique(unfs[,'fileid'])
    
    buildlist <- function(i, j){
        s <- strsplit(i,':')[[1]]
        o <- list(unf = s[length(s)],
                  variables = unlist(j))
        class(o) <- c('UNF')
        attr(o, 'version') <- v
        return(o)
    }
    out <- mapply(buildlist, fileunfs, vars, SIMPLIFY=FALSE)
    names(out) <- fileids
    
    return(out)
}
