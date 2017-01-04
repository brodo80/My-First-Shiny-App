
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(h4("MTCars Dataset Exploration", align="center")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("var", "select the variable from the MTCars dataset", choices = c("mpg" = 1, "disp" = 2, "hp" = 3, "drat" = 4, "wt" = 5, "qsec" = 6)),
       br(),
      sliderInput("bins", "select the number of bins you want for the histogram", min = 5, max = 25, value = 15),
      br(),
      radioButtons("color", "select the color you would like for the bins", choices = c("green", "blue", "black", "yellow", "red"), selected = "red")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type="tab",
        tabPanel("Summary",verbatimTextOutput("summary")),
        tabPanel("Structure",verbatimTextOutput("structure")),
        tabPanel("Data", tableOutput("data")),
        tabPanel("Plot",plotOutput("myhist"))
                  )
    )
  )
))
