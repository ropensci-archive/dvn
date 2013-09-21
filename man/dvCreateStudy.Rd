\name{dvCreateStudy}
\alias{dvCreateStudy}
\title{Create a study in a named Dataverse}
\description{Use Data Deposit API to create a study in a Dataverse.}
\usage{
dvReleaseStudy(user, pwd, dvname, xmlfile, dv=getOption('dvn'), browser=FALSE, ...)
}
\arguments{
  \item{user}{A character string containing a dataverse username.}
  \item{pwd}{A character string containing the corresponding dataverse password.}
  \item{dvname}{A character string containing the name of a dataverse collection. Must be a dataverse accessible to this user (perhaps as returned by \code{\link{dvServiceDoc}}.}
  \item{xmlfile}{The path to an XML file containing an Atom entry, which specifies the metadata necessary to create the study. See references for an example.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
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
