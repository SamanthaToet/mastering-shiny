library(shiny)
library(ggplot2)

datasets <- data(package = "ggplot2")$results[c(2, 4, 10), "Item"]

ui <- fluidPage(
    selectInput("dataset", "Dataset", choices = datasets),
    verbatimTextOutput("summary"),
    plotOutput("plot")   #wrong output function
)

server <- function(input, output, session) {
    dataset <- reactive({
        get(input$dataset, "package:ggplot2")
    })
    output$summary <- renderPrint({    #typo
        summary(dataset())
    })
    output$plot <- renderPlot({
        plot(input$dataset) # weird plot() stuff
        res = 96
    })
}

shinyApp(ui = ui, server = server)
