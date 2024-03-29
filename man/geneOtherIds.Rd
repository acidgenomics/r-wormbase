% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ftp-geneOtherIds.R
\name{geneOtherIds}
\alias{geneOtherIds}
\title{Other gene identifiers}
\usage{
geneOtherIds(release = getOption(x = "wormbase.release", default = NULL))
}
\arguments{
\item{release}{\code{character(1)} or \code{NULL}.
WormBase release. If \code{NULL} (recommended), defaults to current production
release release available on the WormBase website. Legacy releases can be
specified as a character string (e.g. "WS267").}
}
\value{
\code{CharacterList}.
}
\description{
Other gene identifiers
}
\note{
As of WS269 release, some non-N2 gene IDs are included in the flat
files available on the WormBase FTP server. These annotations are removed
from the return here, using grep matching to return only \code{WBGene} entries.

Updated 2021-02-18.
}
\examples{
x <- geneOtherIds()
print(x)
}
