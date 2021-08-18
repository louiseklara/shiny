if(!require(shinycssloaders))
  install.packages("shinythemes", repos = "https://cran.asia/")
if (!require(V8))
  install.packages("V8", repos = "https://cran.asia/")
if (!require(shinyalert)) install.packages("shinyalert")
if (!require(shiny)) install.packages("shiny")
if (!require(shinythemes)) install.packages("shinythemes")
if (!require(shinyWidgets)) install.packages("shinyWidgets")
if (!require(shinyjs)) install.packages("shinyjs")
if (!require(plotly)) install.packages("plotly")
if (!require(leafgl)) install.packages("leafgl")
if (!require(data.table)) install.packages("data.table")
if (!require(shinydashboard)) install.packages("shinydashboard")
if (!require(flexdashboard)) install.packages("flexdashboard")
if (!require(htmlwidgets)) install.packages("htmlwidgets")
if (!require(networkD3)) install.packages("networkD3")

library(shiny)
library(shinyalert)
library(shinythemes)
library(shinyWidgets)
library(shinyjs)
library(plotly)
library(data.table)
library(leafgl)
library(shinycssloaders)
library(shinydashboard)
library(flexdashboard)
library(htmlwidgets)
library(networkD3)


header = dashboardHeader(disable = TRUE)
sidebar = dashboardSidebar(disable = TRUE)
body = dashboardBody(
  # use JS
  useShinyjs(),
  
  
  # use shinyalert
  useShinyalert(),
  
  setBackgroundColor(color = "#FFFFFF", shinydashboard = FALSE),
  setBackgroundColor(color = "#FFFFFF", shinydashboard = TRUE),
  
  # custom tags
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  
  ### TOP ROW 
  
  fluidRow(class = "top-row",
               
               column(width=12,
                      "Dashboard",class= "logoTitle_style",
                         
               windowTitle = "Insights Dashboard")
  ),
  

 # tags$style(),
  
    fluidRow(
            width = 12,
            id='vicengtabset',
                                    
                                    fluidRow(
                                      column(
                                        class="plan-Title-bg",
                                        width = 12,
                                        div("Data Visualization", class="inner-footfall-tab",
                                            
                                        )
                                      )
                                      
                                    ),
                          hr(style="opacity:0"),
                            fluidRow(
                             # column(width=4),
                            column(
                              width = 12,
                              class="filtersubmit",
                              align = "center",
                              
                              
                              actionButton(
                                inputId = "viceng_filter_submit_button",
                                label = "View plots",
                                width = "40%"
                              ),
                              useSweetAlert() # needed with 'progressSweetAlert'
                            ),
                            #column(width=4)
                            ),
                            
                            hr(style="opacity:0"),
                             
                            
                            conditionalPanel(
                              condition = "input.viceng_filter_submit_button > 0",
                              br(),       
                            fluidRow(
                              column(width=4,
                                h1("Plot 1",
                                   style = {"font-size: 16px;   
                                  color: #000000; 
                                  font-weight: 800;
                                  background-color: none;
                                  text-align: center;
                                  padding-left: 50px;
                                     "})
                              ),
                              column(width=4,
                                     h1("Visualisera hur Soldprice beror på Livingarea med en lämplig figur",
                                        style = {"font-size: 16px;   
                                  color: #000000; 
                                  font-weight: 800;
                                  background-color: none;
                                  text-align: center;
                                  padding-left: 50px;
                                     "})
                              ),
                              column(width=4,
                                     h1("Visualisera en aspekt av data med ett histogram",
                                        style = {"font-size: 16px;   
                                  color: #000000; 
                                  font-weight: 800;
                                  background-color: none;
                                  text-align: center;
                                  padding-left: 50px;
                                     "})
                              )
                            ),
                            
                            fluidRow(
                              column(
                                width=4,
                                withSpinner(plotOutput(
                                  outputId = "plot1",
                                  height = "370px", width = "30vw", 
                                ), type = "1")
                              ),
                              column(
                                width=4,
                                withSpinner(plotOutput(
                                  outputId = "plot2",
                                  height = "370px", width = "30vw", 
                                ), type = "1")
                              ),
                              column(
                                width=4,
                                withSpinner(plotOutput(
                                  outputId = "plot3",
                                  height = "370px", width = "30vw", 
                                ), type = "1")
                              )
                              
                            )),
                            
                            hr()
                                    
                                  ),
                                  
                                )
                              
                          
                          
                      

dashboardPage(header, sidebar, body)

