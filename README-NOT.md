# dvn
## R Access to the Dataverse Network #
[![Project Status: Unsupported – The project has reached a stable, usable state but the author(s) have ceased all work on it. A new maintainer may be desired.](http://www.repostatus.org/badges/latest/unsupported.svg)](http://www.repostatus.org/#unsupported)
![CRAN/GitHub 0.3.5_/_0.3.5](https://img.shields.io/badge/CRAN/GitHub-0.3.5_/_0.3.5-blue.svg)

*Many dataverse servers now use Dataverse version 4.0 or greater. A separate package, [dataverse](https://github.com/IQSS/dataverse-client-r), is being developed to work with these newer installations.*

The **dvn** package for R integrates public data sharing into the reproducible research workflow. As such, **dvn** provides access to both the Data Sharing API and the Data Deposit API for the [Dataverse Network](http://thedata.org/) online data repository system. The Data Sharing API enables searches of any public dataverse, returning study and file metadata. Limited support is also provided for data download, when terms of use allow direct download of public data.

The Data Deposit API allows users to directly create and modify dataverse listings (studies, metadata, and files), thereby integrating data archiving directly into the R workflow with just a few simple functions. The Data Deposit API is built on the [SWORD protocol](http://en.wikipedia.org/wiki/SWORD_%28protocol%29), though not all features are fully supported by the API.

**dvn** defaults to providing access to the [Harvard Dataverse Network](https://thedata.harvard.edu/dvn/), but this can be changed in each function call or globally using `options(dvn = 'https://thedata.harvard.edu/dvn/')` for any valid [Dataverse Network](http://thedata.org/book/dataverse-networks-around-world).

Users interested in downloading metadata from archives other than Dataverse may be interested in Kurt Hornik's [OAIHarvester](https://cran.r-project.org/package=OAIHarvester), which offers metadata download from any web repository that is compliant with the [Open Archives Initiative](http://www.openarchives.org/) standards. Additionally, [rdryad](https://cran.r-project.org/package=rdryad) uses OAIHarvester to interface with [Dryad](http://datadryad.org/). The [rfigshare](https://cran.r-project.org/package=rfigshare) package works in a similar spirit to **dvn** with [http://figshare.com/](http://figshare.com/).



## Citation

Get citation information for `dvn` in R by running: `citation(package = 'dvn')`

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md).
By participating in this project you agree to abide by its terms.


[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
