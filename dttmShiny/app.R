#
# This is the DateTime Shiny web application. 
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(lubridate)

# Define UI for application
ui <- fluidPage(
   
   # Application title
   titlePanel("DateTime"),
   
   # Sidebar with a slider input for number of hours 
   sidebarLayout(
      sidebarPanel(
         sliderInput("sldHrs",
                     "Hour:",
                     min = 1,
                     max = 24,
                     value = 12)
      ),
      
      # Show TZ info
      mainPanel(
        textOutput("myTzOut"),
        plotOutput("distPlot")
      )
   )
)

# Server logic 
server <- function(input, output) {
  
  myTZ <- Sys.timezone()
  
  # Print my TZ
  output$myTzOut <- renderText(myTZ) 
  
  # Plot, maybe?
  output$distPlot <- renderPlot({
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

