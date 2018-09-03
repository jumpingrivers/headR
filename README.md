<!-- README.md is generated from README.Rmd. Please edit that file -->
HeadR [![Build Status](https://travis-ci.org/jumpingrivers/headR.svg?branch=master)](https://travis-ci.org/jumpingrivers/headR)
===============================================================================================================================

HeadR is a package for creating social media summary cards to share your
articles. Usually you would have to write meta tags within your HTML
file to do this. An example of how you would add these meta tags to your
Rmd document is as shown:

``` r
---
output: 
  html_document: 
    includes:
      in_header: twitter_card.html
---  

## Testing

headR::add_twitter_card(title = "This is the title!", file = "twitter_card.HTML")
```
