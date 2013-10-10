\name{dvServiceDoc}
\alias{dvServiceDoc}
\alias{print.dvServiceDoc}
\title{Get Dataverse Service Document}
\description{Obtain a Data Deposit API Service Document}
\usage{
dvServiceDoc(   dv=getOption('dvn'),
                user=getOption('dvn.user'), pwd=getOption('dvn.pwd'),
                browser=FALSE, ...)
}
\arguments{
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{user}{A character string containing a dataverse username. Default is \code{options('dvn.user')}.}
  \item{pwd}{A character string containing the corresponding dataverse password. Default is \code{options('dvn.pwd')}.}
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
