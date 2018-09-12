
library(shiny)
library(tidyverse)

ui <- fluidPage(
  
  # App title ----
  titlePanel("Ansel Lab Antibody DB"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      # Input file
      fileInput(
        inputId = "file",
        label = "File Upload:",
        accept = c(".csv")
      ),
      
      # Or input google sheets information
      textInput(
        inputId = "googleSheetsSS",
        label = "Google Sheets Spreadsheet Name:",
        value = NULL
      ),
      textInput(
        innputID = "googleSheetsWS",
        label = "Google Sheets Worksheet Name:",
        value = NULL
      ),
      
      
      # Input: Antibodies
      uiOutput("antibody"),
      downloadButton("saveABtable")
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output table
      dataTableOutput("table")
      
    )
  )
)

server <- function(input, output, session) {
  ABdb <- reactiveVal(NULL)
  ABtable <- reactiveVal(NULL)
  
  observeEvet({
    input$file}, {
      req(input$file)
      
      df <- tidyr::gather(readr::read_csv(input$file$datapath, 
                                          col_names = TRUE), 
        Fluorophore, 
        value, 
        -Antibodies)
      
      df$Fluorophore <- factor(df$Fluorophore, 
                               levels = unique(df$Fluorophore))
      
      output$antibody <- renderUI({
        selectInput("antibodies",
                    "Select antibodies to display:",
                    choices = df$Antibodies,
                    multiple = TRUE)
      })
      ABdb(df)
      
  })
  
  observeEvent({
    input$googleSheetsSS
    input$googleSheetsWS}, {
      
      req(input$googleSheetsSS,
          input$googleSheetsWS)
      
      df <- tidyr::gather(googlesheets::gs_read(
        ss = googlesheets::gs_title(input$googleSheetsSS), 
        ws = intput$googleSheetsWS), 
        Fluorophore, 
        value, 
        -Antibodies)
      
      df$Fluorophore <- factor(df$Fluorophore, 
                               levels = unique(df$Fluorophore))
      
      output$antibody <- renderUI({
        selectInput("antibodies",
                    "Select antibodies to display:",
                    choices = df$Antibodies,
                    multiple = TRUE)
      })
      ABdb(df)
  })

  
  observeEvent({
    ABdb()
    input$antibodies}, {
      req(input$antibodies,
          ABdb())
      db <- antibodySeek::get_panel(ABdb(), input$antibodies)
      ABtable(db)
  })
  
  # Table of fluorophores for each antibody selected
  output$table <- renderDataTable({
    ABtable()
  })
  
  # Save table
  #### Save stats table ####
  output$saveABtable <- downloadHandler(
    file = function() {
      paste0("Antibodies", ".csv")
    },
    content = function(file) {
      readr::write_csv(ABtable(), file, col_names = TRUE)
    }
  )
  
  #### Stop app on close ####
  session$onSessionEnded(stopApp)
}




shinyApp(ui, server)
