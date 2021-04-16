#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui<- fluidPage(
    #Assign Dasbhoard title 
    titlePanel("COVID19 Analytics"),
    
    # Start:  the First Block
    # Sliderinput: select from the date between 01.20.2020 
    # and 01.04.2020
    sliderInput(inputId = "date", "Date:",
                min = as.Date("2020-01-20"), 
                max = as.Date("2020-04-01"), 
                value = as.Date("2020-03-01"), 
                width = "600px"),
    
    # plot leaflet object (map) 
    leafletOutput(outputId = "distPlot",
                  width = "700px", 
                  height = "300px"),
    #End:  the First Block
    
    #Start: the second Block
    sidebarLayout(
        
        #Sidebar Panel: the selected country, history and 
        #whether to plot daily new confirmed cases.
        sidebarPanel(
            selectInput("selectedcountry", 
                        h4("Country"), 
                        choices =list("China","US","United_Kingdom","Italy","France","Germany", "Spain"), 
                        selected = "US"),
            selectInput("selectedhistoricwindow", 
                        h4("History"), 
                        choices = list("the past 10 days", "the past 20 days"), 
                        selected = "the past 10 days"),
            checkboxInput("dailynew", 
                          "Daily new infected", 
                          value = TRUE),
            width = 3  
        ),
        
        #Main Panel: plot the selected values
        mainPanel (
            plotOutput(outputId = "Plotcountry", 
                       width = "500px", 
                       height = "300px")
        )
    ),
    #End: the second Block 
)
