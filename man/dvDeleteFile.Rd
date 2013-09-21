\name{dvDeleteFile}
\alias{dvDeleteFile}
\title{Delete a study file}
\description{Use Data Deposit API to delete a study file.}
\usage{
dvDeleteStudy(user, pwd, fileid, dv=getOption('dvn'), browser=FALSE, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{fileid}{A character string specifying a dataverse fileId for a file contained in a dataverse record. This is distinct from the \code{objectid} that identifies the entire study in which the file is located. This could be returned from \code{\link{dvCreateStudy}}, \code{\link{dvStudyStatement}}, (or, \code{\link{dvExtractFileIds}}, from the Data Sharing API).}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
\details{This deletes a file in a study.}
\value{If successful, the response is an empty character string.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
