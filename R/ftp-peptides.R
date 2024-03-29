#' Peptides
#'
#' @note Updated 2023-09-25.
#' @export
#'
#' @inheritParams params
#' @inheritParams AcidRoxygen::params
#'
#' @return `SplitDataFrameList`.
#' Split by `geneId` column.
#'
#' @examples
#' x <- peptides()
#' print(x)
peptides <- function(release = NULL) {
    file <- .assemblyFile(stem = "wormpep_package.tar.gz", release = release)
    tempdir <- tempdir2()
    releaseNumber <- strMatch(file, pattern = "WS([[:digit:]]{3})")[1L, 2L]
    ## Extract the individual table.
    wormpepTable <- paste0("wormpep.table", releaseNumber)
    status <- untar(tarfile = file, files = wormpepTable, exdir = tempdir)
    assert(identical(status, 0L))
    x <- import(con = file.path(tempdir, wormpepTable), format = "lines")
    unlink2(tempdir)
    x <- mclapply(
        X = x,
        FUN = function(x) {
            seqPattern <- "^>([A-Za-z0-9\\.]+)\\s"
            sequence <- strMatch(
                x = x,
                pattern = seqPattern,
                fixed = FALSE
            )[1L, 2L]
            x <- sub(pattern = seqPattern, replacement = "", x = x)
            x <- strMatchAll(
                x = x,
                pattern = "\\b([a-z]+)=(\"[^\"]+\"|[^ ]+\\b)",
                fixed = FALSE
            )[[1L]]
            x[, 3L] <- gsub(pattern = "\"", replacement = "", x = x[, 3L])
            out <- x[, 3L]
            names(out) <- x[, 2L]
            out[["sequence"]] <- sequence
            out
        }
    )
    x <- rbindToDataFrame(x)
    colnames(x)[colnames(x) == "gene"] <- "geneId"
    x <- x[, unique(c("geneId", colnames(x)))]
    keep <- grepl(pattern = .genePattern, x = x[["geneId"]])
    x <- x[keep, , drop = FALSE]
    x <- x[
        order(x[["geneId"]], x[["sequence"]], x[["wormpep"]]), ,
        drop = FALSE
    ]
    x <- split(x, f = x[["geneId"]])
    assert(is(x, "SplitDataFrameList"))
    x
}

formals(peptides)[["release"]] <- .releaseArg
