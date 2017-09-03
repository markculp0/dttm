#
# This is the DateTime Shiny web application. 
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(lubridate)


timeVal <- ""

# Define UI for application
ui <- fluidPage(
   
   # Application title
   titlePanel("DateTime"),
   
   # Sidebar with a slider input for number of hours 
   sidebarLayout(
      sidebarPanel(
        
        # Side Bar GUI
        textOutput("myTzOut"),
        dateInput("meetDate", "Meeting Date: ", width = "100px"),
        p(strong('Meeting Time: ')),
        textOutput("myTime"),
        br(""),
        sliderInput("sldTime",
                     "Hour slider:",
                     min = 1,
                     max = 24,
                     value = 12)
         ),
      
      # Main Panel GUI
      mainPanel(
        
        textOutput("yourTime"),
        plotOutput("distPlot")
      )
   )
)

# Server logic 
server <- function(input, output) {
  
  # Get my TZ
  myTZ <- Sys.timezone()
  
  # Print my TZ
  output$myTzOut <- renderText(myTZ) 
  
  # Get time value from slider function
  mydttm<- reactive({
    timeVal <- input$sldTime
    timeVal <- paste(timeVal, ":00")
  })
  
  # Output to my local time (Side Panel)
  output$myTime = renderText({
    mydttm()
  })  
  
  # Output to other local time (Main Panel)
  output$yourTime = renderText({
    mydttm()
  })
  
  
  # Plot, maybe?
  output$distPlot <- renderPlot({
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

