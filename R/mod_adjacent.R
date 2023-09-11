#' adjacent UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_adjacent_ui <- function(id){
  ns <- NS(id)
  tagList(
    i18n$t('Welcome')
  )
}
    
#' adjacent Server Functions
#'
#' @noRd 
mod_adjacent_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_adjacent_ui("adjacent_1")
    
## To be copied in the server
# mod_adjacent_server("adjacent_1")
