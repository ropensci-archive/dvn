\name{dvDownloadInfo}
\alias{dvDownloadInfo}
\title{Retrieve file download information}
\description{Retrieve download information for a dataverse file.}
\usage{
dvDownloadInfo(fileid, dv = "https://dvn.iq.harvard.edu/dvn/", browser = FALSE, ...)
}
\arguments{
  \item{fileid}{A character string specifying a dataverse fileId for a file contained in a dataverse reocrd. This is distinct from the \code{objectid} that identifies the entire dataverse records.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
\value{A list containing details of the (potentially downloadable) file. Note: access restrictions on files may prevent them from being downloaded directly in R.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvDownload}}
}
\examples{
info <- dvDownloadInfo("9956")
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
