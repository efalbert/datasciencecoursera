

library(shiny)
shinyUI(fluidPage(
  titlePanel("mtcars Miles per gallon Data"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Frequency Ranges",
                  min = 5,
                  max = 50,
                  value = 12),
      checkboxInput("showmeanstd", 'Show/hide the mean value', value = TRUE),
      sliderInput("sliderMPG",
                  "Miles per Gallon per frequency",
                  min = 5,
                  max = 50,
                  value = 20),
      checkboxInput("showmodel", 'Show Linear Model', value = TRUE)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot",
                 fluidRow(
                   column(8, plotOutput("histPlot")),
                   column(8,  h3("Horsepower Prediction"), textOutput("pred")),
                   column(8, plotOutput("lmplot"))
                 ))
      ))
  )
))
