
library(shiny)


shinyServer(
  function(input, output) {
    
    output$predictionGraph <- renderPlot({
      
      periods <- c(1, 2, 3, 4, 5)
      
      incidents <- c({input$p1}, {input$p2}, {input$p3}, {input$p4}, {input$p5})
      
      dat <- data.frame(periods,incidents)
      
      # linear model
      
      fit <- lm(incidents ~ periods, data = dat)

      lBound <- length(periods) + 1
      
      uBound <- lBound + {input$periodsToPredict} - 1
      
      new.periods <- c(lBound : uBound)
      
      new.incidents <- predict(fit, newdata = data.frame(periods = new.periods))
      
      plot(x = c(periods, new.periods), y = c(incidents, new.incidents),
           
           ylim=c(0, 30), col="blue", pch=19, xlab="weeks", ylab="beverages")
      
      title("Predict number of beverages to buy based on previous weeks purchasing history")
      
      
      lines(c(periods, new.periods), c(incidents, new.incidents), col="blue", lwd=2)
      
      
      points(x = new.periods, y = new.incidents, pch=19, col="red", cex = 2)
      
      
      output$prediction <- renderPrint({new.incidents})
      
    })
    
  }
  
)
