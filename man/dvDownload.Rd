\name{dvDownload}
\alias{dvDownload}
\title{Download a file}
\description{Download a dataverse file into R or in a web browser}
\usage{
dvDownload(fileid, query = NULL, dv = getOption('dvn'), browser = FALSE, ...)
}
\arguments{
  \item{fileid}{A character string specifying a dataverse fileId for a file contained in a dataverse reocrd. This is distinct from the \code{objectid} that identifies the entire dataverse records.}
  \item{query}{An optional character string or named list of additional query parameters from \code{\link{dvDownloadInfo}}.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
\details{Due to access restrictions placed on some files, not all files are directly downloadable into R. \code{dvDownload} automatically checks whether files can be downloaded directly with \code{\link{dvDownloadInfo}} and stops if direct access is unavailable. Otherwise the file is downloaded and returned.}
\value{The requested file as an R object.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvDownloadInfo}}
}
\examples{
\dontrun{
dvDownload("9956")
}
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
