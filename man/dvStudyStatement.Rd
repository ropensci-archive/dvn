\name{dvStudyStatement}
\alias{dvStudyStatement}
\title{Obtain a study statement}
\description{Use Data Deposit API to obtain a listing of study contents.}
\usage{
dvStudyStatement(user, pwd, objectid, dv=getOption('dvn'), browser=FALSE, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{objectid}{A character string containing the id for a dataverse study (a handle). This could be returned from \code{\link{dvUserStudies}} (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
\value{A character string containing an XML data structure, describing study contents (i.e., study files).}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
