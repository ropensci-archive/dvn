\name{dvAddFile}
\alias{dvAddFile}
\title{Add a study file}
\description{Use Data Deposit API to add a file to a study.}
\usage{
dvAddFile(  objectid, filename, filesize=1e7, dv=getOption('dvn'),
            user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), 
            browser=FALSE, ...)
}
\arguments{
  \item{objectid}{A character string containing the id for a dataverse study (a handle). This could be returned from \code{\link{dvUserStudies}}, \code{\link{dvCreateStudy}}, (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{filename}{The path to a file to be uploaded. Currently only .zip files are supported.}
  \item{filesize}{A numeric indicating an (over)estimate of the file size. Underestimating file size creates problems when the .zip is read into memory.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{user}{A character string containing a dataverse username. Default is \code{options('dvn.user')}.}
  \item{pwd}{A character string containing the corresponding dataverse password. Default is \code{options('dvn.pwd')}.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{curlPerform} via \code{\link{dvDepositQuery}}.}
}
\details{This send a (.zip) file to a study, decompresses it, and adds the file contents to the study.

Note: Filenames in the .zip must be unique and cannot duplicate the names of any files already attached to the study. Use \code{\link{dvDeleteFile}} to remove previous files and then replace by uploading a new .zip.
}
\value{If successful, the Atom entry xml for the study. See \code{\link{dvStudyAtom}}.}
%\references{}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvDeleteFile}}
\code{\link{dvCreateStudy}}
\code{\link{dvEditStudy}}
\code{\link{dvReleaseStudy}}
}
%\examples{}
