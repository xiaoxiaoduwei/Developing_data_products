shinyUI(
  pageWithSidebar(
    headerPanel("score prediction"),
    sidebarPanel(
      numericInput('hours', 'hours', 5, min = 4, max = 20, step = 1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("prediction")
    )
  )
)
