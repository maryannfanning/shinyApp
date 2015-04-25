library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Explore the distribution of Sepal lengths for various Iris species"),
    sidebarPanel(
        sliderInput("mu", "Select a value", value = 6, min=4, max=8, step=0.005,),
        radioButtons("IrisSpecies", "Select Iris Species:",
                     c("All" = "All",
                       "Setosa" = "setosa",
                       "Versicolor" = "versicolor",
                       "Virginica" = "virginica")),
        h4("Species Summary"),
        verbatimTextOutput("summary")
    ),
    mainPanel(
        plotOutput("newHist"),
        h4("Selected Value"),
        verbatimTextOutput("predMu"),
        h4("Mean Squared Error"),
        verbatimTextOutput("MSE")
    )
))

