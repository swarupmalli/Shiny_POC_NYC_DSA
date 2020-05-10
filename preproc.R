library(dplyr)
library(ggplot2)
 
 #Importing my books data set
#books<- read.csv(file ="./data/books_new.csv")
books<- read.csv(file ="./data/books_new.csv", sep = ";")
 
 
# 2. Convert the publication_date column from character to date
books = books %>%
   mutate(publication_date=as.Date(publication_date, '%m/%d/%Y')) %>% 
   mutate(year=substr(publication_date, 1,4))

write.csv(books, './data/books_final.csv')
 
unique(books$year)
names(books)

#Selecting a subset of columns to build a table from books
data = books <-books %>% select(title,authors,publisher,year,language_code,text_reviews_count)
data=data<-data %>% mutate(books$text_reviews_count)  

head(data)
#Now sort the data by user reviews in descending order
#Sorting and slcing using  dplyr
  
   
 
#using R
data <- books [with(books, order(-text_reviews_count)),]
data[ , c("title", "text_reviews_count")]   
#Check the filed names 
names(data)

#Renaming the fields 
data <- rename(data, "Title"= 'title', "Authors"='authors',"Publisher"="publisher",
               "Year"="year","Language Code"="language_code","#Reviews"="text_reviews_count")

names(data)
#Get the top 10 Title by reviews
  
data <- data[1:10,]

#Display the title and #review..to validate the data 
data[,c("Title","#Reviews")]

#Initialising the new variable using he data variable
Top10BooksByReview <- data
#Check the field names 
names(Top10BooksByReview)
head(Top10BooksByReview )
#Gives datatypes of the variable in the dataframe
str(Top10BooksByReview)
#Checking the data in the variables
Top10BooksByReview[,c(1,3)]
#Write the table into a folder
write.csv(Top10BooksByReview , './data/Top10BooksByReview.csv')
