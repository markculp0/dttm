#
# ======
#  ui.R
# ======
# This is the DateTime Shiny web application based on
# Garrett Grolemund's lubridate package.
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  # Application title
  titlePanel("DateTime"),
  
  # Sidebar with a slider input for number of hours 
  sidebarLayout(
    sidebarPanel(
      
      # Side Bar GUI
      textOutput("myTzOut"),
      dateInput("meetDate", "Meeting Date: ", width = "100px"),
      p(strong('Meeting Time: ')),
      h3(textOutput("myTime")),
      br(""),
      sliderInput("sldTime",
                  "Hour slider:",
                  min = 1,
                  max = 24,
                  value = 12)
    ), # end sidebarPanel()
    
    # Main Panel GUI
    mainPanel(
      textOutput("locHonoluTZ"),
      textOutput("locHonoluTime"),
      textOutput("locLosAngTZ"),
      textOutput("locLosAngTime"),
      h3("US Date-Times"),
      tableOutput("table1"),
      h3("Non-US Date-Times"),
      tableOutput("table2"),
      plotOutput("distPlot")
    )  # end mainPanel
  )  # sidebarLayout
))  # end shinyUI/fluidPage()
