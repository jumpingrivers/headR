#' @title Create twitter summary cards
#'
#' @description An easy way to create twitter summary cards for your blogdown post
#'
#' @param card must be "summary" or "summary_large_image"
#' @param user twitter user id for the card to be linked to
#' @param content_title title for card content, max 70 characters
#' @param content_description description for card content, max 200 characters
#' @param content_image link for the content image
#' @param file name to put in the header of Rmd doc
#'
#' @export
#'
#' @examples
#' add_twitter_card()
add_twitter_card = function(card = "summary",
                            user = "@jumping_uk",
                            content_title = "Content title",
                            content_description = "Content description.",
                            content_image = "https://www.rstudio.com/wp-content/uploads/2014/06/RStudio-Ball.png",
                            file = "foo.html"){
  if(!(card %in% c("summary","summary_large_image"))){
    stop("Card type should be either summary or summary_large_image")
  }
  if(nchar(content_title) > 70 | nchar(content_description) > 200){
    stop("Too many characters for title or description, please amend")
  }
  card = paste0("<meta name=\"twitter:card\" content=\"",card,"\">")
  user = paste0("<meta name=\"twitter:site\" content=\"",user,"\">")
  content_title = paste0("<meta name=\"twitter:title\" content=\"",content_title,"\">")
  content_description = paste0("<meta name=\"twitter:description\" content=\"",content_description,"\">")
  content_image = paste0("<meta name=\"twitter:image\" content=\"",content_image,"\">")

  text = c(card,
           user,
           content_title,
           content_description,
           content_image)

  writeLines(text = text,
             con = file)
}

