library(shiny)

# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
# options(shiny.maxRequestSize = 9*1024^2)

source("my_melt_function.R")



##partie shiny
shinyServer(function(input, output) {
  
  ## lecture des donnees
  Dataset <- reactive({
    if (is.null(input$file)) {
      # l'utilisateur na pas encore charger les donnees
      return(data.frame())
    }
    Dataset<-as.data.frame(read.csv(input$file$datapath, header=input$entete, sep=input$sep, 
                                    quote=input$quote) )
    return(Dataset)
  })
  
  
  
  output$tableau <- renderTable({return(Dataset()) })
  
  tableau2<-reactive({
    if(is.null(input$file)){
      return(NULL)
    }
    else
    {return(isolate(noeuds.csv(Dataset())))}
  })
  
  tableau3<-reactive({
    if(is.null(input$file)){
      return(NULL)
    }
    else
    {return(isolate(liens.csv(Dataset())))}
  })
  
  
  #download des donnees  
  output$noeuds<-downloadHandler(
    filename = function() { 
      as.character(input$file)
    },
    content = function(file) {
      write.csv(tableau2(), file)})
  
  output$dl.liens<-downloadHandler(
    filename = paste("liens.csv"),
    content = function(file) {
      write.csv(tableau3(), file)})
})


