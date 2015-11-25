library(shiny)


shinyUI(fluidPage(
  titlePanel("Uploading Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv'
                )
      ),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separateur',
                   c(Virgule=',',
                     Point_virgule=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"'),
      tags$hr(),
      p('Vous pouvez charger votre ficher CSV grace à :'),
      img(src="geolab_small.png", height = 42, width = 210),
      tags$hr(),
      h3("Téléchargement"),
      p('Une fois le fichier chargé, vous pouvez télécharger les deux fichiers suivant :'),
      actionButton("dl.noeuds", label = "Noeuds.csv"),
      actionButton("dl.liens", label = "Liens.csv")
    ),
    mainPanel(
      tableOutput('contents')
    )
  )
))
