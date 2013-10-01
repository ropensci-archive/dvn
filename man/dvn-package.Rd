\name{dvn-package}
\alias{dvn-package}
\alias{dvn}
\docType{package}
\title{Access to The Dataverse Network APIs}
\description{Provides access to The Dataverse Network Data Sharing and Data Deposit APIs via the RCurl package.

The Data Sharing API provides access to archived data (and metadata). The dvn package provides a number of functions to translate API responses into R data structures using the XML package.

The Data Deposit API provides the ability to create and modify Dataverse studies. Support for these features is in ongoing development.}
\details{
\tabular{ll}{
Package: \tab dvn\cr
Type: \tab Package\cr
Version: \tab 0.2.5\cr
Date: \tab 2013-10-01\cr
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
	formats <- dvMetadataFormats(search$objectid[1])
	
	# retrieve metadata in an available format and find fileId(s)
	files <- dvExtractFileIds(dvMetadata(search$objectid[1], format.type=formats$formatName[1]))
	
	# optional search for information about data download
	info <- dvDownloadInfo(files$fileId[1])
	
	# download the data, if allowed by Terms of Use
	data <- dvDownload(files$fileId[1])
}
\dontrun{
    ## Use basic Data Deposit API functions:
    options(dvn.user="username")
    options(dvn.pwd="password")
    # retrieve my Dataverses and their terms of use
    dvServiceDoc()
    
    # retrieve studies for one of my dataverses
    dvUserStudies("leeper")
    
    # retrieve a 'Study Atom', providing the citation for a study
    dvStudyAtom("hdl:1902.1/17864")
    
    # retrieve a 'Study Statement' providing files stored in a study
    dvStudyStatement("hdl:1902.1/17864")
}
\dontrun{
    ## Create a study, add files, and release:
    options(dvn.user="username")
    options(dvn.pwd="password")
    # Check credentials and accessible dataverses
    dvServiceDoc()
    
    # Create study metadata and create study with it
    writeLines(dvBuildMetadata(title="My Study"),"mystudy.xml")
    dvCreateStudy("mydataverse","mystudy.xml")
    
    # retrieve dataverse `objectid` from `dvCreateStudy` receipt
    # add files and release study using `objectid`
    dvAddFile(objectid,"mydata.zip")
    dvReleaseStudy(objectid)
}
}
