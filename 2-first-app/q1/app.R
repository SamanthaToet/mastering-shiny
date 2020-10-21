library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Q1 - greet users by name"),

    # Sidebar with a text input for name
    sidebarLayout(
        sidebarPanel(
            textInput("name", "What's your name?")
        ),

        # Show the name and phrase
        mainPanel(
           textOutput("greeting")
        )
    )
)

# Define server logic to print name
server <- function(input, output) {

    output$greeting <- renderText({
        paste0("Hello ", input$name)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
