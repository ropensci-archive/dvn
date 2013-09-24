\name{dvEditStudy}
\alias{dvEditStudy}
\title{Edit a study}
\description{Use Data Deposit API to replace a study's metadata.}
\usage{
dvEditStudy(objectid, xmlfile, dv=getOption('dvn'),
            user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), 
            browser=FALSE, ...)
}
\arguments{
  \item{objectid}{A character string containing the id for a dataverse study (a handle). This could be returned from \code{\link{dvUserStudies}}, \code{\link{dvCreateStudy}}, (or, \code{\link{dvSearch}}, from the Data Sharing API).}
  \item{xmlfile}{The path to an XML file containing a Qualified Dublin Core Atom/XML document, which specifies the metadata necessary to create the study. See references for an example.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{user}{A character string containing a dataverse username. Default is \code{options('dvn.user')}.}
  \item{pwd}{A character string containing the corresponding dataverse password. Default is \code{options('dvn.pwd')}.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{curlPerform} via \code{\link{dvDepositQuery}}.}
}
\details{
This function replaces a study's metadata. That is, it is not possible to edit some fields of a study's metadata. The SWORD implementation only allows an entire metadata record to be replaced. Thus, if one only wants to edit one field, a complete Qualified Dublin Core XML document. Probably, it is best to store this locally to simply making any future changes.

Note: Editing a study only changes the study in \dQuote{draft}. To make those changes public, the study needs to be subsequently released. A released study can be \dQuote{deaccessioned} (replacing its public record with a publicly visible record about its previous release) using \code{dvDeleteStudy} but cannot be deleted.
}
\value{A character string containing an XML data structure (a Study Atom). If successful, the request will reflect the contents of \code{xmlfile}. See \code{\link{dvStudyAtom}}.}
\references{
\href{http://swordapp.github.io/SWORDv2-Profile/SWORDProfile.html\#protocoloperations_creatingresource_entry}{Atom entry specification}
\href{https://github.com/IQSS/dvn/blob/develop/tools/scripts/data-deposit-api/atom-entry-study.xml}{Qualified Dublin Core XML example 1}
\href{https://github.com/IQSS/dvn/blob/develop/tools/scripts/data-deposit-api/atom-entry-study2.xml}{Qualified Dublin Core XML example 2}
}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvAddFile}}
\code{\link{dvCreateStudy}}
\code{\link{dvReleaseStudy}}
\code{\link{dvDeleteStudy}}
}
%\examples{}
