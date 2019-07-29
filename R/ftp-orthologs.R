#' Orthologs
#'
#' @note Updated 2019-07-27.
#' @export
#'
#' @inheritParams params
#'
#' @return `tbl_df`.
#'
#' @examples
#' ## WormBase FTP server must be accessible.
#' tryCatch(
#'     expr = orthologs(),
#'     error = function(e) e
#' )
orthologs <- function(version = NULL, progress = FALSE) {
    pblapply <- .pblapply(progress = progress)
    file <- .annotationFile(pattern = "orthologs", version = version)

    message("Parsing lines in file...")
    lines <- file %>%
        unname() %>%
        read_lines(progress = FALSE) %>%
        ## Remove the comment lines.
        .[!grepl("^#", .)] %>%
        gsub("^=$", "\\|\\|", .) %>%
        paste(collapse = " ") %>%
        strsplit("\\|\\|") %>%
        unlist() %>%
        gsub("^ ", "", .) %>%
        ## Drop any lines that don't contain a gene identifier.
        .[grepl(paste0("^", genePattern), .)]

    message("Processing orthologs...")
    dflist <- pblapply(lines, function(x) {
        gene <- str_extract(x, genePattern)
        patterns <- c(
            homoSapiens = "ENSG\\d{11}",
            musMusculus = "ENSMUSG\\d{11}",
            drosophilaMelanogaster = "FBgn\\d{7}",
            danioRerio = "ENSDARG\\d{11}"
        )
        orthologs <- mapply(
            FUN = function(string, pattern) {
                x <- str_extract_all(
                    string = string,
                    pattern = paste0("\\b", pattern, "\\b")
                ) %>%
                    unlist() %>%
                    unique() %>%
                    sort()
                if (!length(x)) {
                    x <- NULL
                }
                x
            },
            pattern = patterns,
            MoreArgs = list(string = x),
            SIMPLIFY = FALSE,
            USE.NAMES = TRUE
        )
        tbl <- lapply(orthologs, list) %>%
            as_tibble()
        tbl[["geneID"]] <- gene
        tbl
    })

    dflist %>%
        bind_rows() %>%
        select(!!sym("geneID"), everything()) %>%
        filter(grepl(pattern = genePattern, x = !!sym("geneID"))) %>%
        arrange(!!sym("geneID"))
}

formals(orthologs)[["version"]] <- versionArg