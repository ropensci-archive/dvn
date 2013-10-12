\name{dvTermsOfUse}
\alias{dvTermsOfUse}
\title{Terms of Use}
\description{Extract and view Dataverse Terms of Use.}
\usage{
dvTermsOfUse(xml)
}
\arguments{
  \item{xml}{A character string containing an XML data structure returned by \code{\link{dvMetadata}} or \code{\link{dvServiceDoc}}.}
}
\details{Extracts the Terms of Use from a \dQuote{dvServiceDoc} or \dQuote{dvMetadata} (in DDI format) object, saves that information as temporary HTML file (or files, if \code{dvServiceDoc} returns multiple dataverses) and opens the file(s) using \code{browseURL}. Temporary files are then immediately deleted.}
\value{The value of \code{xml}, invisibly.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvMetadata}}
\code{\link{dvServiceDoc}}
}
\examples{
\dontrun{
# Extract TOU from Data Sharing reseponse
# (This only applies when `dvMetadata` is in DDI format)
dvTermsOfUse(dvMetadata("hdl:1902.1/17864"))

# Extract TOU from Data Deposit reseponse:
dvTermsOfUse(dvServiceDoc())
}
}
