# Package Copier
[![CRAN
version](http://www.r-pkg.org/badges/version/pkgcopier)](https://cran.r-project.org/package=pkgcopier)
[![CRAN\_downloads](http://cranlogs.r-pkg.org/badges/pkgcopier)](http://cran.rstudio.com/web/packages/pkgcopier/index.html)

## Stories
1. Steve is teaching a university class using R. He wants his students (~30 people) to quickly install a list of R packages on their computers. 
2. Amy just got a brand new computer. She is excited and wants to do some R programming right away, until she realize that she doesn't have her favorite packages installed...
3. Jeff wants to jump start Peter, a student intern who recently joined Jeff's company, on R and teach him some R tricks. As soon as he opens Peter's RStudio, he realizes that he needs to spend some time on installing packages before he can get started. 
4. Mary just did a major upgrade for R. She sadly realized that she needs to reinstall her R packages. 

## Introduction
Set up R packages in a new environment is annoying.  

Of course, we have [`packrat`](https://rstudio.github.io/packrat/) and [`docker`](https://www.docker.com/). Both of them are excellent tools. However, do you also feel in the same way that these tools are too fancy for this simple task? All we need here is just to "copy" all the R packages we have on computer A and "paste" them to computer B. Could we just have a simple solution for this simple task?

This package will allow you to copy the names of your favorite packages to a public cloud space using `pkg_copy()`. Your package info will stay there for 24 hrs and you will get a download code. On a new computer, you can use that code inside `pkg_paste()` to download all the packages that are not on the new computer. It is just that simple! 

## How to

### On your computer
```r
library(pkgcopier)
pkg_copy()
```
Output:  
Success! You just copied your R package info to cloud!  
Your download code is: **mh223J3LHD0a**  
This code will expire in 24 hours. Re-run this function if time runs out.

### On your new computer or your friend's/student's computer
```r
install.packages("pkgcopier")
library(pkgcopier)
pkg_paste("mh223J3LHD0a")
```
That's it!

## Where was the meta data stored?
The names of your packages are uploaded to [https://uguu.se/](https://uguu.se/), a temporary file hosting website. It is developed by [nokonoko](https://github.com/nokonoko) and the github project page is [here](https://github.com/nokonoko/Uguu).

## Development
### Contribute
Welcome contributions from all levels. Also, feel free to use the source code in other packages. 

### Future plans
1. In case [uguu.se](https://uguu.se/) goes down, I will create a centralized file hosted on github or somewhere for similar services. 
2. Currently, I only saved package name to cloud as I believe you should always keep your packages updated and a new environment is a good place to do that. If people needs that feature, I will add it. 
3. Alternatively, users can create permentant download link. I will see what I can do
4. Also, people should be able to save a specific package list to the cloud instead of backing up their whole library of packages. 
