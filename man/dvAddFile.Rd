\name{dvAddFile}
\alias{dvAddFile}
\title{Add a study file}
\description{Use Data Deposit API to add a file to a study.}
\usage{
dvAddFile(  objectid, filename=NULL, dataframe=NULL, category=NULL,
            dv=getOption('dvn'),
            user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), 
            browser=FALSE, ...)
}
\arguments{
  \item{objectid}{Either a character string containing the id for a dataverse study (a handle) or an object of class \dQuote{dvStudyAtom}. This could be returned from \code{\link{dvUserStudies}} (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{filename}{The path to a .zip file to be uploaded, or a vector of filenames (or paths) that will be compressed then uploaded.}
  \item{dataframe}{A character string (or vector of character strings) containing the names of dataframe(s) to be saved and uploaded. Files are named by their R object names, so a dataframe called \code{df} will become \dQuote{df.RData}.}
  \item{category}{An optional character string containing a category to be used in uploading the files to Dataverse. For example, \dQuote{Data} or \dQuote{Codebook}. This can be used to organize files in the web browser interface. Must be valid as a path on the local OS, so it should not contain slashes or most other punctuation. If \code{NULL}, the default is \dQuote{Files}.}
  %\item{filesize}{A numeric indicating an (over)estimate of the file size. Underestimating file size creates problems when the .zip is read into memory.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{user}{A character string containing a dataverse username. Default is \code{options('dvn.user')}.}
  \item{pwd}{A character string containing the corresponding dataverse password. Default is \code{options('dvn.pwd')}.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{curlPerform} via \code{\link{dvDepositQuery}}.}
}
\details{This send a (.zip) file to a study, decompresses it, and adds the file contents to the study. To send multiple files, specify them as a character vector in \code{filename}. It is also possible to add one or more dataframes (in addition to or instead) of filenames.

The user should receive (immediately) an email from Dataverse confirming whether or not decompression of the .zip was successful. Successful file upload can also be checked with a call to \code{\link{dvStudyStatement}}.

Note: Filenames in the .zip must be unique and cannot duplicate the names of any files already attached to the study. Use \code{\link{dvDeleteFile}} to remove previous files and then replace by uploading a new .zip.
}
\value{If successful, a list containing:
  \item{bibliographicCitation}{A full citation for the study, compiled from metadata.}
  \item{generator}{A vector containing details about the SWORD application.}
  \item{id}{The full URI for the study.}
  \item{objectId}{The \code{objectId} for the study.}
  \item{xml}{A character string containing an XML data structure that includes a study citation and handle.}
}
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
