\name{dvSearch}
\alias{dvSearch}
\title{Search a Dataverse}
\description{Search a Dataverse by keyword(s) in one or more metadata fields.}
\usage{
dvSearch(query, dv = "https://dvn.iq.harvard.edu/dvn/", browser = FALSE)
}
\arguments{
  \item{query}{Either a list of named search parameters or an appropriately formatted character string of search parameters. Search parameters can be retrieved via \code{\link{dvSearchFields}}.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
}
%\details{}
\value{A dataframe containing one variable (\code{objectid}), made up of character strings containing dataverse objectids.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvSearchFields}}
}
\examples{
search1 <- dvSearch("authorName:leeper")
search2 <- dvSearch(list(title="Denmark"))
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
