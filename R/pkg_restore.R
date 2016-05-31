#' Package Restore
#'
#' \code{pkg_restore()} obtains the list of saved R packages and makes a
#' comparison with the list of available packages on the new machine (or new R
#' environment). It will attempt to install all the packages that are not
#' available on the new machine and report any packages that cannot be
#' installed. \code{pkg_restore_list()} only provides package names and does
#' not attempt to install. Users can pass this list to \code{install.packages()}
#' to install by themselves.
#'
#' @param code Download code returned by \code{pkg_backup()}.
#' @param lib.loc Library Location. It's an argument passed to
#' \code{installed.packages()}.
#' @param ... Arguments passed to \code{install.packages()}
#'
#' @importFrom utils install.packages
#' @importFrom httr write_disk GET
#'
#' @export

pkg_restore <- function(code, lib.loc = NULL, ...){
  pkgs_to_install <- pkg_restore_list(code = code, lib.loc = lib.loc)
  if(!is.null(pkgs_to_install)){
    install.packages(pkgs_to_install, ...)
  }
}

#' @rdname pkg_restore
#' @export

pkg_restore_list <- function(code, lib.loc = NULL){
  # Download list from the download code
  download_url <- paste0("https://a.uguu.se/", code, "_pkgs")
  temp_file <- tempfile()
  GET(download_url, write_disk(temp_file))

  cloud_pkgs <- readLines(temp_file)
  local_pkgs <- dimnames(installed.packages(lib.loc = lib.loc))[[1]]
  pkgs_to_install <- cloud_pkgs[!cloud_pkgs %in% local_pkgs]
  if(length(pkgs_to_install) == 0){
    message("You have installed all the R packages you backed up. ")
  }else{
    return(pkgs_to_install)
    }
}
