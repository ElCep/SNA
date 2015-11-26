library(shiny)




library(shiny)

shinyUI(navbarPage("Intervalle de confiance selon une loi de poisson",
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
                                downloadButton('dl.noeuds', 'Download Noeuds'),
                                downloadButton('dl.liens', 'Download Liens')
                              ),
                              mainPanel(
                                tableOutput('tableau')
                              )
                            )
                   ),
                   tabPanel("Aide",
                            withMathJax(),
                            helpText(tags$h1("Le rapport d'incidence standardisé : Le SIR"),
                                     tags$h3("Définition"),
                                     div("Le SIR (standardized incidence ratio) ou standardisation indirecte repose sur la comparaison du nombre total des cas observé dans la population étudiée par rapport au nombre de cas auquel on pourrait s’attendre si cette population était soumise à une force d'incidence donnée (taux de référence).")),
                            helpText("$$ SIR=\\frac{Observé}{Attendus}$$"),
                            helpText("le SIR est une mesure du risque relatif de la population étudiée par rapport à une population de référence."),
                            helpText(tags$h3("Variabilité des SIR et intervalle confiance"),
                                     "La variabilité des SIR ne dépend pratiquement que du numérateur O, le dénominateur étant considéré comme non aléatoire,
  Les \\(O_{i}\\) suivent une distribution de poisson d'espérance \\(\\theta_{i}\\)\\(E_{i}\\)
 ou \\(\\theta_{i}\\) correspond au vrai risque relatif de la région \\(i\\)
  dont le SIR est une estimation."),
                            
                            helpText("$$O_{i}\\sim{}P(\\theta_{i}E_{i})$$"),
                            helpText("On met a profit la relation existant entre la loi de Poisson et la loi du Khi2\\(^{1,2}\\) pour calculer l'interval de confiance
             d'un paramètre d'une loi de Poisson à un niveau alpha donné."),
                            helpText("$$IC\\left[\\frac{\\chi^2_{\\frac{\\alpha}{2};2.O}}{2E};\\frac{\\chi^2_{1-\\frac{\\alpha}{2};2(O+1) }} {2E}\\right]$$"),
                            
                            
                            ##bibliographie
                            helpText("1- Calculating Poisson confidence Intervals in Excel.",br(),
                                     "Iain Buchan January 2004",br(),
                                     "Public Health Informatics at the University of Manchester (www.phi.man.ac.uk)"),
                            helpText("2- Intervalle de confiance pour le paramètre d’une loi de Poisson
Méthode exacte pour échantillons de taille quelconque.")
                   ))
        
)
