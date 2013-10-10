\name{dvUserStudies}
\alias{dvUserStudies}
\alias{print.dvUserStudies}
\title{Studies in a Dataverse}
\description{Use Data Deposit API to obtain list of studies in a named Dataverse.}
\usage{
dvUserStudies(  dvname, dv=getOption('dvn'), user=getOption('dvn.user'),
                pwd=getOption('dvn.pwd'), browser=FALSE, ...)
}
\arguments{
  \item{dvname}{A character string containing the name of a dataverse collection. Must be a dataverse accessible to this user (perhaps as returned by \code{\link{dvServiceDoc}}.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{user}{A character string containing a dataverse username. Default is \code{options('dvn.user')}.}
  \item{pwd}{A character string containing the corresponding dataverse password. Default is \code{options('dvn.pwd')}.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvDepositQuery}}.}
}
\details{For the \code{dvname} argument, it is also possible to simply pass the \dQuote{dvServiceDoc} object directly in lieu of naming a dataverse: \code{dvUserStudies(dvServiceDoc())}. If the user has access to more than one dataverse collection, the first will be used (and produce a warning).}
\value{A list containing:
  \item{dvtitle}{The title of the dataverse, as a character string.}
  \item{released}{A character string reporting whether the dataverse is publicly released.}
  \item{generator}{A vector containing details about the SWORD application.}
  \item{studies}{A two-column dataframe containing \code{title} and \code{objectId} for each study in the dataverse.}
  \item{xml}{A character string containing an XML data structure, which describes the studies available in a named dataverse.}
}
%\references{}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvStudyStatement}}
\code{\link{dvStudyAtom}}
}
%\examples{}
