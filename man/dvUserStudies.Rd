\name{dvUserStudies}
\alias{dvUserStudies}
\title{Studies in a Dataverse}
\description{Use Data Deposit API to obtain list of studies in a named Dataverse.}
\usage{
dvUserStudies(user, pwd, dvname, dv=getOption('dvn'), browser=FALSE, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{dvname}{A character string containing the name of a dataverse collection. Must be a dataverse accessible to this user (perhaps as returned by \code{\link{dvServiceDoc}}.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvDepositQuery}}.}
}
%\details{}
\value{A character string containing an XML data structure, which describes the studies available in a named dataverse.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvStudyStatement}}
\code{\link{dvStudyAtom}}
}
%\examples{}
