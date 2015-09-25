library(shiny)

shinyUI(
  pageWithSidebar(
    
    headerPanel("Predict number of beverages to buy"),
    
    sidebarPanel(
      
      sliderInput('periodsToPredict', label=h4('Number of weeks to predict'),
                  
                  2, min=1, max=5, step=1),
      
      submitButton('Submit'),
      
      h4('Number of beverages bought in previous weeks'),
      
      numericInput('p5', 'Period p-1 (most recent)', 2, step = 1),
      
      numericInput('p4', 'Period p-2', 5, step = 1),
      
      numericInput('p3', 'Period p-3', 4, step = 1),
      
      numericInput('p2', 'Period p-4', 7, step = 1),
      
      numericInput('p1', 'Period p-5', 3, step = 1)
      
    ),
    
    mainPanel(
      
      p('This program predicts number of beverages to buy based on previous weeks purchasing history. 

          The number of beverages bought in previous weeks are
        
        in the left panel. And we used linear model to predict'),
 
      
      h3('Results of prediction'),
      
      
      p('Predicted number of beverages to buy for next weeks:'),
      
      
      verbatimTextOutput("prediction"),
  
      
      h3('Graphical display'),
      
      
      p('The graph below shows the previous purchasing history(blue) and prediction for next weeks (red).'),
      
      
      plotOutput('predictionGraph')
      
      
      )
    
    
      )
  
    )

