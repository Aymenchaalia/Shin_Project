library(shiny)
library(shinythemes)
library(RODBC)
library(RODBCext)
library(DT)
library(markdown)
library(plotly)

#output$X<- merge (dataTableOutput("tabPO"),dataTableOutput("tabP"),dataTableOutput("tabPC"),by = mergeCols)

shinyUI(fluidPage(
  theme = shinytheme("united"),
  navbarPage("PseudoBase",
             tabPanel("Home"),
             tabPanel("Summary",plotOutput(outputId = "distPlot")),
             tabPanel("Statistics", tabsetPanel(tabPanel("GeneralData"),
                                             #sidebarLayout(sidebarPanel(),mainPanel(h2("Pie chart per organism")))),
                                             tabPanel("Physicochemical data"),
                                             tabPanel("Literature"))),
                      #sidebarLayout(sidebarPanel(),mainPanel(h2("*Pie chart per organism:")))),
             navbarMenu("Search",
                        tabPanel("Amp",tabsetPanel(
                          tabPanel("GeneralData", 
                                   DT::dataTableOutput("tabPA")),
                                   #DT::dataTableOutput("tabP"),
                                   #DT::dataTableOutput("tabPC")),
                                   
                          tabPanel("Physicochemical data",DT::dataTableOutput("tabPHAR")),
                          tabPanel("Literature",DT::dataTableOutput("tabPP")))),
                        tabPanel("EO"),
                        tabPanel("EO-ATB"),
                        tabPanel("EO-NP")),
             tabPanel("Blast")
             #<script>
               #$(document).ready(function(){
                 #$("#myInput").on("keyup", function() {
                   #var value = $(this).val().toLowerCase();
                   #$("#myTable tr").filter(function() {
                     #$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                   #});
                 #});
               #});
            # </script>         
             
  )
  
  
  
))
