#' PCR oligo sequences
#'
#' @note Updated 2023-09-25.
#' @export
#'
#' @inheritParams params
#' @inheritParams AcidRoxygen::params
#'
#' @return `CharacterList`.
#'
#' @examples
#' x <- oligos()
#' print(x)
oligos <- function(release = NULL) {
    file <- .annotationFile(stem = "pcr_product2gene.txt.gz", release = release)
    ## File is malformed, so parsing as lines.
    x <- import(file, format = "lines")
    x <- strMatch(x = x, pattern = "^([^\t]+)\t(WBGene\\d{8})", fixed = FALSE)
    x <- x[, 2L:3L]
    colnames(x) <- c("oligo", "geneId")
    agg <- aggregate(
        x = formula("oligo~geneId"),
        data = x,
        FUN = list
    )
    x <- CharacterList(agg[["oligo"]])
    names(x) <- agg[["geneId"]]
    keep <- grepl(pattern = .genePattern, x = names(x))
    x <- x[keep]
    x <- x[sort(names(x))]
    x <- sort(unique(x))
    x
}

formals(oligos)[["release"]] <- .releaseArg
