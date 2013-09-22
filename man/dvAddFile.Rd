\name{dvAddFile}
\alias{dvAddFile}
\title{Add a study file}
\description{Use Data Deposit API to add a file to a study.}
\usage{
dvDeleteStudy(user, pwd, objectid, file, dv=getOption('dvn'), browser=FALSE, size=1e7, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{objectid}{A character string containing the id for a dataverse study (a handle). This could be returned from \code{\link{dvUserStudies}}, \code{\link{dvCreateStudy}}, (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{file}{The path to a file to be uploaded. Currently only .zip files are supported.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{size}{A numeric indicating an (over)estimate of the file size. Underestimating file size creates problems when the .zip is read into memory.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
\details{This send a (.zip) file to a study, decompresses it, and adds the file contents to the study.}
\value{If successful, the Atom entry xml for the study.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
