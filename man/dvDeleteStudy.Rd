\name{dvDeleteStudy}
\alias{dvDeleteStudy}
\title{Delete (or deaccession) a study}
\description{Use Data Deposit API to delete an unreleased study or deaccession a released study.}
\usage{
dvDeleteStudy(user, pwd, objectid, dv=getOption('dvn'), browser=FALSE, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{objectid}{A character string containing the id for a dataverse study (a handle). This could be returned from \code{\link{dvUserStudies}}, \code{\link{dvCreateStudy}}, (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
\details{
If a study has been created but not released, \code{dvDeleteStudy} will delete it permanently.

If a study has been created and released, \code{dvDeleteStudy} will deaccession it (i.e., reverse the release). Currently, a previously released study cannot be deleted. Attempting to delete a deaccessioned study will produce an error.
}
\value{If successful, the response is an empty character string.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
