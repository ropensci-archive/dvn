\name{dvSearch}
\alias{dvSearch}
\title{Search a Dataverse}
\description{Search a Dataverse by keyword(s) in one or more metadata fields.}
\usage{
dvSearch(query, boolean = "AND", dv = getOption('dvn'), browser = FALSE, ...)
}
\arguments{
  \item{query}{Either a list of named search parameters or an appropriately formatted character string of search parameters. Search parameters can be retrieved via \code{\link{dvSearchFields}}. If specified as a list with a single, unnamed element, the search is performed on all available fields using a boolean OR logic.}
  \item{boolean}{A character string specifying the boolean \dQuote{AND} (the default) or \dQuote{OR} by which multiple values in the \code{query} parameter should be combined. Ignored if \code{query} is a single character string or one-element list.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
\details{Unlike searching on the dataverse website, the API requires searching within named metdata fields. The set of available metadata fields can be retrieved from \code{\link{dvSearchFields}}.}
\value{A dataframe containing one variable (\code{objectId}), made up of character strings containing dataverse objectIds.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvSearchFields}}
}
\examples{
\dontrun{
search1 <- dvSearch("authorName:leeper")
search2 <- dvSearch(list(title="Denmark",title="Sweden"),boolean="OR")
search3 <- dvSearch(list("puppies"))
}
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
