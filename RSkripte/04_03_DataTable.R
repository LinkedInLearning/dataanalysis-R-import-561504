# Titel:    Arbeiten mit data.table
# Datei:    04_03_DataTable.R

# Installieren und Laden von Paketen ################################
#####################################################################
##Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(pacman, data.table, httr, tidyverse)
# pacman: Zum Laden von Paketen;
# data.table: zum Arbeiten mit großen Datentabellen;
#             verbesserte Version der Dataframes; siehe auch: 
#             https://www.rdocumentation.org/packages/data.table/versions/1.14.0;
#             https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html
# httr: zum Ansprechen von Web-Quellen;
# tidyverse: Erleichterungen fuer Datenanalysten.

#####################################################################
# Laden und Aufbereiten der Daten
# https://archive.ics.uci.edu/ml/machine-learning-databases/census1990-mld/USCensus1990raw.data.txt

# UCI Mashine Learning Repository stellt gespendete Datensaetze kostenlos zur Verfuegung
# browseURL("https://archive.ics.uci.edu/ml/index.php")   
# US Census Daten von 1990
# N = 2,458,285
# Die Daten befinden sich unter:
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/census1990-mld/USCensus1990.data.txt"
# Lies URL ein
response <- httr::HEAD(url)

# Gibt die Groesse des Datensatzes in Bytes aus
httr::headers(response)[["Content-Length"]]  # ca. 361.3 MB

# Lade Datensatz (kann wenige Minuten dauern) 
df <- fread(url)

# Zeige ersten sechs Zeilen des Datensatzes
head(df)

##########################################################
# Arbeiten mit dem Pakte data.table

# Notation: df[i, j, by] --> im SQL Kontext entspricht das [where/order by, select/update, group by]
# i:  Zeile auswaehlen (leer lassen, wenn alle Zeilen bearbeitet/angezeigt werden sollen);
# j:  Spalte auswaehlen und Aggregieren durch die Funktionen
#     (z.B. sum, count, mean, etc);
# by: Kategoriale Variable auswaehlen, nach der gruppiert werden soll. 

# Zeilen filtern: Zeige alle Zeilen (Beobachtungen) mit dAge == 1
df[dAge == 1, ]

# Zeige Spalte dAge und dHispanic (alle Zeilen)
df[, dAge, dHispanic]

# Waehle Spalte dTravtime fuer alle Zeilen dAge == 5 aus 
df[dAge == 5, dTravtime, dAge]

# Zaehle alle Zeilen mit iMarital == 1 fuer jede Gruppe in dHispanic
df_new<-df[iMarital == 1, .(count = .N), by = dHispanic]
df_new

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L
