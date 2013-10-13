\name{dvDownloadInfo}
\alias{dvDownloadInfo}
\alias{print.dvDownloadInfo}
\title{Retrieve file download information}
\description{Retrieve download information for a dataverse file.}
\usage{
dvDownloadInfo(fileid, dv = getOption('dvn'), browser = FALSE, ...)
}
\arguments{
  \item{fileid}{A character string specifying a dataverse fileId for a file contained in a dataverse record. This is distinct from the \code{objectid} that identifies the entire dataverse records.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
\value{
A list containing details of the (potentially downloadable) file:
  \item{fileId}{A character string containing the value of \dQuote{fileid} from the original request.}
  \item{fileName}{A character string containing the name of the requested file.}
  \item{fileMimeType}{A character string containing the MIME type of the requested file.}
  \item{fileSize}{A character string containing the file size in bytes.}
  \item{authMethod}{A character string specifying the authentication method for the request}
  \item{directAccess}{A character string containing a logical for whether the file can be downloaded directly via the API.}
  \item{accessRestrictions}{A character string containing details on any file access restrictions.}
  \item{accessServicesSupported}{A dataframe detailing the available file formats for download.}
  \item{xml}{A character string containing the original API response in XML.}

Note: access restrictions on files may prevent them from being downloaded directly in R.
}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvDownload}}
}
\examples{
\dontrun{
info <- dvDownloadInfo("9956")
}
}
