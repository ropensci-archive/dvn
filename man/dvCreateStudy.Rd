\name{dvCreateStudy}
\alias{dvCreateStudy}
\title{Create a study in a named Dataverse}
\description{Use Data Deposit API to create a study in a Dataverse.}
\usage{
dvCreateStudy(  dvname, xmlfile, dv=getOption('dvn'),
                user=getOption('dvn.user'), pwd=getOption('dvn.pwd'), 
                browser=FALSE, ...)
}
\arguments{
  \item{dvname}{A character string containing the name of a dataverse collection. Must be a dataverse accessible to this user (perhaps as extracted from \code{\link{dvServiceDoc}}.}
  \item{xmlfile}{The path to an XML file (or a character string of that XML) containing a Qualified Dublin Core Atom/XML document, which specifies the metadata necessary to create the study. See references for an example and \code{\link{dvBuildMetadata}}.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{user}{A character string containing a dataverse username. Default is \code{options('dvn.user')}.}
  \item{pwd}{A character string containing the corresponding dataverse password. Default is \code{options('dvn.pwd')}.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{curlPerform} via \code{\link{dvDepositQuery}}.}
}
\details{
This function creates a study in a dataverse using a Qualified Dublin Core Atom/XML document (possibly built by \code{\link{dvBuildMetadata}}). This document must contain a title, with all other fields being optional.

For the \code{dvname} argument, it is also possible to simply pass the \dQuote{dvServiceDoc} object directly in lieu of naming a dataverse: \code{dCreateStudy(dvServiceDoc(),"atom.xml")}. In this case, if the user has access to more than one dataverse collection, an error will be produced.

Creating a study only changes the study in \dQuote{draft}. To make a study public (and thus visible online or via \code{\link{dvSearch}}), the study needs to be subsequently released with \code{\link{dvReleaseStudy}}. It can also be deleted with \code{\link{dvDeleteStudy}}. Note: A released study can be \dQuote{deaccessioned} (replacing its public record with a publicly visible record about its previous release) using \code{dvDeleteStudy} but cannot be deleted.
}
\value{If successful, a list containing:
  \item{bibliographicCitation}{A full citation for the study, compiled from metadata.}
  \item{generator}{A vector containing details about the SWORD application.}
  \item{id}{The full URI for the study.}
  \item{objectId}{The \code{objectId} for the study.}
  \item{xml}{A character string containing an XML data structure that includes a study citation and handle.}
}
\references{
\href{http://swordapp.github.io/SWORDv2-Profile/SWORDProfile.html\#protocoloperations_creatingresource_entry}{Atom entry specification}
\href{https://github.com/IQSS/dvn/blob/develop/tools/scripts/data-deposit-api/atom-entry-study.xml}{Qualified Dublin Core XML example 1}
\href{https://github.com/IQSS/dvn/blob/develop/tools/scripts/data-deposit-api/atom-entry-study2.xml}{Qualified Dublin Core XML example 2}
}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvBuildMetadata}}
\code{\link{dvAddFile}}
\code{\link{dvEditStudy}}
\code{\link{dvReleaseStudy}}
\code{\link{dvDeleteStudy}}
}
%\examples{}
