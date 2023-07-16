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
        fileInput("file", "Import CSV file"),
        DT::dataTableOutput("csv1")
      )
      ),
      tabItem("tab1_sub1", 
              fluidPage(
                titlePanel(
                  title ="Table Joiner",
                  windowTitle = "Table Joiner"
                ),
                sidebarPanel(

                ),
                mainPanel(

              )
      )
    )
  )
)
)
