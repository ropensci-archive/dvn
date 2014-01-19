dvBuildMetadata <- function(..., format='dcterms', validate=FALSE){
    if(format=='dcterms'){
        pairls <- list(...)
        dublincore <- c(
            "abstract","accessRights","accrualMethod","accrualPeriodicity",
            "accrualPolicy","alternative","audience","available",
            "bibliographicCitation","conformsTo","contributor","coverage",
            "created","creator","date","dateAccepted","dateCopyrighted",
            "dateSubmitted","description","educationLevel","extent","format",
            "hasFormat","hasPart","hasVersion","identifier","instructionalMethod",
            "isFormatOf","isPartOf","isReferencedBy","isReplacedBy","isRequiredBy",
            "issued","isVersionOf","language","license","mediator","medium",
            "modified","provenance","publisher","references","relation","replaces",
            "requires","rights","rightsHolder","source","spatial","subject",
            "tableOfContents","temporal","title","type","valid")
        if(any(!names(pairls) %in% dublincore))
            stop('All names of `...` parameters must be in Dublin Core')
        if(!'title' %in% names(pairls))
            stop('"title" is a required metadata field')
        entry <- newXMLNode('entry', namespaceDefinitions=
                    c(  'http://www.w3.org/2005/Atom',
                        dcterms='http://purl.org/dc/terms/'))
        dcchild <- function(x,y)
            dcnode <- newXMLNode(y, x, namespace='dcterms')
        addChildren(entry, mapply(dcchild,pairls,names(pairls)))
        entry <- paste('<?xml version="1.0" encoding="UTF-8" ?>\n',toString.XMLNode(entry),sep='')
        if(validate) {
            # run an XML schema validation
            #valid <- xmlSchemaValidate('http://purl.org/dc/terms/', entry)
        }
        class(entry) <- c(class(entry),'dvMetadata')
        attr(entry,'formatName') <- format
        return(entry)
    } else if(format=='ddi_controlcard'){
        warning('Support for DDI control card is still experimental')
        
        n <- list(...)
        if(is.null(n$filename))
            stop('Must specify a `filename`')
        if(is.null(n$df))
            stop('Must specify a dataframe as `df`')
        df <- n$df
        vnames <- names(df)
        if(is.null(n$varlabels))
            varlabels <- names(df)
        vclass <- sapply(df, class)
        # NEED TO FORMAT vclass TO BE 'discrete' AND 'contin' ONLY
        vclass <- ifelse(vclass=='character', 'discrete', vclass)
        vclass <- ifelse(vclass=='factor', 'discrete', vclass)
        vclass <- ifelse(vclass=='integer', 'discrete', vclass)
        vclass <- ifelse(vclass=='numeric', 'contin', vclass)
        
        entry <- newXMLNode('codeBook', namespaceDefinitions = 'http://www.icpsr.umich.edu/DDI')
        # fileDscr field
        fileDscr <- newXMLNode('fileDscr', parent=entry)
        if(!is.null(n$filename)){
            fileTxt <- newXMLNode('fileTxt', attrs = c(ID=n$filename), parent = fileDscr)
        } else{
            fileTxt <- newXMLNode('fileTxt', parent=fileDscr)
        }
        dimensns <- newXMLNode('dimensns', parent=fileTxt)
            caseQnty <- newXMLNode('caseQnty', dim(df)[1], parent=dimensns)
            varQnty <- newXMLNode('varQnty', dim(df)[2], parent=dimensns)
        # dataDscr field
        dataDscr <- newXMLNode('dataDscr', parent=entry)
        for(i in 1:length(df)){
            var <- newXMLNode('var', parent = fileDscr)
            addAttributes(var,  #ID=paste('v1',i,sep='.'),
                                name=vnames[i],
                                intrvl=vclass[i])
            location <- newXMLNode('location', attrs = c(fileid = n$filename), parent=var)
            labl <- newXMLNode('labl', varlabels[i], attrs = c(level = 'variable'), parent=var)
            if(inherits(df[,i], 'numeric') | inherits(df[,i], 'integer')){
                varFormat <- newXMLNode('varFormat', attrs = c(type = 'numeric'), parent=var)
            } else if( inherits(df[,i], 'character') | inherits(df[,i], 'AsIs')){
                varFormat <- newXMLNode('varFormat', attrs = c(type = 'character'), parent=var)
            } else if(inherits(df[,i], 'factor')){
                sapply(levels(df[,i]), function(i){
                    catgry <- newXMLNode('catgry', parent = var)
                    z <- newXMLNode('catValu', i, parent = catgry)
                    addChildren(var, catgry)
                })
                #varFormat <- newXMLNode('varFormat', attrs = c(type = 'numeric'), parent=var)
                varFormat <- newXMLNode('varFormat', attrs = c(type = 'character'), parent=var)
            }
            addChildren(dataDscr, var)
        }
        
        entry <- paste('<?xml version="1.0" encoding="UTF-8" ?>\n',toString.XMLNode(entry),sep='')
        if(validate) {
            # run an XML schema validation
            #valid <- xmlSchemaValidate('http://www.icpsr.umich.edu/DDI', entry)
        }
        class(entry) <- c(class(entry),'dvMetadata')
        attr(entry,'formatName') <- 'ddi'
        return(entry)
    } else if(format=='spss_controlcard') {
        warning('Support for SPSS control card is still experimental')
        
        # http://guides.thedata.org/book/csv-data-spss-style-control-card-0
        
        n <- list(...)
        
        entry <- ''
        entry <- paste(entry, 'data list list(',')\n')
        
        # data formats
        # A8 8 byte character string;
        # A character string;
        # f10.2 numeric value, 10 decimal digits, with 2 fractional digits;
        # f8 defaults to F8.0
        # F defaults to F.0, i.e., numeric integer value
        # 2 defaults to F.2, i.e., numeric float value with 2 fractional digits.
        # 
        # DATE                            yyyy-MM-dd
        # DATETIME                        yyyy-MM-dd HH:mm:ss
        entry <- paste(entry, '\n.\n')
        
        
        # variable formats
        entry <- paste(entry, 'VARIABLE LABELS\n')
        entry <- paste(entry, '\n.\n')
        
        
        # value labels
        
        # missing values
        
        # number of cases
        entry <- paste(entry, 'NUMBER of CASES', dim(n$df)[1])
        
        ## NEED TO STRIP COMMAS FROM ALL CHARACTER STRINGS
        
        class(entry) <- c(class(entry),'dvMetadata')
        attr(entry,'formatName') <- 'spss'
        return(entry)
        
    } else
        stop('Only format=="dcterms" is fully supported')
}
