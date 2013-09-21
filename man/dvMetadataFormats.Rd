\name{dvMetadataFormats}
\alias{dvMetadataFormats}
\title{Retrieve available metadata formats}
\description{Retrieve the available metadata formats that can be returned for a particular dataverse record.}
\usage{
dvMetadataFormats(objectid, dv = getOption('dvn'), browser = FALSE, ...)
}
\arguments{
  \item{objectid}{A dataverse object ID.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
\value{A dataframe containing names and supplemental information for the metadata format(s) available for specified dataverse object.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

%\seealso{}
\examples{
formats <- dvMetadataFormats("hdl:1902.1/17218")
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
