shinyServer(function(input, output, session) {
  
  output$books_by_year <- renderPlotly({
    ggplotly(books %>% ggplot(aes(x=year)) + 
               geom_histogram(bins = input$bins))
  })
  
  #output$sample_text <- renderText(h1('Hello'))
  #added n may 9 2020,the plot
  output$publisher_cnt <- renderPlot( {
    barplot(sort(table(books$publisher))[1:10], main = "Title", xlab = "Publisher",
            ylab = "Frequency",col='coral')})
  
  #COmmenting out Alex's code
  # output$mytable = DT::renderDataTable({
  #   books
  # })
   
  output$mytable = DT::renderDataTable({
    Top10Title[,c(-1)]#getting rid of the index column
  })
  
  
   
})


