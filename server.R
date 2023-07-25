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
    dt_Shorthand(table_1(), 5)
  })
  output$csv2 <- DT::renderDataTable({
    dt_Shorthand(table_2(), 5)
  })
  
  
  merged_table <- reactive ({
    # check if both tables are imported
    
    if(is.null(table_1()) | is.null(table_2()) | input$by_Var == ""){
      return(NULL)
    } else {
        
      
      
      by_var <- input$by_Var
      merged_df <- merge(table_1(), table_2(), 
                         by = by_var,
                         all = TRUE)
      
      merged_df
      
      }
  })
  
  output$merged_csv <- DT::renderDataTable({
    if(is.null(merged_table())){
      return(NULL)
    } else {
      dt_Shorthand(merged_table(), 10)
    }
  })
  
}