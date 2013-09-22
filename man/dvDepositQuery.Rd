\name{dvDepositQuery}
\alias{dvDepositQuery}
\title{Execute a Data Deposit API Query}
\description{Primarily an internal function for executing Data Deposit API calls.}
\usage{
dvDepositQuery(query, user, pwd, dv=getOption('dvn'), browser=FALSE, apiversion='v1', httpverb='GET', fulluri=NULL, ...)
}
\arguments{
  \item{query}{A character string specifying query parameters.}
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{apiversion}{A character string specifying the Data Deposit API version. Currently only \dQuote{v1} (the default).}
  \item{httpverb}{A character string specifying one of \dQuote{GET} (the default), \dQuote{POST}, \dQuote{PUT}, or \dQuote{DELETE}. Not all verbs work on all SWORD URIs. See \href{http://dvn.github.io/devguide/features/api/data-deposit/}{Dataverse Developer's Guide}.}
  \item{fulluri}{Instead of specifying \code{query}, \code{dv}, and \code{apiversion}, one can specify the full URI for a Data Deposit action, perhaps as returned by \code{\link{dvStudyAtom}}.}
  \item{...}{Optionally, additional arguments passed to \code{curlPerform}.}
}
\details{Primarily for internal use.}
\value{A character string containing an XML data structure.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
