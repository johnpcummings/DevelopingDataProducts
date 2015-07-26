library(shiny) 
numericInputRow<-function (inputId, label, value = "") 
  
  shinyUI(fluidPage( 
    titlePanel("Body Mass Index Calculator"),
    sidebarLayout( 
      sidebarPanel( 
        helpText(h4("This application calculates body mass index", 
                 "based on your height and weight.",
                 "Please insert your",
                    "weight in pounds,",
                    "height in feet and inches,",
                    "gender, and waist size.",
                 "Click the 'Update BMI Calculation' button",
                 "and check the Results table for your information.")),             
        tags$head(
          tags$style(type="text/css", "select { max-width: 500px; }"),
          tags$style(type="text/css", ".span4 { max-width: 500px; }"),
          tags$style(type="text/css",  ".well { max-width: 500px; }")
        ),
        br(),
        br(),
        br(),
        div(id="xweight",numericInput(inputId="weight", label="Weight (lbs)  ", min = 90, max = 650, value = 100)),
        tags$head(tags$style(type="text/css", "#weight {display: inline-block}")),
        tags$head(tags$style(type="text/css", "#weight {max-width: 70px}")),
        br(),    
        div(id="xfeet",numericInput(inputId="feet", label="Height (ft)  ", min = 4, max = 7, value = 5)),
        tags$head(tags$style(type="text/css", "#feet {display: inline-block}")),
        tags$head(tags$style(type="text/css", "#feet {max-width: 70px}")),
        
        div(id="Xinches",numericInput(inputId="inches", label="Height (in)", min = 0, max = 11, value = 6)),
        tags$head(tags$style(type="text/css", "#inches {display: inline-block}")),
        tags$head(tags$style(type="text/css", "#inches {max-width: 70px}")),
        br(),
        radioButtons("gender", 
                     label = h4("Select Gender"), 
                     choices = list("Male" = "Male", 
                                    "Female" = "Female"), 
                     selected = "Male"),  
        br(),             
        sliderInput("waistsize", 
                    label = h4("Choose your waist size"), 
                    min = 20, max = 60, value = 35), 
        br(), 
        br(),             
        actionButton("action_Calc", label = "Update BMI Calculation")         
        ), 
      mainPanel( 
        tabsetPanel( 
          tabPanel("BMI Display", 
                   (h3("Results")), 
                   div(tableOutput("values"), style = "font-size 120%"),
                   (h3("Please refer to Documentation Tab 
                       for Results Explanation"))
          ), 
          tabPanel("Documentation", 
                   (h3("Body Mass Index Calculator")), 
                   br(), 
                   HTML("<u><b>Calculation of individual Body Mass Index
                        based on height and weight</b></u>
                        <br> <br> 
                        <u><b>Equation: </b></u> 
                        <br> <br> 
                        <b> Body Mass Index (BMI) = [Weight / (height^2)] * 703 </b> 
                        <br> <br>
                        <u><b> BMI Information:</b></u>
                        <br> <br> 
                        <ul>
                        <li>If your BMI is less than 18.5, it falls within the underweight range.</li>
                        <li>If your BMI is 18.5 to 24.9, it falls within the normal or Healthy Weight range.</li>
                        <li>If your BMI is 25.0 to 29.9, it falls within the overweight range.</li>
                        <li>If your BMI is 30.0 or higher, it falls within the obese range.</li>
                        </ul>
                        <br> <br>
                        Weight that is higher than what is considered as a healthy weight for a given height 
                        is described as overweight or obese. Weight that is lower than what is considered as 
                        healthy for a given height is described as underweight. </b>
                        <br> <br>
                        <u><b> Waist Circumference information:</b></u>
                        <br> <br>
                        Another way to estimate your potential disease risk is to measure your waist 
                        circumference. Excessive abdominal fat may be serious because it places you at 
                        greater risk for developing obesity-related conditions, such as Type 2 Diabetes, 
                        high blood pressure, and coronary artery disease. Your waistline may be telling 
                        you that you have a higher risk of developing obesity-related conditions if you are:
                        <br> <br> 
                        <ul>
                        <li>A man whose waist circumference is more than 40 inches.</li>
                        <li>A non-pregnant woman whose waist circumference is more than 35 inches.</li>
                        </ul>
                        <footer> <p>Information obtainted from the Centers for Disease Control (CDC): 
                        <a href=<q>http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html</q></a>
                        </p></footer>
                        ")                 
       ) 
     ) 
  ))
))