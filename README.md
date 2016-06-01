# Package Copier
## Stories
1. Amy just got a brand new computer. She is excited and wants to do some R programming right away, until she realize that she doesn't have her favorite packages installed...
2. Jeff wants to jump start Peter, a student intern who recently joined Jeff's company, on R and teach him some R tricks. As soon as he opens Peter's RStudio, he realizes that he needs to spend some time on installing packages before he can get started. 
3. Steve is TAing a university class using R. He received a lot of questions from students asking for recommendations of good R packages. Steve hates to tell them one by one. 
4. Mary just did a major upgrade for R. She sadly realized that she needs to reinstall her R packages. 

## Introduction
Set up R packages in a new environment is annoying.  

Even though we have [`packrat`](https://rstudio.github.io/packrat/) to help us manage package dependency, sometimes the process is still too complicated, especially for new R users. Could we just have a simple solution that can solve 90% of the problems in two simple commands?

## How to
The main goal is to keep things simple. It is a simple task. Therefore, there is no reason to get it complicated. 

### In you old environment
```r
library(pkgcopier)
pkg_copy()
```
Output:  
<span style="color: #C30D19;">Success! You just copied your R package info to cloud!  
Your download code is: mh223J3LHD0a  
This code will expire in 24 hours. Re-run this function if time runs out.</span>

### Then in your new environment
```r
# install.packages("devtools")
# devtools::install_github("haozhu233/pkgcopier")
library(pkgcopier)
pkg_paste("mh223J3LHD0a")
```
That's it!
