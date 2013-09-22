\name{dvDepositQuery}
\alias{dvDepositQuery}
\title{Execute a Data Deposit API Query}
\description{Primarily an internal function for executing Data Deposit API calls.}
\usage{
dvDepositQuery(query, user, pwd, dv=getOption('dvn'), browser=FALSE, apiversion='v1', ...)
}
\arguments{
  \item{query}{A character string specifying query parameters.}
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{apiversion}{A chracter string specifying the Data Deposit API version. Currently only \dQuote{v1} (the default).}
  \item{fulluri}{Instead of specifying \code{query}, \code{dv}, and \{apiversion}, one can specify the full URI for a Data Deposit action, perhaps as returned by \code{\link{dvStudyAtom}}.}
  \item{...}{Optionally, additional arguments passed to \code{curlPerform}.}
}
\details{Primarily for internal use.}
\value{A character string containing an XML data structure.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
