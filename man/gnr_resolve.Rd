% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gnr_resolve.R
\name{gnr_resolve}
\alias{gnr_resolve}
\title{Resolve names using Global Names Resolver.}
\usage{
gnr_resolve(names, data_source_ids = NULL, resolve_once = FALSE,
  with_context = FALSE, canonical = FALSE, highestscore = TRUE,
  best_match_only = FALSE, preferred_data_sources = NULL,
  with_canonical_ranks = FALSE, http = "get", cap_first = TRUE,
  fields = "minimal", ...)
}
\arguments{
\item{names}{character; taxonomic names to be resolved. Doesn't work for
vernacular/common names.}

\item{data_source_ids}{character; IDs to specify what data source
is searched. See \code{\link[taxize]{gnr_datasources}}.}

\item{resolve_once}{logical; Find the first available match instead of
matches across all data sources with all possible renderings of a name.
When \code{TRUE}, response is rapid but incomplete.}

\item{with_context}{logical; Reduce the likelihood of matches to taxonomic
homonyms. When \code{TRUE} a common taxonomic context is calculated for
all supplied names from matches in data sources that have classification
tree paths. Names out of determined context are penalized during score
calculation.}

\item{canonical}{logical; If \code{FALSE} (default), gives back names with
taxonomic authorities. If \code{TRUE}, returns canocial names
(without tax. authorities and abbreviations).}

\item{highestscore}{logical; Return those names with the highest score for
each searched name? Defunct}

\item{best_match_only}{(logical) If \code{TRUE}, best match only returned. Default:
\code{FALSE}}

\item{preferred_data_sources}{(character) A vector of one or more data source IDs.}

\item{with_canonical_ranks}{(logical) Returns names with infraspecific ranks, if present.
If \code{TRUE}, we force \code{canonical=TRUE}, otherwise this parameter would
have no effect. Default: \code{FALSE}}

\item{http}{The HTTP method to use, one of "get" or "post". Default: "get".
Use \code{http="post"} with large queries. Queries with > 300 records use "post"
automatically because "get" would fail}

\item{cap_first}{(logical) For each name, fix so that the first name part is
capitalized, while others are not. This web service is sensitive to capitalization, so
you'll get different results depending on capitalization. First name capitalized is
likely what you'll want and is the default. If \code{FALSE}, names are not modified.
Default: \code{TRUE}}

\item{fields}{(character) One of mimimal (default) or all. Minimal gives back just four
fields, whereas all gives all fields back.}

\item{...}{Curl options passed on to \code{\link[httr]{GET}}}
}
\value{
A data.frame with one attribute \code{not_known}: a character vector of
taxa unknown to the Global Names Index. Acccess like \code{attr(output, "not_known")},
or \code{attributes(output)$not_known}
}
\description{
Uses the Global Names Index, see \url{http://gni.globalnames.org/}.
}
\examples{
\dontrun{
gnr_resolve(names = c("Helianthus annuus", "Homo sapiens"))
gnr_resolve(names = c("Asteraceae", "Plantae"))

# Using data source 12 (Encyclopedia of Life)
sources <- gnr_datasources()
sources
eol <- sources$id[sources$title == 'EOL']
gnr_resolve(names=c("Helianthos annuus","Homo sapians"), data_source_ids=eol)

# Two species in the NE Brazil catalogue
sps <- c('Justicia brasiliana','Schinopsis brasiliensis')
gnr_resolve(names = sps, data_source_ids = 145)

# Best match only, compare the two
gnr_resolve(names = "Helianthus annuus", best_match_only = FALSE)
gnr_resolve(names = "Helianthus annuus", best_match_only = TRUE)

# Preferred data source
gnr_resolve(names = "Helianthus annuus", preferred_data_sources = c(3,4))

# Return canonical names - default is canonical=FALSE
head(gnr_resolve(names = "Helianthus annuus"))
head(gnr_resolve(names = "Helianthus annuus", canonical=TRUE))

# Return canonical names with authority stripped but
# ranks still present
gnr_resolve("Scorzonera hispanica L. subsp. asphodeloides Wallr.")
## vs.
gnr_resolve("Scorzonera hispanica L. subsp. asphodeloides Wallr.",
   with_canonical_ranks = TRUE)
}
}
\author{
Scott Chamberlain {myrmecocystus@gmail.com}
}
\seealso{
\code{\link[taxize]{gnr_datasources}}
}
\keyword{names}
\keyword{resolve}
\keyword{taxonomy}

