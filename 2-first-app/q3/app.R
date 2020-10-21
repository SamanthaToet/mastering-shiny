library(shiny)

ui <- fluidPage(
    titlePanel("Q3 - multiply x by y"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("x",
                        "If x is",
                        min = 1,
                        max = 50,
                        value = 30),
            sliderInput("y",
                        "and y is", 
                        min = 1, 
                        max = 50,
                        value = 5),
        ),
        mainPanel(
            textOutput("product")
        )
    )
)

server <- function(input, output) {
    
    output$product <- renderText({
        x <- input$x
        y <- input$y
        glue::glue("then, x times y is ", x * y)
    })
}

shinyApp(ui = ui, server = server)
