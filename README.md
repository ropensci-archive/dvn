## Access to the Dataverse Network APIs from R

The goal of the **dvn** package is to integrate public data sharing into the workflow of reproducible research. As such, **dvn** provides access to both the [Data Sharing API](http://guides.thedata.org/node/13328) and the [Data Deposit API](http://devguide.thedata.org/features/api/data-deposit/) for the [Dataverse Network](http://thedata.org/) online data repository system. The package enables searches of any public dataverse, returning study and file metadata. Limited support is also provided for data download, when terms of use allow direct download of public data.

Support for the Data Deposit API is still in ongoing development. This API allows users to directly create and modify dataverse listings (studies, metadata, and files). The Data Deposit API is built on the [SWORD protocol](http://en.wikipedia.org/wiki/SWORD_%28protocol%29), though not all features are fully supported by the API and only a further subset are currently working in **dvn**. Soon, users will be able to integrate data archiving directly into the R workflow with just a few simple functions.

**dvn** defaults to providing access to the [Harvard Dataverse Network](http://dvn.iq.harvard.edu/), but accommodates any publicly available dataverse. This can be changed in each function call or in globally using `options(dvn = 'https://thedata.harvard.edu/')` for any valid Dataverse Network.

### Functions for the Data Sharing API
* `dvSearchFields`, to provide help with searching via the Data Sharing API
* `dvSearch`, to search public dataverses
* `dvMetadataFormats`, to retrieve available metadata formats for a study
* `dvExtractFileIds`, to identify available files in publicly released study
* `dvDownloadInfo`, to retrieve information about a study file
* `dvDownload`, to download a study file (if allowed)

### Functions for the Data Deposit API
* `dvServiceDoc`, to identify dataverses accessible to a user
* `dvUserStudies`, to list a user's studies
* `dvStudyAtom`, to access study-level URIs for using the Data Deposit API (not important for most users)
* `dvStudyStatement`, to access a summary of a study (including citation and stable URI)
* `dvCreateStudy`, to create a study listing
* `dvEditStudy`, to edit a study's metadata (i.e., cataloging information)
* `dvAddFile`, to add a file to study
* `dvDeleteFile`, to delete a file from a study
* `dvReleaseStudy`, to publicly release a study
* `dvDeleteStudy`, to deaccession a released study or delete an unreleased study
