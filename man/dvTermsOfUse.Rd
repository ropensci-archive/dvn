\name{dvTermsOfUse}
\alias{dvTermsOfUse}
\title{Terms of Use}
\description{Extract and view Dataverse Terms of Use from a response.}
\usage{
dvTermsOfUse(xml)
}
\arguments{
  \item{xml}{A character string containing an XML data structure returned by \code{\link{dvServiceDoc}}.}
}
\details{Extracts the Terms of Use from a \dQuote{dvServiceDoc} object, saves that information as temporary HTML file (or files, if multiple dataverses are associated with the user login) and opens the file(s) using \code{browseURL}. Temporary files are immediately deleted.}
\value{The value of \code{xml}, invisibly.}
%\references{}
\author{Thomas J. Leeper}
%\note{}

\seealso{
\code{\link{dvServiceDoc}}
}
\examples{
\dontrun{
dvTermsOfUse(dvServiceDoc())
}
}
