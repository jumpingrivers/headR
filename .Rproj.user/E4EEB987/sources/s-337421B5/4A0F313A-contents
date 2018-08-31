#' @title Create elegents interactive gauge illustrations
#'
#' @description An easy way to create gauge charts based on the rstudio
#' js tutorials with functions for easy implementation in shiny.
#'
#' @import htmlwidgets
#' @param value A numeric between 0 and 100. Represents a percentage.
#' @param width,height Must be a valid CSS
#' unit (like \code{"100px"}, \code{'400px'}, \code{'auto'}) or a number,
#' which will be coerced to a string and have \code{'px'} appended.
#' @export
#' @examples
#' gauge(0)
#'
#' gauge(50)
#'
#' gauge(1:4)
gauge <- function(value, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    data = value
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'gauge',
    x,
    width = width,
    height = height,
    package = 'gaugeR'
  )
}

#' @title Shiny bindings for gauge
#'
#' @description Output and render functions for using gauge within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a gauge
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name gauge-shiny
#'
#' @export
#' @examples
#' ## Only run this in interactive sessions
#' if(interactive()){
#'   ui <- fluidPage(
#'     titlePanel("Gauge Example!"),
#'     sidebarLayout(
#'       sidebarPanel(
#'         sliderInput("obs",
#'                     "Pick a percentage",
#'                     min = 1,
#'                     max = 100,
#'                     value = 5)
#'       ),
#'       mainPanel(
#'         gaugeOutput("gaugePlot")
#'       )
#'     )
#'   )
#'   server <- function(input, output) {
#'
#'     output$gaugePlot <- renderGauge({
#'       gauge(input$obs)
#'     })
#'
#'   }
#'
#'   shinyApp(ui = ui, server = server)
#' }
gaugeOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'gauge', width, height, package = 'gaugeR')
}
#' @title Shiny bindings for gauge
#'
#' @description Output and render functions for using gauge within Shiny
#' applications and interactive Rmd documents.
#' @rdname gauge-shiny
#' @export
renderGauge <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, gaugeOutput, env, quoted = TRUE)
}
