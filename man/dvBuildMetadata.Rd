\name{dvBuildMetadata}
\alias{dvBuildMetadata}
\title{Build the Atom object to create or edit a study.}
\description{Build the Qualified Dublin Core Atom XML object needed for \code{\link{dvCreateStudy}} or \code{\link{dvEditStudy}}.}
\usage{
dvBuildMetadata(..., format='dcterms')
}
\arguments{
  \item{...}{One or more named metadata fields. \dQuote{title} is required. Any other fields are optional, but must be in Qualified Dublin Core.}
  \item{format}{A character specifying the format of the metadata XML. Default is \dQuote{dcterms}.}
}
%\details{}
\value{A character string containing a complete Atom entry for use in \code{\link{dvCreateStudy}} or \code{\link{dvEditStudy}}.}
\references{
\href{http://dublincore.org/documents/dcmi-terms/}{Dublin Core Metadata Terms}

\href{http://en.wikipedia.org/wiki/Dublin_Core\#Qualified_Dublin_Core}{Qualified Dublin Core (Wikipedia)}
}
\author{Thomas J. Leeper}
%\note{}
\seealso{
\code{\link{dvCreateStudy}}
\code{\link{dvEditStudy}}
}
\examples{
\dontrun{
dvBuildMetadata(title="My Study",
                creator="Doe, John",
                creator="Doe, Jane",
                publisher="My University",
                date="2013-09-22",
                description="An example study",
                subject="Study",
                subject="Dataverse",
                subject="Other",
                coverage="United States")
}
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }
