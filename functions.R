
#-------------General Functions------------
###Display database
dt_Shorthand <- function(df, pl = 10){
  datatable(
    df,
    options = list(
      searching = TRUE,  # Enable searching
      paging = TRUE,     # Enable pagination
      pageLength = pl,   # Limit to 10 rows per page
      rowCallback = JS(  # Add background color to even rows
        "function(row, data, index) {",
        "  if (index % 2 === 0) {",
        "    $('td', row).css('background-color', '#f2f2f2');",
        "  }",
        "}"
      )
    )
  )
}

div_Scroll <- function(object_var){
  
  ### Wrap object in div overflow tag
   result <- div(style = "overflow-x: scroll;", object_var)
   
   return(result)
}

