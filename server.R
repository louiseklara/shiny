if (!require(tidyverse)) install.packages("tidyverse")
if (!require(sf)) install.packages("sf")
if (!require(lubridate)) install.packages("lubridate")
if (!require(leaflet.extras)) install.packages("leaflet.extras")
if (!require(RPresto)) install.packages("RPresto")
if (!require(jsonify)) install.packages("jsonify")
if (!require(DBI)) install.packages("DBI")
if (!require(glue)) install.packages("glue")
if (!require(UpSetR)) install.packages("UpSetR")
if (!require(scales)) install.packages("scales")

if (!require(DT)) install.packages("DT")
if (!require(viridis)) install.packages("viridis")
if (!require(hrbrthemes)) install.packages("hrbrthemes")
if (!require(ggpubr)) install.packages("ggpubr")
if (!require(gridExtra)) install.packages("gridExtra")
if (!require(networkD3)) install.packages("patchwork")
if (!require(htmlwidgets)) install.packages("htmlwidgets")
if (!require(ggplot2)) install.packages("ggplot2")

library(tidyverse)
library(sf)
library(shiny)
library(shinyalert)
library(lubridate)
library(leaflet)
library(leaflet.extras)
library(leafgl)
library(RPresto)
library(jsonify)
library(DBI)
library(glue)
library(plotly)
library(scales)
library(DT)
library(flexdashboard)
library(UpSetR)
library(viridis)
library(hrbrthemes)
library(ggpubr)
library(gridExtra)

library(networkD3)
library(htmlwidgets)

library(patchwork)
library(htmlwidgets)
library(shinythemes)

library(ggplot2)

# options(viewer = NULL) # use browser
mapbox_token <-
  "pk.eyJ1IjoiaG9uZ2ppZS1jaGFuZy1kcyIsImEiOiJjazNkM2hjaGIxNHY1M2RydGhzcDZuMmh0In0.AYajJ7rlfL1zqrwWlYkwAA"
tile_url <-
  "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token="


#Tab3b_Ethnicity_df   = read.csv(ethnicity_path, stringsAsFactors = FALSE)

# Define server logic required to fuel the visualisations and interactivity
server <- function(input, output, session) {
  # set universal theme
  old_theme <-
    theme_set(
      theme_minimal(base_size = 16, base_family = "") +
        theme(
          axis.title = element_text(colour = "grey10"),
          panel.grid.major = element_line(colour = "#E8E8E8"),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank()
        )
    ) # save the default theme as old_theme, set custom minimal theme for all plots
  

  # ffvol <- reactiveValues(
  #   df = NULL
  # )
 
  ####### Plot 1:
  booli <- read.csv("Booli_sold.csv", stringsAsFactors = FALSE, encoding = "UTF-8")
  booli$rooms <- as.factor(booli$rooms)
  
  output$plot1 <- renderPlot({
    
    plot<-ggplot(booli, aes(x = rooms)) +
      theme_bw() +
      geom_bar() +
      labs(y = "count")
    title = "Rooms"
    
    plot
  })
  
 ######### Plot 2:
  
  output$plot2 <- renderPlot({
    
    plot<-ggplot(booli) +
      geom_line(aes(x = livingArea, y = soldPrice)) +
      geom_point(aes(x = livingArea, y = soldPrice), col = 'pink')
    geom_smooth(method="loess")
    
    plot
  })

  ########## Plot 3:
  Frosted <-readxl::read_xlsx("Chocolate Frosted Sugar Bombs.xlsx")
  
  output$plot3 <- renderPlot({
    
    plot<-curve(dnorm(x, mean = 20.4, sd = 0.1998743), xlim = c(18.5, 21.5))
    abline(h = 0)
    sequence <- seq(0, 20, 0.1)
    polygon(x = c(sequence,20,0),
            y = c(dnorm(c(sequence),20.4,0.1998743),0,0),
            col = "green")
    pnorm(q = 20, mean = 20.4, sd = 0.1998743, lower.tail = TRUE)
    
    plot
  })
  
}





