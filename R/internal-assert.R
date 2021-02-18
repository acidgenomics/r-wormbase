#' Is all of the input WormBase gene identiifers?
#'
#' @note Updated 2019-07-24.
#' @noRd
.allAreGenes <- function(x) {
    ok <- isCharacter(x)
    if (!isTRUE(ok)) return(FALSE)
    ok <- allAreMatchingRegex(
        x = x,
        pattern = paste0("^", .genePattern, "$")
    )
    if (!isTRUE(ok)) return(FALSE)
    ok <- hasNoDuplicates(x)
    if (!isTRUE(ok)) return(FALSE)
    TRUE
}



#' Error message for invalid FTP file
#'
#' @note Updated 2019-08-12.
#' @noRd
.invalidFTPFile <- function(file) {
    stop(sprintf(
        fmt = paste0(
            "Invalid FTP file detected.\n",
            "Please submit an issue on the WormBase GitHub",
            " (https://github.com/wormbase) ",
            "that the FTP file '%s' is malformed."
        ),
        basename(file)
    ))
}



#' Is the input a WormBase release version?
#'
#' @note Updated 2021-02-17.
#' @noRd
.isVersion <- function(x) {
    if (is.null(x)) return(TRUE)
    ok <- isString(x)
    if (!isTRUE(ok)) return(FALSE)
    ok <- allAreMatchingRegex(x, pattern = "^WS\\d{3}$")
    if (!isTRUE(ok)) return(FALSE)
    TRUE
}