

mpg_pre<- function(hours) hours*5

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$hours})
    output$prediction <- renderPrint({mpg_pre(input$hours)})
  }
)

