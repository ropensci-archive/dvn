\name{dvn-package}
\alias{dvn-package}
\alias{dvn}
\docType{package}
\title{Access to The Dataverse Network APIs}
\description{Provides access to The Dataverse Network Data Sharing and Data Deposit APIs via RCurl.

The Data Sharing API provides access to archived data (and metadata). The dvn package provides a number of functions to translate API responses into R data structures using the XML package.

The Data Deposit API provides the ability to create and modify Dataverse studies. Support for these features is in ongoing development.}
\details{
\tabular{ll}{
Package: \tab dvn\cr
Type: \tab Package\cr
Version: \tab 0.2.9\cr
Date: \tab 2013-10-13\cr
License: \tab GPL-2\cr
}
}
\author{
Thomas J. Leeper

Maintainer: Thomas J. Leeper <thosjleeper@gmail.com>
}
\references{
\href{http://switch.dl.sourceforge.net/project/dvn/dvn/3.0/dvnapi_v1_0.pdf}{Dataverse Data Sharing API Documentation}

\href{http://dvn.github.io/devguide/features/api/data-deposit/}{Dataverse Data Deposit API Developer's Guide}

\href{http://dvn.github.io/devguide/features/api/data-deposit/v1/}{Dataverse Data Deposit API v1 Developer's Guide}

\href{http://thedata.org/}{The Dataverse Network}

\href{http://thedata.harvard.edu/dvn/}{Harvard IQSS Dataverse}
}
\keyword{ package }
%\seealso{}
\examples{
\dontrun{
    ## A basic Data Sharing API workflow:
    # find available search fields
    fields <- dvSearchFields()
    
    # search within those fields
    search <- dvSearch(list(authorName="leeper"))
    
    # retrieve available metadata formats for a search result
    formats <- dvMetadataFormats(search$objectId[1])
    
    # retrieve metadata in an available format and find fileId(s)
    files <- dvExtractFileIds(dvMetadata(search$objectId[1], format.type=formats$formatName[1]))
    
    # optional search for information about data download
    info <- dvDownloadInfo(files$fileId[1])
    
    # download the data, if allowed by Terms of Use
    data <- dvDownload(files$fileId[1])
    
    # change Dataverse network (to Odum Institute)
    options(dvn='https://arc.irss.unc.edu/dvn/')
    search <- dvSearch(list(authorName="leeper"))
}
\dontrun{
    ## Use basic Data Deposit API functions:
    options(dvn.user="username")
    options(dvn.pwd="password")
    # retrieve my Dataverses and their terms of use
    dvServiceDoc()
    
    # Retrieve available studies in a user's dataverse with either:
    user <- dvUserStudies("mydataverse")
    # Or:
    user <- dvUserStudies(dvServiceDoc())
    
    # retrieve a 'Study Atom', providing the citation for a study
    dvStudyAtom(user$studies$objectId)
    
    # retrieve a 'Study Statement' providing files stored in a study
    dvStudyStatement(user$studies$objectId)
}
\dontrun{
    ## Create a study, add files, and release:
    options(dvn.user="username")
    options(dvn.pwd="password")
    # Check credentials and accessible dataverses
    dvServiceDoc()
    
    # Create study metadata and create study with it
    writeLines(dvBuildMetadata(title="My Study"),"mystudy.xml")
    created <- dvCreateStudy("mydataverse","mystudy.xml")
    
    # Get `objectId` from `dvUserStudies`
    objectid <- dvUserStudies("mydataverse")$studies$objectId[1]
    # Or, retrieve dataverse `objectid` from `dvCreateStudy` receipt
    objectid <- created$objectId
    
    # Add files and release study using `objectid`
    dvAddFile(objectid,"mydata.zip")
    # or add multiple files:
    dvAddFile(objectid,c("file1.csv","file2.txt"))
    # Release study
    dvReleaseStudy(objectid)
}
}
