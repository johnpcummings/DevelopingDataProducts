library(shiny)

# Define server logic for slider examples
shinyServer(function(input, output) {
  
  # reactive expression to Calculate the height  
  h <- reactiveValues() 
  observe({ 
    input$action_Calc
    h$calc <- isolate({ 
      (input$feet * 12)
    }) 
    h$height <- h$calc + input$inches
  }) 
  
  # reactive expression to Calculate the body mass index  
  dat <- reactiveValues() 
  observe({ 
    input$action_Calc 
    dat$calc <- isolate({ 
      (input$weight / (h$height^2))
    }) 
    dat$bmi <- round(dat$calc * 703, digits=2)
  }) 
  
  # Reactive expression to compose a data frame of the values
  Values <- reactive({
    
    # output data frame
    data.frame(
      Measure = c("Weight", 
                  "Height (feet)",
                  "Height (inches)",
                  "Gender",
                  "Waist size",
                  "Calculated BMI"),
      Value = as.character(c(input$weight, 
                             input$feet,
                             input$inches,
                             input$gender,
                             input$waistsize,
                             dat$bmi)),
      stringsAsFactors=FALSE)
  }) 
  # Show the values in table format
  output$values <- renderTable({
    Values()
  })
})