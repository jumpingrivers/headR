HeadR <img src="man/img/logo.png" align="right" />
==================================================

[![Build
Status](https://travis-ci.org/jumpingrivers/headR.svg?branch=master)](https://travis-ci.org/jumpingrivers/headR)

**headR** is an R package for creating html summary cards for your R
markdown files. These cards are located in the meta tags of generated
HTML document and allow you add richer content when sharing your site.

To install the package, you need the **devtools** package

``` r
devtools::install_github("jumpingrivers/headR")
```

Twitter Cards
-------------

When a URL is shared on twitter, the web page is parsed to determine if
a [twitter
card](https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/getting-started.html)
is present.

For example, the following pages have twitter cards:

-   [Twitter
    card](https://www.jumpingrivers.com/rpackages/headr/vignettes/twitter_large.html)
-   [Twitter card +
    Slides](https://www.jumpingrivers.com/rpackages/headr/vignettes/twitter_slides.html)

To preview the twitter card for these document, simply copy and paste
the page URL into the [twitter card
validator](https://cards-dev.twitter.com/validator).

When the links are shared via twitter, the bespoke card is displayed!

The package
-----------

HeadR currently supports two types of meta tags: twitter and open graph.
Usually you would have to write meta tags within your html file for them
to have a visually appealing sharing format. An example of how you would
add these meta tags to your Rmd document is as shown:

    ---   
    output: 
      html_document: 
        includes:
          in_header: twitter_card.html
    ---

The file `twitter_card.html` contains meta tag information is the output
of running the function `headR::add_twitter_card()`. More specifically:

``` r
headR::add_twitter_card(title = "This is the title!", 
                        file = "twitter_card.html", 
                        image = "http://www.example.com/path.jpg")
```

------------------------------------------------------------------------

Development of this package was supported by [Jumping
Rivers](https://www.jumpingrivers.com/)
