
pkg_backup <- function(lib.loc = NULL){
  # Check installed packages
  installed_pkg <- installed.packages(lib.loc = lib.loc)
  #installed_pkg <- installed.packages()
  installed_pkg <- dimnames(installed_pkg)[[1]]

  # Move to a temp dir and write the names of pkgs to a csv file
  owd <- setwd(tempdir())
  on.exit(setwd(owd))
  write.csv(installed_pkg, "pkgs.csv", row.names = FALSE)

  # Send curl repuest to uguu and store the HTTP response
  curl_response <- POST(
    url = "https://uguu.se/api.php?d=upload",
    body = list(file = upload_file("pkgs.csv"))
  )

  if(curl_response$status_code == 200){
    message("Success! You just backed up your R packages!")
  }else{stop("Failed! You can report problems at https://github.com/haozhu233/restoremypkg/issues")}

  # Retrive the download code from the HTTP response
  download_code <- str_match(
    content(curl_response, "text"),
    "a\\.uguu\\.se\\/(.*?)\\_pkgs\\.csv")[2]

  message(
    paste0(
      "Your download code is: ", download_code,
      "\nThis code will expire in 24 hours. You need to rerun this function ",
      "after that. "
    )
  )
}

