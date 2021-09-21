# Titel:    Datum und Zeitformate Teil 1
# Datei:    04_06_DatumZeitformate.R

# Installieren und Laden von Paketen ################################
#####################################################################
## Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(datasets, pacman, lubridate, tidyverse, tsibble)
# lubridate: zum Arbeiten mit Datums- und Zeitformaten
# tsibble: fuer Zeitreihen

#####################################################
# Datensatz laden und aufbereiten 
?EuStockMarkets
EuStockMarkets

# Speichere Daten als Zeitreihen - Tibble
df <- EuStockMarkets %>%
        as_tsibble() %>%                # Zeitreihen - Tibble
      print()  

# Speichere Daten als Zeitreihen - Tibble, fuege die Spalten "year", "month", "day" hinzu
df <- EuStockMarkets %>%
        as_tsibble() %>%                # Zeitreihen - Tibble
            mutate(                     # Generiere neue Variablen fuer Jahr, Monat, Tag
            year  = year(index),        
            month = month(index),       
            day = day(index),         
             ) %>%
        print()  


##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
detach("package:datasets", unload = T)  
p_unload(all)  #Befehl erfordert Paket "paceman"

# Konsole leeren
cat("\014")  # ctrl+L
