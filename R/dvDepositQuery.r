dvDepositQuery <- function(query, user, pwd, dv=getOption('dvn'), browser=FALSE, apiversion='v1', ...){
    # Data Deposit API workhorse
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
    url <- paste(dv,"api/data-deposit/",apiversion,"/swordv2/",query,sep="")
    userpwd <- paste(user,pwd,sep=':')
    if(browser){
        tmp <- strsplit(url,"://")[[1]]
        browseURL(paste(tmp[1],'://',userpwd,'@',tmp[2],sep=''))
    }
    else{
        xml <- getURL(url, followlocation = TRUE, userpwd=userpwd,
                    #ssl.verifypeer = TRUE, ssl.verifyhost = TRUE,
                    ssl.verifypeer = FALSE, ssl.verifyhost = FALSE, ...)
                    #cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
        return(xml)
    }
}
