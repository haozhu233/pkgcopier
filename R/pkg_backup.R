#' Package Backup
#'
#' \code{pkg_backup()} saves the names of installed packages to a temporary
#' online drive and provides a download code if the process is successful.
#' The download code can be used in \code{pkg_restore()} to re-install packages
#' on a different version of R or a different computer.
#'
#' @param lib.loc Library Location. It's an argument passed to
#' \code{installed.packages()}.
#'
#' @importFrom utils installed.packages
#' @importFrom httr POST upload_file content
#' @importFrom stringr str_match
#'
#' @export

pkg_backup <- function(lib.loc = NULL){
  # Check installed packages
  installed_pkg <- installed.packages(lib.loc = lib.loc)
  installed_pkg <- dimnames(installed_pkg)[[1]]

  # Move to a temp dir and write the names of pkgs to a csv file
  temp_file <- tempfile()
  writeLines(installed_pkg, temp_file)

  # Send curl repuest to uguu and store the HTTP response
  curl_response <- POST(
    url = "https://uguu.se/api.php?d=upload",
    body = list(
      file = upload_file(temp_file),
      name = "pkgs")
  )

  if(curl_response$status_code == 200){
    message("Success! You just backed up your R packages!")
  }else{stop("Failed! You can report problems at ",
             "https://github.com/haozhu233/restoremypkg/issues")}

  # Retrive the download code from the HTTP response
  download_code <- str_match(
    content(curl_response, "text"),
    "a\\.uguu\\.se\\/(.*?)\\_pkgs")[2]

  message(
    paste0(
      "Your download code is: ", download_code,
      "\nThis code will expire in 24 hours. ",
      "Re-run this function if time runs out."
    )
  )
}
