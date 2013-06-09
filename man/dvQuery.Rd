\name{dvQuery}
\alias{dvQuery}
\title{Execute an API Query}
\description{Primarily an internal function for executing API calls.}
\usage{
dvQuery(verb, query = NULL, dv = "https://dvn.iq.harvard.edu/dvn/", browser = FALSE)
}
\arguments{
  \item{verb}{An API verb of \code{metadataSearchFields}, \code{metadataSearch}, \code{metadataFormatsAvailable}, \code{metadata}, \code{downloadInfo}, \code{download}.}
  \item{query}{An optional character string specifying additional query parameters.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
}
\details{Primarily for internal use.}
\value{A character string containing an XML data structure.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
