# Titel:    Paketelandschaft "Tidyverse" fuer Data Science
# Datei:    02_06_Tidyverse.R

# Pakete laden und installieren, falls noch nicht geschehen#####################

# Installieren von pacman ("package manager"), wenn erforderlich
if (!require("pacman")) install.packages("pacman")

# Pakete mit pacman laden
pacman::p_load(pacman,tidyverse)

#Webseite: https://www.tidyverse.org/;

#Paket: "tibble": erleichtert das Arbeiten mit Dataframes durch "tibbles",
#https://tibble.tidyverse.org/;

#Paket "dplyr": erleichtert Datenmanipulation, filtern, hinzufuegen, 
#aggregieren von Spalten/Variablen eines Tibbles,
#https://dplyr.tidyverse.org/;

#Paket: "ggplot2": erlaubt das Erstellen von professionelle Grafiken,
#https://ggplot2.tidyverse.org/;

#Paket: "forcats": erleichtert das Arbeiten mit kategorialen Variablen ("factors" in R),
# https://forcats.tidyverse.org/;

#Paket: "readr": erleichtert das Importieren verschiedener Datenformate in R,
# https://readr.tidyverse.org/;

#Paket: "stringr": erleichtert das Arbeiten mit Strings,
# https://stringr.tidyverse.org/;

#Paket: "tidyr": erleichtert das Arbeiten mit Tidy - Daten (jede Spalte ist eine Variable,
# jede Zeile eine Beobachtung und jede Zelle ein Wert) und das Ueberfuehren in verschiedene 
# Tabellenformate (z.B. Kontingenztabelle),
# https://tidyr.tidyverse.org/;

#Pakete: "purr": erleichtert das Arbeiten mit Funktionen und Vektoren, erlaubt das Ersetzen 
# von Schleifen (loops) durch Einzeiler (map() - Funktion),
# https://purrr.tidyverse.org/


###################################
# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L


