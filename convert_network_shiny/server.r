library(shiny)

# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)

source(file = "my_melt_function.R")

shinyServer(function(input, output) {
  datasetInput <- reactive({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    mydata <- read.csv(inFile$datapath, header = input$header,
                       sep = input$sep, quote = input$quote, na.strings=c("","NA"))
    print(mydata)
  })
  
  output$contents <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    idatasetInput()
    
  })
  
#   output$dl.noeuds <- downloadHandler(
#     mydata <- read.csv(inFile$datapath, header = input$header,
#                        sep = input$sep, quote = input$quote, na.strings=c("","NA"))
#     
#     mynodes <- noeuds.csv(mydata)
#     
#     filename = function() { paste(input$dataset, '.csv', sep='') },
#     content = function(file) {
#       write.csv(datasetInput(), file)
#     }
#   )
  
})


