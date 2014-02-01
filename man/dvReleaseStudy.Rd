\name{dvReleaseStudy}
\alias{dvReleaseStudy}
\title{Publicly release a study}
\description{Use Data Deposit API to release a created study.}
\usage{
dvReleaseStudy( objectid, dv=getOption('dvn'),
                user=getOption('dvn.user'), pwd=getOption('dvn.pwd'),
                browser=FALSE, ...)
}
\arguments{
  \item{objectid}{Either a character string containing the id for a dataverse study (a handle) or an object of class \dQuote{dvStudyAtom}. This could be returned from \code{\link{dvUserStudies}} (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{user}{A character string containing a dataverse username. Default is \code{options('dvn.user')}.}
  \item{pwd}{A character string containing the corresponding dataverse password. Default is \code{options('dvn.pwd')}.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{curlPerform} via \code{\link{dvQuery}}.}
}
%\details{}
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
\code{\link{dvCreateStudy}}
\code{\link{dvEditStudy}}
\code{\link{dvDeleteStudy}}
}
%\examples{}
