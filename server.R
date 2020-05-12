shinyServer(function(input, output, session) {
  
  output$books_by_year <- renderPlot( {
    ####ALex's code#########################
    #renderPlotly({
    # ggplotly(books %>% ggplot(aes(x=year)) + 
    #            geom_histogram(bins = input$bins))
    ############################################################
    ####Commenting out barplot codeMay 11 #####
    # BooksByYear <-ggplot(books, aes(year,  year))
    # BooksByYear +geom_bar(stat = "identity")+theme(axis.text.x = element_text(angle = 45, hjust = 1))+labs(x="Year", y = "#Books")
    #Adding line chart
    BooksByYear <- ggplot(books, aes(x=year )) + geom_line(aes(fill=..count..), stat="bin", binwidth=10) 
    BooksByYear+theme(axis.text.x = element_text(angle = 45, hjust = 1))+labs(x="Year", y = "#Books") 
     
     })
  
  #output$sample_text <- renderText(h1('Hello'))
  #added n may 9 2020,the plot
  output$publisher_cnt <- renderPlot( {
    
    # barplot(sort(table(books$publisher))[1:10], main = "Title", xlab = "Publisher",
    #         ylab = "Frequency",col='coral')
    #ggplot authors by avg rating,labs is for renaming the axis and cor flip is for fliping te axis
 
# p <-ggplot(Author_books_1, aes( x =  authors ,y=average_rating))
# p +geom_bar(stat = "identity")+theme(axis.text.x = element_text(angle = 45, hjust = 1))+labs(x="Author", y = "Average Rating")+coord_flip()

#Top 30 Auhtors by avg rating
p <-ggplot(Author_books_1, aes(x=authors,y=factor(average_rating) )) +theme(axis.text.x = element_text(angle = 60, hjust = 1))+ stat_summary(fun.y="mean", geom="bar")
p+labs(x="Author Names", y = "Average Rating")


    
    
    })
   output$books_by_languageCode <- renderPlot( {
 
  pLanguage <-ggplot(Author_books, aes( x =  reorder(language_code,-average_rating) ,y=average_rating))
  pLanguage +geom_bar(stat = "identity")+theme(axis.text.x = element_text(angle = 45, hjust = 1))+labs(x="Language Codes", y = " Nbr of books") 

  })
  
  #COmmenting out Alex's code
  # output$mytable = DT::renderDataTable({
  #   books
  # })
   
  output$mytable = DT::renderDataTable({
    Top10Title[,c(-1)]#getting rid of the index column
  })
  
  
   
})


