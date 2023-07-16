#----------SERVER----------------
server <- function(input, output, session) {
  
  ### SERVER ITEM 1---------
  
  # read imported CSV_1
  table_1 <- reactive({
    file <- input$table_1
    if(is.null(file)){
      return(NULL)
    } else{
      read.csv(file$datapath, header = TRUE)
    }
  })
  
  # read imported CSV_2
  table_2 <- reactive({
    file <- input$table_2
    if(is.null(file)){
      return(NULL)
    } else{
      read.csv(file$datapath, header = TRUE)
    }
  })
  
  #Display CSV Data as table
  
  output$csv1 <- DT::renderDataTable({
    DT_shorthand(table_1(), 10)
  })
  
}