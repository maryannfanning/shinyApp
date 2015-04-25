library(shiny)
library(UsingR)
library(datasets)
data(iris)

shinyServer(
    function(input, output) {
        output$newHist <- renderPlot({
            species <- input$IrisSpecies
            if(species == "All"){
                irisData <- iris
            }
            else{
                irisData <- iris[iris$Species == species,]
            }
            hist(irisData$Sepal.Length, xlab="Sepal Length", xlim = c(4, 8), ylim=c(0,35), col="dark blue", main="Iris Sepal Lengths", )
            mu <- input$mu
            speciesSummary <- summary(irisData$Sepal.Length)
            lines(c(mu, mu), c(0, 200), col="red", lwd=5)
            mse <- mean((irisData$Sepal.Length - mu)^2)
            text(7.5, 23, paste("Selected Species =", species))
            output$selectedSpecies <- renderPrint({species})
            output$predMu <- renderPrint({mu})
            output$MSE <- renderPrint({mse})
            output$summary <- renderPrint({speciesSummary})
        })
    }
)