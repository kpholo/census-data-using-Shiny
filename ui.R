# Import libraries
library(shiny)
library(tidyverse)

country = c("United-States", "Canada", "Mexico", "Germany", "Philippines")

# Application Layout
shinyUI(fluidPage(
  br(),
  # TASK 1: Application title
  titlePanel("Trends in Demographics and Income"), br(),
  h5("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demographic information."), br(),
  
  fluidRow( column(width = 12),
            wellPanel(
              selectInput("country", "Select a country:", country, selected = "Canada")
            )
  ),
  fluidRow(
    column(width = 3,
           h5("Select a continuous variable and graph type(histogram or boxplot) to view on the right"),
           radioButtons("continuous_variable", "Continuous", 
                        choices=c("age", "hours_per_week"), selected="age"),
           radioButtons("graph_type", "Select desired graph",
                        choices=c("histogram", "boxplot"), selected="histogram")),
    column(width=9,
           plotOutput("p1"))
  ),
  fluidRow(
    column(width=3,
           h5("Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph"),
           radioButtons("categorical_variable", "Select variable",
                        choices = c("education", "workclass", "age"),
                        selected = "age"),
           checkboxInput("is_stacked", "Stacked Plots", value=FALSE)),
    column(width=9,
           plotOutput("p2"))
  )
  
))
