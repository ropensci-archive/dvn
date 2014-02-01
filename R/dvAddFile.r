dvAddFile <-
function(   objectid, filename=NULL, dataframe=NULL, category=NULL, dv=getOption('dvn'),
            user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), browser=FALSE, ...){
    if(inherits(objectid, 'dvStudyAtom'))
        objectid <- objectid$objectId
    if(is.null(category))
        catdir <- file.path(normalizePath(tempdir(),winslash='/'),'Files')
    else{
        category <- gsub('/','-',category)
        catdir <- file.path(normalizePath(tempdir(),winslash='/'),category)
    }
    dir.create(catdir, showWarnings = FALSE)
    if(is.null(user) | is.null(pwd))
        stop('Must specify username (`user`) and password (`pwd`)')
    if(is.null(filename) & is.null(dataframe))
        stop(   "Must specify `filename` as .zip or a vector of filenames,",
                " or `dataframe` as an R dataframe")
    if(!is.null(dataframe)){
        dataframe <- sapply(dataframe, function(x) {
            tmp <- file.path(catdir,paste(x,'RData',sep='.'))
            save(list=x, file=tmp)
            invisible(tmp)
        })
    }
    if(!is.null(filename))
        filename <- file.copy(from=filename, to=catdir, overwrite=TRUE)
    filename <- c(filename, dataframe)
    if(length(filename)>1 | (length(filename)==1 && !tools::file_ext(filename)=='zip')){
        d <- getwd()
        setwd(tempdir())
        tmpzip <- tempfile(fileext='.zip')
        if(is.null(category))
            zip(tmpzip, file.path('./Files',list.files('./Files')))
        else
            zip(tmpzip, file.path(paste('.',category,sep='/'),
                        list.files(paste('.',category,sep='/'))))
        setwd(d)
    }
    #file <- file(tmpzip, 'rb', raw=TRUE)
    xml <- dvDepositQuery(  query=paste('edit-media/study/',objectid,sep=''),
            user=user, pwd=pwd, dv=dv, browser=browser,
            httpverb='POST',
            #upload=TRUE, 
            #readfunction = RCurl:::uploadFunctionHandler(file, FALSE),
            #readfunction = readBin(file,what='raw',1e6),
            unrestricted.auth = 1L,
            postfields=readBin(tmpzip,what='raw',1e6),
            postfieldsize=file.info(tmpzip)$size,
            #postfields=readBin(tmpzip,what='raw',1e6),
            httpheader=c(   'Content-Disposition'=paste('attachment; filename',basename(tmpzip),sep='='),
                            'Content-Type'='application/zip',
                            'Packaging'='http://purl.org/net/sword/package/SimpleZip'))
    file.remove(file.path(catdir,list.files(catdir)))
    #file.remove(tmpzip)
    #close(file)
    if(is.null(xml))
        return(NULL)
	if(browser==FALSE)
        .dvParseAtom(xml)
}
