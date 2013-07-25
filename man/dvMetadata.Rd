\name{dvMetadata}
\alias{dvMetadata}
\title{Retrieve metadata}
\description{Retrieve metadata for a dataverse record, using its object ID.}
\usage{
dvMetadata(objectid, format.type = NULL, include = NULL, exclude = NULL,
			dv = "https://dvn.iq.harvard.edu/dvn/", browser = FALSE, ...)
}
\arguments{
  \item{objectid}{A dataverse object ID.}
  \item{format.type}{An optional character string specifying the format of the returned metadata. Available options can be retrieved with \code{\link{dvMetadataFormats}}.}
  \item{include}{An optional character string specifying what metadata to include in the response.}
  \item{exclude}{An optional character string specifying what metadata to exclude from the response.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
\value{An XML data structure containing metadata for the specified dataverse record.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvMetadataFormats}}
\code{\link{dvExtractFileIds}}
}
\examples{
\dontrun{
xml <- dvMetadata("hdl:1902.1/17218")
}
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
