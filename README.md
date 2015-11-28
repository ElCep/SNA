**Social Network Analysis**
=======================

URL : [http://unil.im/iC9CL](https://github.com/ElCep/SNA)

Ce dossier contient le matériel de cours sur l'initiation à l'analyse de réseau pour les **master 2** parcourt : Géographie, Sociologie, Histoire de l'[université de Limoges](http://www.unilim.fr/)

* Présentation de la [semaine 1](https://rawgit.com/ElCep/SNA/master/S01/index.html#/)

## App

Une petite application de transformation des données acteurs est disponible sur [shinyapp.io](https://elcep.shinyapps.io/Gephi_acteur). Cette application est également disponible dans ce dépôt Github. Elle est codée en [R](https://www.r-project.org/), grâce au package [shiny](http://shiny.rstudio.com/), ce qui vous permet également de la lancer en `localhost`

```
library(shiny)
setwd(mon_dossier)
shiny::runApp('convert_network_shiny')

```
## Pense pas bête

Les informations pour confiture RStudio dans le but de se connecter à shinyapp.io sont disponibles ici : [http://shiny.rstudio.com/articles/shinyapps.html](http://shiny.rstudio.com/articles/shinyapps.html).
