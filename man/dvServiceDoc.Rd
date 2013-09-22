\name{dvServiceDoc}
\alias{dvServiceDoc}
\title{Get Dataverse Service Document}
\description{Obtain a Data Deposit API Service Document}
\usage{
dvServiceDoc(user, pwd, dv=getOption('dvn'), browser=FALSE, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvDepositQuery}}.}
}
%\details{}
\value{A character string containing an XML data structure, which describes the dataverses available to the user and the terms of use for those dataverses.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
