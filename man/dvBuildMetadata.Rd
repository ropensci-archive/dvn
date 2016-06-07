\name{dvBuildMetadata}
\alias{dvBuildMetadata}
\title{Build the Atom object to create or edit a study.}
\description{Build the Qualified Dublin Core Atom XML object needed for \code{\link{dvCreateStudy}} or \code{\link{dvEditStudy}}.}
\usage{
dvBuildMetadata(..., format='dcterms', validate = FALSE)
}
\arguments{
  \item{...}{One or more named metadata fields. \dQuote{title} is required. Any other fields are optional, but must be in Qualified Dublin Core.}
  \item{format}{A character specifying the format of the metadata XML. Default is \dQuote{dcterms}. Currently ignored.}
  \item{validate}{A logical indicating whether to validate the resulting metadata. Default is \dQuote{FALSE}.}
}
%\details{}
\value{A character string of class \dQuote{dvMetadata} containing a complete Atom entry for use in \code{\link{dvCreateStudy}} or \code{\link{dvEditStudy}}.

Allowed fields are:
\dQuote{abstract}, \dQuote{accessRights}, \dQuote{accrualMethod},
\dQuote{accrualPeriodicity}, \dQuote{accrualPolicy}, \dQuote{alternative},
\dQuote{audience}, \dQuote{available}, \dQuote{bibliographicCitation},
\dQuote{conformsTo}, \dQuote{contributor}, \dQuote{coverage}, \dQuote{created},
\dQuote{creator}, \dQuote{date}, \dQuote{dateAccepted}, \dQuote{dateCopyrighted},
\dQuote{dateSubmitted}, \dQuote{description}, \dQuote{educationLevel}, \dQuote{extent},
\dQuote{format}, \dQuote{hasFormat}, \dQuote{hasPart}, \dQuote{hasVersion},
\dQuote{identifier}, \dQuote{instructionalMethod}, \dQuote{isFormatOf},
\dQuote{isPartOf}, \dQuote{isReferencedBy}, \dQuote{isReplacedBy}, \dQuote{isRequiredBy},
\dQuote{issued}, \dQuote{isVersionOf}, \dQuote{language}, \dQuote{license},
\dQuote{mediator}, \dQuote{medium}, \dQuote{modified}, \dQuote{provenance},
\dQuote{publisher}, \dQuote{references}, \dQuote{relation}, \dQuote{replaces},
\dQuote{requires}, \dQuote{rights}, \dQuote{rightsHolder}, \dQuote{source},
\dQuote{spatial}, \dQuote{subject}, \dQuote{tableOfContents}, \dQuote{temporal},
\dQuote{title}, \dQuote{type}, and \dQuote{valid}.
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
