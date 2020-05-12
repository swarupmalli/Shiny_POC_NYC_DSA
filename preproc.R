library(dplyr)
library(ggplot2)
 
 #Importing my books data set
#books<- read.csv(file ="./data/books_new.csv")
books<- read.csv(file ="./data/books_new.csv", sep = ";")
 
 
# 2. Convert the publication_date column from character to date
books = books %>%
   mutate(publication_date=as.Date(publication_date, '%m/%d/%Y')) %>% 
   mutate(year=substr(publication_date, 1,4))

write.csv(books,'./data/books_final.csv')
 
unique(books$year)# 1992-2006
names(books)
#Gives uniques number of rows in each variable of books df
sapply(books, function(x) length(unique(x)))


#Selecting a subset of columns to build a table from books for top books by average rating
TOpBooksdata <-books %>% select(title,authors,publisher,year,language_code,text_reviews_count)
 
#Now sort the data by cnt of text_reviews_count in descending order
#Sorting and slcing using  dplyr
TOpBooksdata  <- TOpBooksdata[with(TOpBooksdata, order(-text_reviews_count)),]
TOpBooksdata [ , c("title", "text_reviews_count")]  

head(TOpBooksdata )
names(TOpBooksdata )# get the names of the fields

  
 
#Renaming the fields 
TOpBooksdata <- rename(TOpBooksdata, "Title"= 'title', "Authors"='authors',"Publisher"="publisher",
               "Year"="year","Language Code"="language_code","#Reviews"="text_reviews_count")

names(TOpBooksdata )
nrow(TOpBooksdata )# count of rows in thee df
#Gives uniques number of rows in each variable of books df
sapply(TOpBooksdata , function(x) length(unique(x)))
 
#Get the top 50 Title by reviews
  
TOpBooksdata  <- TOpBooksdata [1:50,]

#Display the title and #review..to validate the data 
TOpBooksdata [,c("Title","#Reviews")]

#Initialising the new variable using he data variable
#Top10BooksByReview <- data
Top10BooksByNbrOfReviews <- TOpBooksdata 
#Check the field names 
names(Top10BooksByNbrOfReviews)
head(Top10BooksByNbrOfReviews)
#Gives datatypes of the variable in the dataframe
str(Top10BooksByNbrOfReviews)
#Checking the data in the variables
Top10BooksByNbrOfReviews[,c(1,3)]
#Write the table into a folder
write.csv(Top10BooksByNbrOfReviews , './data/Top10BooksByNbrOfReviews.csv')
###########################################################################

#Load the data first
Author_books <- read.csv(file ="./data/books_final.csv")
#Top 10 Authors by avg_reviews

 graphics.off()
#Sorting by average rating in desc order
Author_books <- Author_books[with(Author_books, order(-average_rating)),]
#geting the top ten records
Author_books_1  <- Author_books[1:10,]
#Geting the column names
names(Author_books_1)

#Checking rhe data inn the 2 fileds 
Author_books_1[ ,c("authors" ,"average_rating")]
#Just the frequency
# p <-ggplot(Author_books_1, aes( x =  authors ,y=average_rating))
# p +geom_bar(stat = "identity")+theme(axis.text.x = element_text(angle = 45, hjust = 1))+labs(x="Author", y = "Average Rating")+coord_flip()
#By mean of rating

p <-ggplot(Author_books_1, aes(x=authors,y=factor(average_rating) )) +theme(axis.text.x = element_text(angle = 45, hjust = 1))+ stat_summary(fun.y="mean", geom="bar")
p+labs(x="Author Names", y = "Average Rating")


################Books published by language code#########

pLanguage <-ggplot(Author_books, aes( x =  reorder(language_code,-average_rating) ,y=average_rating))
pLanguage +geom_bar(stat = "identity")+theme(axis.text.x = element_text(angle = 45, hjust = 1))+labs(x="Language Codes", y = " Nbr of books") 


#######################################Books by year,commneting out Alex's code***
BooksByYear <-ggplot(books, aes(year,  year))
BooksByYear +geom_bar(stat = "identity")+theme(axis.text.x = element_text(angle = 45, hjust = 1))+labs(x="Year", y = "#Books")