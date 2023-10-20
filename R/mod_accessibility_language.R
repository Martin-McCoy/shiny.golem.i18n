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
    p(i18n$t("Welcome-using i18n")),
    shinyWidgets::switchInput(
      inputId = ns("lan"),
      label = "<i class=\"fa-solid fa-globe\"></i>",
      value = TRUE,
      onLabel = "EN",
      offLabel = "ES"
    ),
    h4("This is static test with some hydrologic domain jargon used in the Colorado River Basin Post-2026 Operations Exploration Tool"),
    h4("Acronyms:"),
    p("MOG: Minute Oversight Group"),
    h5("DCP: Lower Basin Drought Contingency Plan (U.S.)"),
    h4("Terms:"),
    h5("equalization"),
    p("storage equalization")
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
       shinyjs::runjs(glue::glue("Transifex.live.translateTo('{lang}');"))
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
