# Program: UI file of Shiny project to pull stock tickers from Yahoo Finance
# Author: Rodrigo Alvarez     
# Date: July 2016

library(shiny)
library(dygraphs)

shinyUI(pageWithSidebar(
  headerPanel("A Simple Comparison of Tech Stocks"),
  sidebarPanel(
      h3("Select stocks to compare!"),
      br(),
      textInput(inputId="stock1", label = "Pick a first stock:", value = "AMZN"),
      textInput(inputId="stock2", label = "Pick a second stock:", value = "MSFT"),
      
      dateRangeInput("dateRange", "Please input a date range between 1/2/2008 and 11/20/2015.",
                     start = "2015-01-02",
                     end = "2015-11-20",
                     min = "2008-01-02",
                     max = "2015-11-20"),
      br(),
      strong("The fine print / detailed instructions:"),
      br(),
      p("1) Any ticker in Yahoo Finance should work, but this app was tested
         using MSFT, AMZN, AAPL, and GSPC (S&P 500)"),
      p("2) The date range you input will immediately download the appropriate data from Yahoo Finance."),
      br(),
      strong("How to interpret the output:"),
      p("1) You should see two charts, one with stock prices and the other with weekly rates of return"),
      p("2) Note the colors of each stock are matched, so if MSFT is in blue in the top chart
        it will be in blue on the bottom chart as well"),
      p("3) You can zoom in on either chart interactively using the slider below the chart,
         or by clicking on either chart and dragging and dragging horizontally to select
         a time frame. Either action is instantaneous as it does not download any additional data"),
      p("4) Have fun!")

  ),
  mainPanel(
      dygraphOutput("dygraph_price"),
      br(),
      br(),
      dygraphOutput("dygraph_corr")
  )
))