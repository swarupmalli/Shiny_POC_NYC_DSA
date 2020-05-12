

shinyUI(fluidPage( 
   theme = shinytheme("cerulean"),
  titlePanel('Goodreads Analysis Project'),
  #sidebarLayout(
    # sidebarPanel(
    #   # sliderInput("bins", "Number of bins:",
    #   #             min = 1,
    #   #             max = 50,
    #   #             value = 30)
    # )   ,    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("#Books By Year", 
                           plotOutput("books_by_year")
                           ),
                  tabPanel("Authors By Rating", 
                           plotOutput('publisher_cnt')
                           ),
                  tabPanel("Books By Language Code", 
                           plotOutput('books_by_languageCode')
                           ),
                  tabPanel("Top 50 Books By Nbr Of User Reviews", 
                           DT::dataTableOutput("mytable")
                           )
      )
    )
#  )
)
)



 