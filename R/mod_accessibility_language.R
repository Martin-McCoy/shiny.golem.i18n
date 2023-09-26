#' accessibility_language UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_accessibility_language_ui <- function(id){
  ns <- NS(id)

  tagList(
    p(i18n$t("Welcome")),
    #p("TEST"),
    shinyWidgets::switchInput(
      inputId = ns("lan"),
      label = "<i class=\"fa-solid fa-globe\"></i>",
      value = TRUE,
      onLabel = "EN",
      offLabel = "ES"
    )
  )
}

#' accessibility_language Server Functions
#'
#' @noRd
mod_accessibility_language_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

   observeEvent(input$lan,{
       lang<- ifelse(isTRUE(input$lan), "en", "es")
       shiny.i18n::update_lang(language = lang, session)
       i18n$set_translation_language(lang)
       lang(lang)
   })








  })
}

## To be copied in the UI
# mod_accessibility_language_ui("accessibility_language_1")

## To be copied in the server
# mod_accessibility_language_server("accessibility_language_1")
