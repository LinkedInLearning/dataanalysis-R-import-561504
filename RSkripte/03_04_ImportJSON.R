# Titel:    Daten aus JSON-Datei importieren
# Datei:    03_05_ImportJSON.R


# Installieren und Laden von Paketen ################################
#####################################################################
# Paket "rjson" zum Lesen von JSON  (JavaScript Object Notation) - Dateien laden
#install.packages("rjson")
library(rjson)
# rjson: https://www.rdocumentation.org/packages/rjson/versions/0.2.20

#JSON einlesen und als daten speichern
daten <- fromJSON(file = "Daten/student.json")

#daten anzeigen
print(daten)

#daten in Dataframe umwandeln und als df speichern
df <- as.data.frame(daten)

print(df)

##########################################################
#Mit paceman

# Installieren von pacman ("package manager"), wenn erforderlich
if (!require("pacman")) install.packages("pacman")

# Pakete mit pacman laden
pacman::p_load(pacman, tidyverse, jsonlite)
# jsonlite: vorteilhaft bei verschachtelten JSON- Dateien,
# https://www.rdocumentation.org/packages/jsonlite/versions/1.7.2


# Bundesligadaten von https://www.openligadb.de/
fball <- "https://api.openligadb.de/getmatchdata/bl1/2021/1" %>%
          fromJSON() %>%  # Lies Daten ein und packe sie in eine Liste
          print()         # Zeige Daten

# Aufrufen einzelner Datenbloecke
fball$team1

# alternativ mit Paket plyr
fball %>%
  select(team1)

# Nur teamID und teamName
fball$team1[1:2] # Spaltennummern 1 bis 2
fball$team2[c("teamId", "teamName")] # Spaltennamen

# alternativ mit Paket plyr
fball$team2 %>%
  select(c("teamId", "teamName"))
  
# matchResults ist eine Liste mit Dataframes
mr <- fball$matchResults
mr

# bind_rows() vom Paket plyr erlaubt das Zusammenbinden in ein Dataframe bzw. Tibble
df <- bind_rows(mr, .id = "column_label") %>%
      as_tibble() %>%
      print()

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L





