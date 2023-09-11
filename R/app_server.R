#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  
  
  
  mod_accessibility_language_server("toggle")
  

  
  output[["welcome"]] <- renderUI({
    lang()
    browser()
    bg <- switch(i18n$get_translation_language(), 
                 "en" = "white",
                 "es" = "yellow",
                 "fr" = "steelblue",
                 "de" = "lightgrey")
    
    div(style = paste("padding: 10px; border-radius: 10px; background:", bg), h3(i18n$t("Welcome")))
  }) 
}
