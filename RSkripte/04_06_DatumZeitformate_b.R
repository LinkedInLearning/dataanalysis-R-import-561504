# Titel:    Datum und Zeitformate Teil 2
# Datei:    04_06_DatumZeitformate_b.R

# Installieren und Laden von Paketen ################################
#####################################################################
## Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(pacman, lubridate, tidyverse, tsibble)
# lubridate: zum Arbeiten mit Datums- und Zeitformaten
# tsibble: fuer Zeitreihen


#####################################################
# Datensatz laden und aufbereiten
# Informationen zum Datensatz: https://archive.ics.uci.edu/ml/datasets/Seoul+Bike+Sharing+Demand

df <- read_csv("Daten/BikeData.csv") %>%
          as_tibble() %>%
          select(Date, Hour, "Rented Bike Count", Temperature) %>%
         print()

# Verknuepfe Date und Hour zum eindeutigen Zeitstempel DateTime 
df <- read_csv("Daten/BikeData.csv") %>%
          as_tibble() %>%
          mutate(DateTime = paste(Date, Hour)) %>%                # Generiere DateTime aus Date und Hour
          mutate(across('DateTime', 
                ~ as.POSIXct(.x, 
                             format = "%d/%m/%Y %H"))) %>%       # Wandle es in ein Datum-Zeitformat
          drop_na(DateTime) %>%                                   # loesche NA
          select(DateTime, "Rented Bike Count", Temperature) %>%  # waehle Spalten aus     
         print()

# Generiere ein tsibble als Zeitreihe, index muss eindeutig sein
df_ts <- as_tsibble(df, index = DateTime) %>%
         print()

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
detach("package:datasets", unload = T)  
p_unload(all)  #Befehl erfordert Paket "paceman"

# Konsole leeren
cat("\014")  # ctrl+L
