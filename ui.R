shinyUI(fluidPage(
  titlePanel('Books Project'),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", 
                           plotlyOutput("books_by_year")
                           ),
                  tabPanel("Summary", 
                           plotOutput('publisher_cnt')
                           ),
                  tabPanel("Table", 
                           DT::dataTableOutput("mytable")
                           )
      )
    )
  )
)
)



 