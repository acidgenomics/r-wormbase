## WormBase 0.5.0 (2023-09-28)

Major changes:

- Now enforcing strict camel case for function names. Renamed `geneIDs` to
  `geneIds` and `geneOtherIDs` to `geneOtherIds`.
- `description`: Reworked internal sanitization of the input data file.
- Removed stringi dependency in favor of using our string splitting functions
  in AcidBase instead.

Minor changes:

- Reworked internal string splitting to use base R approach via AcidBase instead
  of relying on compiled C code in stringi package.
- Reworked internal code to not use `pasteURL` for incomplete URLs.
- Updated unit tests for invalid REST API URLs.
- Classing internally on `DFrame` instead of `DataFrame` virtual class.

## WormBase 0.4.2 (2023-08-11)

Minor changes:

- Needed to add a `URLencode` step to URL parsing of our `{{release}}`
  placeholder. Our change to `pasteURL` in AcidBase broke this approach.
- Enabled testthat unit tests to run in parallel.

## WormBase 0.4.1 (2023-07-06)

Major changes:

- Migrated internal REST API code from httr to httr2.

Minor changes:

- Updated Acid Genomics dependencies.
- Preparing release for bioconda.

## WormBase 0.4.0 (2022-06-08)

Major changes:

- Now requiring R 4.2 / Bioconductor 3.15.
- Split out basejump imports into component packages.
- Reworked internal code to use stringi instead of stringr.
- `rnaiPhenotypes`: Addressed FTP server reorganization of
  `rna_phenotypes_quick.wb` files, which was previously located in ontologies
  directory, but was moved to annotations directory starting with WS280.

Minor changes:

- Updated lintr checks and testthat unit tests.

## WormBase 0.3.0 (2021-02-18)

Major changes:

- Package now uses BiocFileCache (via pipette) internally to cache files
  from WormBase FTP server.
- Sped up internal code significantly, making use of `CharacterList`, which
  helps avoid the need for BiocParallel `bplapply` calls.
- Reworked NAMESPACE and dependencies to extend on top of basejump v0.14
  release series.
- Renamed `version` argument to `release`, for better consistency with naming
  conventions used in basejump packages, such as AcidGenomes.

## WormBase 0.2.12 (2020-07-23)

Minor changes:

- Maintenance release, updating R dependency to 4.0.

## WormBase 0.2.11 (2020-01-26)

Major changes:

- Renamed package from "wormbase" to "WormBase".

Minor changes:

- Updated basejump dependencies.
- Now using cli package to display messages.

## WormBase 0.2.10 (2020-01-03)

Minor changes:

- Working example and unit test updates for `description` function, now that
  the corresponding file on the WormBase FTP server is no longer malformed.
  This has been fixed as of WS274.
- Updated REST API queries to use "https://wormbase.org/rest". Previously, this
  called "http://api.wormbase.org/rest", which no longer works.

## WormBase 0.2.9 (2019-08-29)

Major changes:

- Functions now return `DataFrame` instead of `tbl_df`.
- Updated R dependency to 3.6.
- Reworked internal code to use base R / Bioconductor methods, instead of
  tidyverse / dplyr approach.

Minor changes:

- Improved documentation and updated basejump dependency versions.

## WormBase 0.2.8 (2019-07-24)

- Updated basejump dependency versions.

## WormBase 0.2.7 (2019-03-26)

- Added support for WS269 release. Functions that parse files from the WormBase
  FTP server had to be modified to ensure only annotations matching N2 gene
  identifiers (e.g. `WBGene`) are returned.
- Removed `dir` argument for all functions that parse files from WormBase FTP
  server. Files now always download to `tempdir` instead.
- Improved internal tidyeval code where applicable, notably inside `mutate`
  calls using `sym` and `:=` [rlang][] functions.

## WormBase 0.2.6 (2019-03-23)

- Migrated code to [Acid Genomics][].

## WormBase 0.2.5 (2019-03-19)

- Reworked progress bar handling via `pbapply::pblapply`. This is now disabled
  for all functions by default, but can be enabled with `progress = TRUE`.
  pbapply package is now declared in "Enhances:" rather than "Imports:".
- Switched all internal assert checks to goalie package from assertive.

## WormBase 0.2.4 (2018-11-21)

- Maintenance release updating the package to require R 3.5.
- Improved documentation for functions and rebuild pkgdown website.
- Added `progress = TRUE` option for functions that can take a long time to
  parse data. Previously, this was always enabled but now can be disabled
  using this `progress = FALSE`. Note that `invisible(capture.output(x))` also
  works to suppress progress bars.

## WormBase 0.2.3 (2018-07-21)

- Fixed `geneID()` function to work with latest WormBase release that now
  returns an extra biotype column.
- Removed internal parallel `mclapply()` calls in favor of `pblapply()` for
  better compatibility across platforms.

## WormBase 0.2.2 (2018-04-23)

- Broke out assertive imports into separate packages: assertive.properties,
  assertive.strings, assertive.types.
- Removed todo comment in `description.R` file.

## WormBase 0.2.1 (2018-04-18)

- Renamed `gene` column to `geneID` where applicable.
- Removed fs package dependency.
- Added progress bars for functions that take a long time to load.

## WormBase 0.2.0 (2018-03-04)

- Renamed package to `wormbase` from `worminfo`.
- Simplified core functionality to simply pull genome annotations from the
  WormBase website into R.
- Previous functionality querying the ENSEMBL, PANTHER, and EggNOG databases
  will be split out into organism-agnostic packages.
- RNAi clone support is being migrated to the rnaiscreen package.

## WormBase 0.1.0 (2018-02-14)

(worminfo): Pre-release using internal build annotations from WormBase, ENSEMBL,
PANTHER, and EggNOG databases. RNAi clone support for ORFeome (WORFDB),
Ahringer, and Ruvkun Lab cherrypick libraries.

## WormBase 0.0.99 (2017-12-06)

(worminfo): Initial pre-release version.

[Acid Genomics]: https://acidgenomics.com/
[rlang]: https://rlang.r-lib.org/
