#-------UI------------
ui <- dashboardPage(
  dashboardHeader(
    title = "Table Joiner"
  ),
  dashboardSidebar(
    sidebarMenu(
      ### Menu Item 1 --------
      menuItem("Import CSV", tabName = "tab1", icon = icon("database")),
      ### Menu 1, Sub Item 1
      menuSubItem("Table Joiner", tabName = "tab1_sub1", icon = icon("line-chart"))
    )
  ),
  dashboardBody(
    tabItems(
      ### Tab Item 1 ---------
      tabItem("tab1", fluidPage(
        textInput('by_Var', "By which attribute:",
                  c("")),
        fileInput("table_1", "Import CSV file"),
       div_Scroll( DT::dataTableOutput("csv1")),
        fileInput("table_2", "Import CSV file"),
        div_Scroll(DT::dataTableOutput("csv2")),
      )
      ),
      tabItem("tab1_sub1", 
              fluidPage(
                titlePanel(
                  title ="Table Joiner",
                  windowTitle = "Table Joiner"
                ),
                mainPanel(
                  div_Scroll(DT::dataTableOutput("merged_csv"))

              )
      )
    )
  )
)
)
