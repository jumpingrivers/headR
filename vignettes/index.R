## ----echo = FALSE, include = FALSE---------------------------------------
fnames = list.files("vignettes", pattern = "*.Rmd$", full.names = TRUE)
sapply(fnames, rmarkdown::render)

