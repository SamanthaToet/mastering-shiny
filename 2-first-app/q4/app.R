library(shiny)

ui <- fluidPage(
    titlePanel("Q4 - reduce duplication"),
    sliderInput("x", "If x is", min = 1, max = 50, value = 30),
    sliderInput("y", "and y is", min = 1, max = 50, value = 5),
    textOutput("product")
)

server <- function(input, output, session) {
    output$product <- renderText({ 
        x <- input$x
        y <- input$y
        glue::glue("then, (x * y) is ", x * y,
                   
                   " and, (x * y) + 5 is ", x * y + 5, 
                   
                   " and (x * y) + 10 is ", x * y + 10)
    })
}

shinyApp(ui = ui, server = server)
