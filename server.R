
library(shiny)
mydata <- mtcars[,c(1,3:7)]
# Define server logic required to draw a histogram
shinyServer(
  
  function(input, output) {
    
    output$data <- renderTable({
      mydata
      
    })
    
    
    output$summary <- renderPrint({
      
      summary(mydata)
      
    })
    
    output$structure <- renderPrint({
      
       str(mydata)
    })
    
   output$myhist <- renderPlot({
     colm <- as.numeric(input$var)
     hist(mydata[,colm],breaks = seq(0,max(mydata[,colm]), l=input$bins+1),col = input$color,main = "Histogram of MTCars Variable",xlab = names(mydata[colm]))
   })
