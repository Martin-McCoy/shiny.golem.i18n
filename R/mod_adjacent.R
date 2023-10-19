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
    shiny::sliderInput(
      ns("a_slider"),
      label = "A slider that dynamically updates text",
      min = 0,
      max = 100,
      value = 50,
      step = 1
    ),
    shiny::selectInput(
      ns("a_dropdown"),
      label = "A Dropdown that updates text",
      choices = names(mtcars),
      selected = "cyl"
    ),
    uiOutput(ns("dynamic_text"))
  )
}
    
#' adjacent Server Functions
#'
#' @noRd 
mod_adjacent_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$dynamic_text <- shiny::renderUI({
      tags$p("This is some dynamic text. This is the column choice: ", tags$span(input$a_dropdown),". This is the slider value: ", tags$span(input$a_slider))
    })
    
  })
}
    
## To be copied in the UI
# mod_adjacent_ui("adjacent_1")
    
## To be copied in the server
# mod_adjacent_server("adjacent_1")
