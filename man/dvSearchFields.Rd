\name{dvSearchFields}
\alias{dvSearchFields}
\title{Lookup available search fields}
\description{Lookup names and descriptions of search fields available via the API}
\usage{
dvSearchFields(dv = getOption('dvn'), browser = FALSE, ...)
}
\arguments{
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
\value{A dataframe listing the names (and, sometimes, descriptions) of available search fields for use in \code{\link{dvSearch}} for the target dataverse.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvSearch}}
}
\examples{
fields <- dvSearchFields()
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
