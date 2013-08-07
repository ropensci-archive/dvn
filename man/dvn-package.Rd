\name{dvn-package}
\alias{dvn-package}
\alias{dvn}
\docType{package}
\title{Access to The Dataverse Network API}
\description{Provides access to The Dataverse Network API via the RCurl package, enabling access to archived data (and metadata), along with a number of functions to translate responses to API calls into R data structures using the XML package.}
\details{
\tabular{ll}{
Package: \tab dvn\cr
Type: \tab Package\cr
Version: \tab 0.2\cr
Date: \tab 2013-06-30\cr
License: \tab GPL-2\cr
}
}
\author{
Thomas J. Leeper

Maintainer: Thomas J. Leeper <thosjleeper@gmail.com>
}
\references{
\href{http://switch.dl.sourceforge.net/project/dvn/dvn/3.0/dvnapi_v1_0.pdf}{Dataverse API Documentation}

\href{http://thedata.org/}{The Dataverse Network}

\href{http://dvn.iq.harvard.edu/dvn/}{Harvard IQSS Dataverse}
}
\keyword{ package }
%\seealso{}
\examples{
# A basic workflow
require(RCurl)
if(url.exists("https://dvn.iq.harvard.edu/dvn/api/metadataSearchFields",
	followlocation=TRUE, ssl.verifypeer = FALSE, ssl.verifyhost = FALSE)){
	## find available search fields
	fields <- dvSearchFields()
	
	## search within those fields
	search <- dvSearch(list(authorName="leeper"))
	
	## retrieve available metadata formats for a search result
	formats <- dvMetadataFormats(search$objectid[1])
	
	## retrieve metadata in an available format and find fileId(s)
	files <- dvExtractFileIds(dvMetadata(search$objectid[1], format.type=formats$formatName[1]))
	
	\dontrun{
	## optional search for information about data download
	info <- dvDownloadInfo(files$fileId[1])
	
	## download the data, if allowed by Terms of Use
	data <- dvDownload(files$fileId[1])
	}
}
}
