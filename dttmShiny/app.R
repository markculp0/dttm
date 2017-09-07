#
# This is the DateTime Shiny web application. 
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(lubridate)

myTZ <- ""          # Current local computer TZ
timeVal <- ""       # For calculations, 1-24
myClockTime <- ""   # For display times, 1 - 12

# Data frame for U.S. times
df <- data.frame()


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
        textOutput("locHonoluTZ"),
        textOutput("locHonoluTime"),
        textOutput("locLosAngTZ"),
        textOutput("locLosAngTime"),
        tableOutput("table1"),
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
  
  # Get time value from slider function and display it
  my_tm<- reactive({
    timeVal <- input$sldTime
    if (timeVal > 12) {
      myClockTime <- timeVal - 12
      # Adjust for 12 noon
      if (myClockTime == 12) {paste("  ", myClockTime, ":00 am")
      } else { paste("  ", myClockTime, ":00 pm") }
    } else {
      myClockTime <- timeVal
      # Adjust for 12 midnight
      if (myClockTime == 12){paste("  ", myClockTime, ":00 pm")
      } else { paste("  ", myClockTime, ":00 am") }
    }
  })
  
  # Get and display Honolulu dttm
  honolu_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "Pacific/Honolulu")
    paste(format(dttm,"%Y-%m-%d %H:%M"))
  })
  
  # Get and display Los Angeles dttm
  losAng_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "America/Los_Angeles")
    paste(format(dttm,"%Y-%m-%d %H:%M"))
  })
  
  # Get and display Denver dttm
  denv_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "America/Denver")
    paste(format(dttm,"%Y-%m-%d %H:%M"))
  })
  
  # Get and display Chicago dttm
  chicago_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "America/Chicago")
    paste(format(dttm,"%Y-%m-%d %H:%M"))
  })
  
  # Get and display New York dttm
  newYork_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "America/New_York")
    paste(format(dttm,"%Y-%m-%d %H:%M"))
  })
  
  # Output to my local time (Side Panel)
  output$myTime = renderText({
    my_tm()
  })  
  
  # Output Honolulu local time zone (Main Panel)
  # output$locHonoluTZ <- renderText("Pacific/Honolulu")
    
  # Output to Honolulu local time (Main Panel)
  # output$locHonoluTime = renderText({
  #   honolu_dttm()
  # })
  
  # Output Los Angeles local time zone (Main Panel)
  # output$locLosAngTZ <- renderText("America/Los_Angeles")
  
  # Output to Los Angeles local time (Main Panel)
  #output$locLosAngTime = renderText({
  #  losAng_dttm()
  #})
  
  output$table1 <- renderTable({
    df[1,1] <- honolu_dttm()
    df[1,2] <- losAng_dttm()
    df[1,3] <- denv_dttm()
    df[1,4] <- chicago_dttm()
    df[1,5] <- newYork_dttm()
    names(df) <- c("Pacific/Honolulu","America/LosAng",
                   "America/Denver","America/Chicago",
                   "America/NewYrk")
    df
  })
  
  # Plot, maybe?
  output$distPlot <- renderPlot({
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

