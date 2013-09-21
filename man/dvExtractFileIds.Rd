\name{dvExtractFileIds}
\alias{dvExtractFileIds}
\title{Extract fileId(s) from metadata}
\description{Extract fileId(s) from metadata for a dataverse record.}
\usage{
dvExtractFileIds(xml)
}
\arguments{
  \item{xml}{A character string containing an XML data structure returned by \code{\link{dvMetadata}}.}
}
\details{Extracts all of the fileIds associated with a retrieved dataverse record.}
\value{A dataframe containing fileIds and associated descriptive information for files stored in the dataverse record.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvMetadata}}
}
\examples{
\dontrun{
xml <- dvMetadata("hdl:1902.1/17218")
dvExtractFileIds(xml)
}
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
