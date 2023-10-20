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
    shiny::selectInput(ns("language_select"),
                       label = "Select Language",
                       choices = c("en", "es"),
                       selected = "en"
    ),
    tags$script(
      UU::glue_js(
        "
         //This is called each time the languages list is retrieved
    //from Transifex Live. This may happen more than once, so we should
    //be able to handle this case.
    Transifex.live.onFetchLanguages(function(languages) {
      var id = '#' + '*{ns('language_select')}*'
      //empty our language <select> list 
      $(id).empty();
      
      //add translation languages to the list
      for (var i = 0; i < languages.length; ++i) {
        $(id).append(
          '<option value=\"' + languages[i].code +
            '\">' + languages[i].name + '</option>'
        );
      }
      
      //set the language selector to the source language (default)
      $(id).val(
        Transifex.live.getSourceLanguage().code
      );
      
      //handle user selecting a language
      $(id).change(function() {
        //tell transifex live to translate the page
        //based on user selection
        Transifex.live.translateTo($(this).val());
      });
      
      //called when Transifex Live successfully translates the
      //page to a language. In that case let's update the
    //selected language of the widget
    Transifex.live.onTranslatePage(function(language_code) {
        $('#' + '*{ns('language_select')}*').val(language_code);
    });
    });
      "
      )
    ),
      
     
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
