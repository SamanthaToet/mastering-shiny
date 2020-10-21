library(shiny)

ui <- fluidPage(
    titlePanel("Q2 - multiply x by 5"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("x",
                        "If x is",
                        min = 1,
                        max = 50,
                        value = 30)
        ),
        mainPanel(
           textOutput("product")
        )
    )
)

server <- function(input, output) {

    output$product <- renderText({
        x <- input$x * 5
        glue::glue("then x times 5 is ", x)
    })
}

shinyApp(ui = ui, server = server)
