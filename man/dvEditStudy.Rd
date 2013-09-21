\name{dvEditStudy}
\alias{dvEditStudy}
\title{Edit a study}
\description{Use Data Deposit API to edit a study.}
\usage{
dvReleaseStudy(user, pwd, objectid, xmlfile, dv=getOption('dvn'), browser=FALSE, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{objectid}{A character string containing the id for a dataverse study (a handle). This could be returned from \code{\link{dvUserStudies}}, \code{\link{dvCreateStudy}}, (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{xmlfile}{The path to an XML file containing an Atom entry, which specifies the metadata necessary to create the study. See references for an example.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
\details{
This is currently not working (HTTP 500 Error)...
}
\value{A character string containing an XML data structure (a Study Atom).}
\references{
\href{http://swordapp.github.io/SWORDv2-Profile/SWORDProfile.html#protocoloperations_creatingresource_entry}{Atom entry specification}
\href{https://github.com/IQSS/dvn/blob/develop/tools/scripts/data-deposit-api/atom-entry-study.xml}{Atom entry template 1}
\href{https://github.com/IQSS/dvn/blob/develop/tools/scripts/data-deposit-api/atom-entry-study2.xml}{Atom entry template 2}
}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
%\examples{}
