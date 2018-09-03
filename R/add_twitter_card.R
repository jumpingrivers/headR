#' @importFrom glue glue
#' @title Create twitter summary cards
#'
#' @description An easy way to create twitter summary cards for your blogdown post.
#'     For more details on the meta tags see https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/summary.html
#'
#' @param card_type Twitter card type. Must be "summary" or "summary_large_image".
#' @param user Twitter user id for the card to be linked to.
#' @param content_title Title for card content, max 70 characters. All twitter cards require this.
#' @param content_description Description for card content, max 200 characters.
#' @param content_image Link for the content image.
#' @param file File name to put in the header of Rmd doc, must be .HTML. Defaults to twitter_card.HTML
#'
#' @export
#'
#' @examples
#' add_twitter_card(content_title = "Hello", file = "hello.HTML")
add_twitter_card = function(card_type = "summary",
                            user = NULL,
                            content_title = NULL,
                            content_description = NULL,
                            content_image = NULL,
                            file = "twitter_card.HTML") {
  if (is.null(content_title)) {
    stop(
      "Cards must have a content title as specified by twitter, see
      https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/summary.html
      for details",
      call. = FALSE
    )
  } else{
    if (nchar(content_title) > 70) {
      stop("Content title must be <= 70 characters, please amend",
           call. = FALSE)
    }
  }
  if (nchar(file) < 1) {
    stop("You must specify a valid file name to be used in your Rmd header")
  }
  if (!(card_type %in% c("summary", "summary_large_image"))) {
    stop("Card type should be either summary or summary_large_image",
         call. = FALSE)
  }
  if (!is.null(content_description)) {
    if (nchar(content_description) > 200) {
      stop("Content description must be <= 200 characters, please amend",
           call. = FALSE)
    }
  }
  twitter_card = c(
    card = card_type,
    site = user,
    title = content_title,
    description = content_description,
    image = content_image
  )

  twitter_card = glue('<meta name="twitter:{names(twitter_card)}" content="{twitter_card}">')

  writeLines(text = twitter_card, con = file)
}

