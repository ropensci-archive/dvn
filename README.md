# dvn
## R Access to the Dataverse Network #
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
![CRAN/GitHub 0.3.5_/_0.3.5](https://img.shields.io/badge/CRAN/GitHub-0.3.5_/_0.3.5-blue.svg)

*Many dataverse servers now use Dataverse version 4.0 or greater. A separate package, [dataverse](https://github.com/IQSS/dataverse-client-r), is being developed to work with these newer installations.*

The **dvn** package for R integrates public data sharing into the reproducible research workflow. As such, **dvn** provides access to both the Data Sharing API and the Data Deposit API for the [Dataverse Network](http://thedata.org/) online data repository system. The Data Sharing API enables searches of any public dataverse, returning study and file metadata. Limited support is also provided for data download, when terms of use allow direct download of public data.

The Data Deposit API allows users to directly create and modify dataverse listings (studies, metadata, and files), thereby integrating data archiving directly into the R workflow with just a few simple functions. The Data Deposit API is built on the [SWORD protocol](http://en.wikipedia.org/wiki/SWORD_%28protocol%29), though not all features are fully supported by the API.

**dvn** defaults to providing access to the [Harvard Dataverse Network](https://thedata.harvard.edu/dvn/), but this can be changed in each function call or globally using `options(dvn = 'https://thedata.harvard.edu/dvn/')` for any valid [Dataverse Network](http://thedata.org/book/dataverse-networks-around-world).

Users interested in downloading metadata from archives other than Dataverse may be interested in Kurt Hornik's [OAIHarvester](https://cran.r-project.org/package=OAIHarvester), which offers metadata download from any web repository that is compliant with the [Open Archives Initiative](http://www.openarchives.org/) standards. Additionally, [rdryad](https://cran.r-project.org/package=rdryad) uses OAIHarvester to interface with [Dryad](http://datadryad.org/). The [rfigshare](https://cran.r-project.org/package=rfigshare) package works in a similar spirit to **dvn** with [http://figshare.com/](http://figshare.com/).


## Package status and installation

[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ropensci/dvn?branch=master&svg=true)](https://ci.appveyor.com/project/ropensci/dvn)
[![Travis-CI Build Status](https://travis-ci.org/ropensci/dvn.svg?branch=master)](https://travis-ci.org/)
 [![codecov](https://codecov.io/gh/ropensci/dvn/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/dvn)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/dvn?color=blue)](https://github.com/metacran/cranlogs.app)

__Installation instructions__

__Stable Version__

```r
install.packages("dvn")
```

__Development Version__

```r
# install.packages("devtools")
devtools::install_github("ropensci/dvn")
```

## Usage
### Functions for the Data Sharing API ###
#### Metadata Search Functions ####
* `dvSearch`, to search public dataverses
  * `dvSearchFields`, to provide the searchable fields for use in `dvSearch`
* `dvMetadata`, to retrieve the metadata for a study
  * `dvMetadataFormats`, to retrieve available metadata *formats* for a study
  * `dvExtractFileIds`, to extract available files from the `dvMetadata` response
  * Using `dvTermsOfUse(dvMetadata(objectId))` displays Terms Of Use as HTML for the study

#### File Access Functions ####
* `dvDownloadInfo`, to retrieve information about a study file
* `dvDownload`, to download a study file (if allowed)

#### Functions for the Data Deposit API ####

The core workflow for the Data Deposit API involves creating a study listing using `dvCreateStudy`, adding one or more files with `dvAddFile`, and then making the study public with `dvReleaseStudy`. Use of all Data Deposit API functions requires a valid username and password for the selected Dataverse Network, which can be set in each function call or globally using `options(dvn.user = 'username', dvn.pwd = 'password')`.

* `dvCreateStudy`, to create a study listing using metadata (i.e., cataloging information)
  * Use `dvBuildMetadata` to create metadata for use in `dvCreateStudy` or `dvEditStudy`
  * Use `dvEditStudy` to overwrite a study's metadata
* `dvAddFile`, to add file(s) or active R dataframes to a study
* `dvReleaseStudy`, to publicly release a study

Here is simple code to enact that workflow:

```
options(dvn.user = 'username', dvn.pwd = 'password')
doc <- dvServiceDoc()
meta <- dvBuildMetadata(title="My Study", creator="Doe, John")
study <- dvCreateStudy(doc, meta)
dvAddFile(study, filename)
dvReleaseStudy(study)
```

The following functions allow users to view and modify existing studies:
* `dvDeleteFile`, to delete a file from a study
* `dvDeleteStudy`, to deaccession a released study, or delete an unreleased study
* `dvUserStudies`, to list studies in a named dataverse
* `dvStudyStatement`, to access a summary of a study (including citation and stable URI)
* `dvServiceDoc`, to identify the dataverse(s) accessible to a user (This is not particularly relevant to users with access to only one dataverse)
* `dvStudyAtom`, to view study-level URIs for using the Data Deposit API (This is not important for most users, unless they plan to call `dvDepositQuery` directly)


## Citation

Get citation information for `dvn` in R by running: `citation(package = 'dvn')`

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md).
By participating in this project you agree to abide by its terms.


[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
