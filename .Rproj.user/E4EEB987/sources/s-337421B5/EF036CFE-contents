#' @title Create twitter summary cards
#'
#' @description An easy way to create twitter summary cards for your blogdown post
#'
#' @param card must be "summary"
#' @param user twitter suer id for the card to be linked to
#' @param content_title title for card content, max 70 characters
#' @param content_description description for card content, max 200 characters
#' @param content_image link for the content image
#' @file file name to put in the header of Rmd doc
#'
#' @export
#'
#' @examples
#' add_twitter_card()
add_twitter_card = function(card = "summary",
                            user = "@Jumping_UK",
                            content_title = "max 70 characters",
                            content_description = "max 200 characters",
                            content_image = "https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=2ahUKEwiChLjtipfdAhVOxxoKHWfTD_oQjRx6BAgBEAU&url=https%3A%2F%2Fwww.jumpingrivers.com%2Fblog%2Four-logo-in-r%2F&psig=AOvVaw15HKIqgjXe2Hs8iFvu98k4&ust=1535797811922853",
                            file = "foo.html"){

  card = paste0("<meta name=\"twitter:card\" content0=\"",card,"\">")
  user = paste0("<meta name=\"twitter:site\" content=\"",user,"\">")
  content_title = paste0("<meta name=\"twitter:title\" content=\"",content_title,"\">")
  content_description = paste0("<meta name=\"twitter:description\" content=\"",content_description,"\">")
  content_image = paste0("<meta name=\"twitter:image\" content=\"",content_image,"\">")

  text = c(card, user, content_title, content_description, content_image)

  writeLines(text = text,
             con = file)
}

