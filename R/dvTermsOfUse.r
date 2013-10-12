dvTermsOfUse <- function(xml){
    if(inherits(xml,'dvServiceDoc')){
        out <- lapply(xml$dataverses$collectionPolicy, function(x){
            writeLines(x, tmp <- tempfile(fileext='.html'))
            browseURL(tmp)
            return(tmp)
        })
        #x <- readline(prompt='Hit return or any key to delete temporary HTML files...')
        Sys.sleep(1)
        unlink(out)
        return(invisible(xml))
    }
    else
        stop('Currently only objects of class `dvServiceDoc` are supported.')
}
