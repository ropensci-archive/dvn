## Access to the Dataverse Network API from R

The goal of the **dvn** package is to integrate public data sharing into the workflow of reproducible research. As such, **dvn** provides access to the [Data Sharing API](http://guides.thedata.org/node/13328) for the [Dataverse Network](http://thedata.org/) online data repository. The package enables searches of any public dataverse, returning study and file metadata. Limited support is also provided for data download.

**dvn** defaults to providing access to the [Harvard Dataverse Network](http://dvn.iq.harvard.edu/), but accommodates any publicly available dataverse.

Future support is planned for the upcoming [Data Deposit API](http://devguide.thedata.org/features/api/data-deposit/), which will allow uploading of data to a dataverse directly from R.
