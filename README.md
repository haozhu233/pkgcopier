# Package Copier
## Stories
1. Amy just got a brand new computer. She is excited and wants to do some R programming right away, until she realize that she doesn't have her favorite packages installed...
2. Jeff wants to jump start Peter, a student intern who recently joined Jeff's company, on R and teach him some R tricks. As soon as he opens Peter's RStudio, he realizes that he needs to spend some time on installing packages before he can get started. 
3. Steve is TAing a university class using R. He received a lot of questions from students asking for recommendations of good R packages. Steve hates to tell them one by one. 
4. Mary just did a major upgrade for R. She sadly realized that she needs to reinstall her R packages. 

## Introduction
Set up R packages in a new environment is annoying.  

Even though we have [`packrat`](https://rstudio.github.io/packrat/) to help us manage package dependency, sometimes the process is still too complicated, especially for new R users. The problem is that `packrat` manages the project level package dependency (somewhat similar with npm) while in many real world cases, all we need is just to "copy" all the R packages I have on computer A and "paste" them to computer B. Could we just have a simple solution for this simple task?

This package will allow you to copy the names of your favorite packages to a public cloud space using `pkg_copy()`. Your package info will stay there for 24 hrs and you will get a download code. On a new computer, you can use that code inside `pkg_paste()` to download all the packages that are not on the new computer. It is just that simple! 

## How to

### In you old environment
```r
library(pkgcopier)
pkg_copy()
```
Output:  
Success! You just copied your R package info to cloud!  
Your download code is: **mh223J3LHD0a**  
This code will expire in 24 hours. Re-run this function if time runs out.

### Then in your new environment
```r
# install.packages("devtools")
# devtools::install_github("haozhu233/pkgcopier")
library(pkgcopier)
pkg_paste("mh223J3LHD0a")
```
That's it!

## Development
### Contribute
Welcome contributions from all levels. Also, feel free to use the source code in other packages. 

### Future plans
1. In case [uguu.se](https://uguu.se/) goes down, I will create a centralized file hosted on github or somewhere for similar services. 
2. Currently, I only saved package name to cloud as I believe you should always keep your packages updated and a new environment is a good place to do that. If people needs that feature, I will add it. 
3. Alternatively, users can create permentant download link. I will see what I can do
4. Also, people should be able to save a specific package list to the cloud instead of backing up their whole library of packages. 
