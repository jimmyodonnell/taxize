% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gni_details.R
\name{gni_details}
\alias{gni_details}
\title{Search for taxonomic name details using the Global Names Index.}
\usage{
gni_details(id, all_records = 1, ...)
}
\arguments{
\item{id}{Name id. Required.}

\item{all_records}{If all_records is 1, GNI returns all records from all
repositories for the name string (takes 0, or 1 [default]).}

\item{...}{Curl options passed on to \code{\link[httr]{GET}}}
}
\value{
Data.frame of results.
}
\description{
Uses the Global Names Index, see \url{http://gni.globalnames.org/}.
}
\examples{
\dontrun{
gni_details(id = 17802847)
library("plyr")
ldply(list(1265133, 17802847), gni_details)

# pass on curl options to httr
library("httr")
gni_details(id = 17802847, config = verbose())
}
}
\author{
Scott Chamberlain {myrmecocystus@gmail.com}
}
\seealso{
\code{\link{gnr_datasources}}, \code{\link{gni_search}}.
}
\keyword{globalnamesindex}
\keyword{names}
\keyword{taxonomy}

