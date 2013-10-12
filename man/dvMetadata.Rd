\name{dvMetadata}
\alias{dvMetadata}
\title{Retrieve metadata}
\description{Retrieve metadata for a dataverse record, using its object ID.}
\usage{
dvMetadata(objectid, format.type = NULL, include = NULL, exclude = NULL,
			dv = getOption('dvn'), browser = FALSE, ...)
}
\arguments{
  \item{objectid}{A dataverse object ID.}
  \item{format.type}{An optional character string specifying the format of the returned metadata. Available options can be retrieved with \code{\link{dvMetadataFormats}}. If \code{NULL}, \dQuote{ddi} is used by default.}
  \item{include}{An optional character string specifying what metadata to include in the response.}
  \item{exclude}{An optional character string specifying what metadata to exclude from the response.}
  \item{dv}{An optional character string specifying the Dataverse to query. Default is the Harvard IQSS Dataverse.}
  \item{browser}{A logical specifying whether the query should be executed in a web browser. Default is \code{FALSE}.}
  \item{...}{Optionally, additional arguments passed to \code{getURL} via \code{\link{dvQuery}}.}
}
%\details{}
\value{An character string of class \dQuote{dvMetadata} containing an XML data structure of metadata for the specified dataverse record. The exact form and contents of this response depend on the \code{format.type} and any \code{include}/\code{exclude} statements.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvMetadataFormats}}
\code{\link{dvExtractFileIds}}
\code{\link{dvTermsOfUse}}
}
\examples{
\dontrun{
# To retrieve all metadata:
xml <- dvMetadata("hdl:1902.1/17218")
# To retrieve metdata in Dublin Core format (instead of the default ("ddi"):
xml <- dvMetadata("hdl:1902.1/17218", format.type="oai_dc")

# To extract just the study description, without file information:
xml <- dvMetadata("hdl:1902.1/17218", include="codeBook/stdyDscr")
# To extract just basic file description(s), without other study details:
xml <- dvMetadata("hdl:1902.1/17218", include="codeBook/fileDscr")
# To extract just data summaries for all variables, without other study details:
xml <- dvMetadata("hdl:1902.1/17218", include="codeBook/dataDscr")
}
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
