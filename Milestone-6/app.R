ui <- fluidPage(
    
    # App title ----
    titlePanel("Milestone 6!"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Slider for the number of bins ----
            sliderInput(inputId = "bins",
                        label = "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Histogram ----
            plotOutput(outputId = "distPlot")
            
        )
    )
)

server <- function(input, output) {
    
  
    output$distPlot <- renderPlot({
        
        x    <- faithful$waiting
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = "#75AADB", border = "purple",
             xlab = "Waiting time to next eruption (in mins)",
             main = "Histogram of waiting times")
        
    })
    
}

shinyApp(ui = ui, server = server)

