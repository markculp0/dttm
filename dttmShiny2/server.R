#
# ========
# server.R
# ========
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

# Data frame for other country times
df2 <- data.frame()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  # Get my TZ
  myTZ <- Sys.timezone()
  
  output$myTzOut <- renderText(myTZ) 
  # Get time value from slider function and display it
  # Print my TZ
  my_tm<- reactive({
    timeVal <- input$sldTime
    if (timeVal > 12) {
      myClockTime <- timeVal - 12
      # Adjust for 12 noon
      if (myClockTime == 12) {paste("  ", myClockTime, ":00 AM")
      } else { paste("  ", myClockTime, ":00 PM") }
    } else {
      myClockTime <- timeVal
      # Adjust for 12 midnight
      if (myClockTime == 12){paste("  ", myClockTime, ":00 PM")
      } else { paste("  ", myClockTime, ":00 AM") }
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
    # paste(format(dttm,"%Y-%m-%d %H:%M"))
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
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
    #paste(format(dttm,"%Y-%m-%d %H:%M"))
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
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
    #paste(format(dttm,"%Y-%m-%d %H:%M"))
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
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
    #paste(format(dttm,"%Y-%m-%d %H:%M"))
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
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
    #paste(format(dttm,"%Y-%m-%d %H:%M"))
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
  })

  
  # Get and display London dttm
  mex_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "America/Mexico_City")
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
  })
  
  # Get and display London dttm
  saoPaulo_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "America/Sao_Paulo")
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
  })
  
  # Get and display London dttm
  london_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "Europe/London")
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
  })
    
  # Get and display India dttm
  india_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "Asia/Kolkata")
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
  })
  
  # Get and display China dttm
  shang_dttm <- reactive({
    # Adjust time for single digit hours
    if (input$sldTime > 9){
      tm <- paste(input$sldTime, "00", sep = "")
    } else {
      tm <- paste("0", input$sldTime, "00", sep = "")
    }
    dttm <- paste(input$meetDate, tm, sep = " ")
    dttm <- ymd_hm(dttm, tz = myTZ)
    dttm <- with_tz(dttm, tz = "Asia/Shanghai")
    paste(format(dttm,"%Y-%m-%d %I:%M %p"))
  })
  
  # Output to my local time (Side Panel)
  output$myTime = renderText({
    my_tm()
  })  
  
  # Output Table 1
  output$table1 <- renderTable({
    df[1,1] <- honolu_dttm()
    df[1,2] <- losAng_dttm()
    df[1,3] <- denv_dttm()
    df[1,4] <- chicago_dttm()
    df[1,5] <- newYork_dttm()
    names(df) <- c("Pacific/Honolulu","America/LosAngeles",
                   "America/Denver","America/Chicago",
                   "America/NewYork")
    df
  })
  
  # Output Table 2
  output$table2 <- renderTable({
    df2[1,1] <- mex_dttm()
    df2[1,2] <- saoPaulo_dttm()
    df2[1,3] <- london_dttm()
    df2[1,4] <- india_dttm()
    df2[1,5] <- shang_dttm()
    names(df2) <- c("America/Mexico_City","America/Sao_Paulo","Europe/London","Asia/Kolkata (India)","Asia/Shanghai")
    df2
  })
  
})  # shinyServer/function
