library(shiny)

# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)

source(file = "my_melt_function.R")

shinyServer(function(input, output) {
  # Reactivity to subset data ####
  geodatasetInput <- observe({
    
    inFile <- input$file1
    
    if (is.null(inFile)){
      return(NULL) 
    }else{
      mydata <- read.csv(inFile$datapath, header = input$header,
                         sep = input$sep, quote = input$quote, na.strings=c("","NA"))
      
      mynodes <- noeuds.csv(mydata)
      
    }
    
    # Execute selections on data upon button-press
    if(input$generateButton == 0) return()
    
    inp.BSL <- isolate(input$filter1)
    inp.loc <- isolate(input$filter2)
    if (inp.BSL=='' | inp.loc=='') return()
    
    # BSL switch
    selection <-switch(inp.BSL
                       , A = "A"
                       , B = "B"
    ) 
    # Location switch    
    selection2 <-switch(inp.loc
                        , C = "C"
                        , D = "D"
    )
    
    # subset based on selection
    Subgeodata <- subset(geodata, BSL == selection & Position.Location == selection2)
    
    # browser()
    # aggregate by postcode
    Subgeodata <- Subgeodata[1:2] #no longer need other columns
    AggSubGdata <- aggregate(. ~ Postcode, data=Subgeodata, FUN=sum)
    write.csv(AggSubGdata
              , file = "solution.csv"
              , row.names=F
    )
  })
  
  output$contents <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header = input$header,
                       sep = input$sep, quote = input$quote, na.strings=c("","NA"))
    
  })
  
  inFile <- input$file1
  
  if (is.null(inFile)){
    return(NULL) 
  }else{
    mydata.df <- read.csv(inFile$datapath, header = input$header,
                          sep = input$sep, quote = input$quote, na.strings=c("","NA"))
    

    
  }
  

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


