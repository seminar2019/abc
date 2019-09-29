library(VennDiagram)
library(shiny)

ui <- navbarPage(title = "文氏圖",
                 tabPanel("2集合",
              
                            sidebarPanel(
                              numericInput("A1", label = h4("A集合人數"), value = 28,min=0,step=1),
                              numericInput("B1", label = h4("B集合人數"), value = 20,min=0,step=1),
                              numericInput("C1", label = h4("同時符合A & B集合人數"), value = 10,min=0,step=1)
     
      ),
    mainPanel(
      h4("Venn Diagram"),
      plotOutput("plot1")

    )) ,
                tabPanel("3集合",
                         sidebarLayout(
                           sidebarPanel(
                             numericInput("A2", label = h4("A集合人數"), value = 22,min=0,step=1),
                             numericInput("B2", label = h4("B集合人數"), value = 20,min=0,step=1),
                             numericInput("C2", label = h4("C集合人數"), value = 13,min=0,step=1),
                             numericInput("AB", label = h4("A^B集合人數"), value = 11,min=0,step=1),
                             numericInput("BC", label = h4("B^C集合人數"), value = 4,min=0,step=1),
                             numericInput("CA", label = h4("A^C集合人數"), value = 5,min=0,step=1),
                             numericInput("ABC", label = h4("A^B^C集合人數"), value = 1,min=0,step=1)
               ),
               mainPanel(
                 h4("Venn Diagram"),
                 plotOutput("plot2")
                 
               )))
)

server <- function(input, output) {

  
  output$plot1 <- renderPlot({
  grid.newpage()
  draw.pairwise.venn(input$A1, input$B1, input$C1, category = c("A", "B"), 
                     lty = rep("blank",2), 
                     fill = c("light blue", "pink"), 
                     alpha = rep(0.5, 2), cat.pos = c(0,0),
                     cat.dist = rep(0.025, 2))
    
  })
  
  output$plot2 <- renderPlot({
    grid.newpage()
    draw.triple.venn(area1 = input$A2, area2 = input$B2 , area3 = input$C2 , n12 = input$AB, n23 = input$BC, 
                     n13 = input$CA ,n123 = input$ABC , category = c("A", "B", "C"), lty = "blank", 
                     fill = c("skyblue", "pink1", "mediumorchid"))
    
  })
  
  
  
}
shinyApp(ui = ui, server = server)

