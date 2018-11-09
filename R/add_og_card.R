check_og_arguments = function(card_type,
                                   title,
                                   image,
                                   url,
                                   file){
  if(any(missing(title),
         missing(image), missing(url))){
    stop("Open Graph requires meta tags for type, title, image and url.
          A file name must also be supplied.")
  }

  if (!(card_type %in% c("website", "article", "book"))) {
    stop("headR currently only supports website, article and book OG card types.",
         call. = FALSE)
  }

  if (nchar(file) < 1 ||
      substr(file, nchar(file) - 4, nchar(file)) != ".html") {
    stop("You must specify a valid file name to be used in your Rmd header")
  }
}

#' @importFrom glue glue
#' @title Create open graph meta tags
#'
#' @description An easy way to create open graph meta tags for your blogdown post.
#'     For more details on the meta tags see http://ogp.me/
#'
#' @param card_type Required. Open graph card type. See http://ogp.me/#types for list
#' @param title Required. Title for card content.
#' @param image Required. Link for the content image.
#' @param url Required. Canonical URl to be used as permanent ID in the graph.
#' @param image_alt Alternate text to display if image fails.
#' @param description Description for card content. One to two sentences.
#' @param site_name If your object is part of a larger web site, the name which should be displayed for the overall site.
#' @param video URL to a video file that complements the object
#' @param audio URL to an audio file that complements the object
#' @param author Authors of the content if content type is "article" or "book"
#' @param file Required. File name to put in the header of Rmd doc, must be .html.
#'
#' @export
#'
#' @examples
#' add_og_card(title = "HeadR is great!",
#'        image = "https://www.rstudio.com/wp-content/uploads/2014/06/RStudio-Ball.png",
#'        url = "https://www.jumpingrivers.com",
#'        file = "hello.html")
add_og_card = function(card_type = c("website", "article", "book"),
                            title,
                            image,
                            url,
                            description = NULL,
                            image_alt = NULL,
                            site_name = NULL,
                            video = NULL,
                            audio = NULL,
                            author = NULL,
                            file = "og_card.html") {
  card_type = card_type[1]

  check_og_arguments(card_type, title, image, url, file)

  og_card = c(
    card = card_type,
    title = title,
    image = image,
    url = url,
    `image:alt` = image_alt,
    description = description,
    site_name = site_name,
    video = video,
    audio = audio
  )

  og_card = glue('<meta property="og:{names(og_card)}" content="{og_card}">')

  if (!missing(author)) {
    if (author %in% c("article", "book")) {
       og_card = glue(og_card,
                     '<meta property="{card_type}:author content="{author}"')
    }
  }
  writeLines(text = og_card, con = file)
}

