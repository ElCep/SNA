library(shiny)

library(shiny)

shinyUI(navbarPage("Traitement des données du cour de M2",
                   tabPanel("Traitement",
                            sidebarLayout(
                              sidebarPanel(
                                fileInput('file', 'Choisir un fichier CSV',
                                          accept=c('text/csv', 
                                                   'text/comma-separated-values,text/plain', 
                                                   '.csv')),
                                tags$hr(),
                                checkboxInput('entete', 'Entete', TRUE),
                                radioButtons('sep', 'Séparateur',
                                             c(Virgule=',',
                                               'Point virgule'=';',
                                               Tabulation='\t'),
                                             ','),
                                radioButtons('quote', 'Guillemet',
                                             c(Aucun='',
                                               Double='"',
                                               Simple="'"),
                                             '"'),
                                tags$hr(),
                                p('Vous pouvez charger votre ficher CSV grace à :'),
                                img(src="geolab_small.png", height = 42, width = 210),
                                tags$hr(),
                                h3("Téléchargement"),
                                p('Une fois le fichier chargé, vous pouvez télécharger les deux fichiers suivant :'),
                                downloadButton('noeuds', 'Download Noeuds'),
                                downloadButton('dl.liens', 'Download Liens')
                              ),
                              mainPanel(
                                tableOutput('tableau')
                              )
                            )
                   ),
                   tabPanel("Aide",
                            h3("Description succincte"),
                            p("Cette petite application a pour but de construire les deux fichiers nécessaire à",
                              a("Gephi",href ="http://gephi.github.io/"),". Le fichier noeuds.csv contiendra
                              les ID, et les Label des noeuds. Le fichier `liens.csv` lui contiendra : une colonne
                              Source, une colonne target."),
                            tags$hr(),
                            h3("Notes"),
                            p("On pourra retrouver les sources de l'application (réalisé avec ",
                              a("Shiny",href="http://shiny.rstudio.com/"),") sur github à 
                              l'adresse suivante : ",a("http://unil.im/iC9CL", 
                                                       href ="https://github.com/ElCep/SNA"))
                            
                            
                   ))
        
)
