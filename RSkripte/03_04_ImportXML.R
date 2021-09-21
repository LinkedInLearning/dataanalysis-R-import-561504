# Titel:    Daten aus XML-Datei importieren
# Datei:    03_04_ImportXML.R

# Installieren und Laden von Paketen ################################
#####################################################################
# Paket "XML" zum Lesen von XML  (Extensible Markup Language) - Dateien laden
library("XML")


# Uebergib Daten und speichere diese als Dokument
daten <- xmlParse("Daten/student.xml")
daten

# Konvertiere die Daten zu einem Dataframe
df <- xmlToDataFrame("Daten/student.xml", stringsAsFactors = TRUE)
df

#Zweite Spalte
df[2]

#Zweite Spalte, 2. und 3. Zeile
df[c(2,3),2]

##########################################################
# fuer html
document <- htmlParse("http://cran.r-project.org/web/packages/XML/index.html")
showMethods(class=class(document), where=search())

#Dokument in character umwandeln
as(document, "character")

##########################################################
#Mit Befehlsstruktur von tidyverse

# Installieren von pacman ("package manager"), wenn erforderlich
if (!require("pacman")) install.packages("pacman")

# Pakete mit pacman laden
pacman::p_load(pacman,tidyverse, XML2R)
#https://www.rdocumentation.org/packages/XML2R/versions/0.0.6

df <- xmlParse(file = "Daten/student.xml") %>%
  xmlToDataFrame(., stringsAsFactors = TRUE) %>%
  print()

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L

