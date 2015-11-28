##Un script pour formater les donnée pour gephi
##c.a.d crée deux fichier CSV un pour les noeuds
##un autre pour les liens

#chargement des librairies
require(stringr)
require(plyr)
require(reshape2)


##Chargement de la données
#setwd("~/github/presentations/SNA/")
#D.df <- read.csv("S01/datas/acteurs_eau.csv", sep = ",", header = TRUE, na.strings=c("","NA"))

noeuds.csv <- function(data.df){
  data.df <- data.df[!is.na(data.df$Nom),]
  data.df$Label <- paste(data.df$Nom, data.df$Prénom, sep=" ")
  
  ##acteurs
  name.df <- as.data.frame(unique(data.df$Label))
  name.df$ID <- paste(row.names(name.df), "a",sep = "")
  colnames(name.df)<-c("Label", "ID_a")
  data.df <- join(data.df, name.df, by = "Label", type = "left")
  
  ##institution
  name.inst <- as.data.frame(unique(data.df$Cle))
  name.inst$ID <- paste(row.names(name.inst), "i", sep = "")
  colnames(name.inst) <- c("Cle", "ID_i")
  data.df <- join(data.df, name.inst, by = "Cle", type = "left")
  
  ##ratachement
  name.ratach <- as.data.frame(unique(data.df$orgismes.de.ratachement))
  name.ratach$ID <- paste(row.names(name.ratach), "r", sep = "")
  colnames(name.ratach) <- c("orgismes.de.ratachement", "ID_r")
  data.df <- join(data.df, name.ratach, by = "orgismes.de.ratachement", type = "left")
  
  co_value <- c("Label","ID")
  colnames(name.df)<- co_value
  colnames(name.inst) <- co_value
  colnames(name.ratach) <- co_value
  noeuds <- rbind(name.df, name.inst,name.ratach)
  
  
  
  return(noeuds)
}

liens.csv <- function(data.df){
  data.df <- data.df[!is.na(data.df$Nom),]
  data.df$Label <- paste(data.df$Nom, data.df$Prénom, sep=" ")
  
  ##acteurs
  name.df <- as.data.frame(unique(data.df$Label))
  name.df$ID <- paste(row.names(name.df), "a",sep = "")
  colnames(name.df)<-c("Label", "ID_a")
  data.df <- join(data.df, name.df, by = "Label", type = "left")
  
  ##institution
  name.inst <- as.data.frame(unique(data.df$Cle))
  name.inst$ID <- paste(row.names(name.inst), "i", sep = "")
  colnames(name.inst) <- c("Cle", "ID_i")
  data.df <- join(data.df, name.inst, by = "Cle", type = "left")
  
  ##ratachement
  name.ratach <- as.data.frame(unique(data.df$orgismes.de.ratachement))
  name.ratach$ID <- paste(row.names(name.ratach), "r", sep = "")
  colnames(name.ratach) <- c("orgismes.de.ratachement", "ID_r")
  data.df <- join(data.df, name.ratach, by = "orgismes.de.ratachement", type = "left")
  
  small.df <- subset(data.df , select = c("ID_a","ID_i","ID_r"))
  small.df <- melt(small.df, "ID_a")
  small.df <- subset(small.df, select = c("ID_a", "value"))
  colnames(small.df) <- c("Source", "Target")
  
  return(small.df)
}
