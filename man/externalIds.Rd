% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rest-externalIds.R
\name{externalIds}
\alias{externalIds}
\title{External identifiers}
\usage{
externalIds(genes)
}
\arguments{
\item{genes}{\code{character}.
Gene identifiers (e.g. WBGene00004804).}
}
\value{
\code{List}.
}
\description{
External identifiers
}
\note{
Updated 2023-09-25.
}
\examples{
genes <- c("WBGene00000912", "WBGene00004804")
x <- externalIds(genes)
print(x)
print(x[[1L]])
}
