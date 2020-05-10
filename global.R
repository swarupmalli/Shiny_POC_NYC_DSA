# Load ALL packages once here
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(DT)

# Load data once here
books <- read.csv(file ="./data/books_final.csv")

#load the top 10 titles file..May 9 2020
Top10Title <- read.csv(file ="./data/Top10BooksByReview.csv")



# This function can be used in server or ui
sample_function = function(x){
  return(x^2)
}