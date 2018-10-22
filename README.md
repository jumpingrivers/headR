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

headR::add_twitter_card(title = "This is the title!", file = "twitter_card.html")
```

Full examples are contained withing the `inst` directory within the
package:

`add_twitter_card()` for twitter example
----------------------------------------

Within `inst -> examples`, there is an Rmd document called
`twitter_large_summary_image.Rmd`. When knitted, this document creates a
html page that we have stored on `www.jumpingrivers.com`. This contains
the code that was run to put the meta tags in the header. Copy and paste
this page URL into the [twitter card
validator](https://cards-dev.twitter.com/validator) and you will see
what the example twitter card looks like.

`add_og_card()` for open graph example
--------------------------------------

Again, within `inst -> examples`, there is an Rmd document, this time
called `open_graph.Rmd`. When knitted, this document creates a html page
that we have stored on `www.jumpingrivers.com`. The Rmd document also
contains the code that was run to put the meta tags in the header. I
have found the best way to preview open graph sharing cards is to
download the chrome extension [Open Graph
Preview](https://chrome.google.com/webstore/detail/open-graph-preview/ehaigphokkgebnmdiicabhjhddkaekgh/related).
