# Load ALL packages once here
library(shiny)
library(dplyr)
library(ggplot2)
#library(plotly)
library(DT)
library(shinythemes)

 #Importing my books data set
#books<- read.csv(file ="./data/books_new.csv")
booksDataPrep<- read.csv(file ="./data/books_new.csv", sep = ";")


# 2. Convert the publication_date column from character to date
booksDataPrep = booksDataPrep %>%
   mutate(publication_date=as.Date(publication_date, '%m/%d/%Y')) %>%
   mutate(year=substr(publication_date, 1,4))

write.csv(booksDataPrep, './data/books_final.csv')
# Load data once here
books <- read.csv(file ="./data/books_final.csv")

#load the top 10 titles file..May 9 2020
Top10Title <- read.csv(file ="./data/Top10BooksByNbrOfReviews.csv")


#Load the data first
Author_books <- read.csv(file ="./data/books_final.csv")
#Top 10 Authors by avg_reviews

#graphics.off()
#Sorting by average rating in desc order
Author_books <- Author_books[with(Author_books, order(-average_rating)),]

#geting the top 30 auhtors by avg user rating
Author_books_1  <- Author_books[1:30,]
#Geting the column names
names(Author_books_1)

#Checking rhe data inn the 2 fileds 
Author_books_1[ ,c("authors" ,"average_rating")]

#Books by year


# This function can be used in server or ui
sample_function = function(x){
  return(x^2)
}