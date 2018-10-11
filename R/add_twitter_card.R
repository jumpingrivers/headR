#' @title checking function arguments
#' @param card_type Required. Twitter card type. Must be "summary" or "summary_large_image".
#' @param title Required. Title for card content. Max 70 characters.
#' @param description Description for card content, max 200 characters.
#' @param file Required. File name to put in the header of Rmd doc, must be .html.
#'
check_twitter_arguments = function(card_type,
                                   title,
                                   description,
                                   file) {
  if (!(card_type %in% c("summary", "summary_large_image"))) {
    stop("Card type should be either summary or summary_large_image",
         call. = FALSE)
  }

  if (missing(title)) {
    stop(
      "Cards must have a content title as specified by twitter,
      see description for details",
      call. = FALSE
    )
  }
  if (nchar(title) > 70) {
    stop("Content title must be <= 70 characters,
         please amend",
         call. = FALSE)
  }
  if (!is.null(description) && nchar(description) > 200) {
    stop("Content description must be <= 200 characters,
         please amend",
         call. = FALSE)
  }

  if (nchar(file) < 1 ||
      substr(file, nchar(file) + 1 - 5, nchar(file)) != ".html") {
    stop("You must specify a valid file name to be used in your Rmd header")
  }
}


#' @importFrom glue glue
#' @title Create twitter summary cards
#'
#' @description An easy way to create twitter summary cards for your blogdown post.
#'     For more details on the meta tags see https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/summary.html
#'
#' @param card_type Required. Twitter card type. Must be "summary" or "summary_large_image".
#' @param user Twitter user id for the card to be linked to.
#' @param title Required. Title for card content. Max 70 characters.
#' @param description Description for card content, max 200 characters.
#' @param image Link for the content image.
#' @param image_alt Alternate text incase image does not load.
#' @param file Required. File name to put in the header of Rmd doc, must be .html.
#'
#' @export
#'
#' @examples
#' add_twitter_card(title = "HeadR is great!", file = "hello.html")
add_twitter_card = function(card_type = c("summary", "summary_large_image"),
                            title,
                            description = NULL,
                            user = NULL,
                            image = NULL,
                            image_alt = NULL,
                            file = "twitter_card.html") {
  card_type = card_type[1]

  check_twitter_arguments(card_type,
                          title,
                          description,
                          file)

  twitter_card = c(
    card = card_type,
    site = user,
    title = title,
    description = description,
    image = image,
    `image:alt` = image_alt
  )

  twitter_card = glue('<meta name="twitter:{names(twitter_card)}" content="{twitter_card}">')

  writeLines(text = twitter_card, con = file)
}

