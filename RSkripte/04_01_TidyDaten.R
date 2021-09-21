# Titel:    Wann sind Daten "tidy"?
# Datei:    04_01_TidyDaten.R


# Installieren und Laden von Paketen ################################
#####################################################################
##Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(datasets, pacman, tidyverse)
# datasets: enthaelt Beispieldatensaetze
# pacman: zum Laden von Paketen
# tidyverse: einfacheres Arbeiten mit Daten

#####################################################################
# Wie sehen Tidy - Daten aus?

# 1. Spalte == Variable bzw. Eigenschaft 
# 2. Zeile  == Fall oder Beobachtung  
# 3. Zelle  == Einzelner Wert 
# 4. Datei  == Abstraktionsniveau

# Beispiel:
?iris         # Informationen ueber den Datensatz
iris          # Datensatz anzeigen lassen
head(iris)    # erste 6 Zeilen ausgeben lassen 
summary(iris) # ein bisschen deskriptive Statistik

#####################################################################
# Andere (nicht - Tidy - Formate):

# Zeitreihendaten
# XML/JSON Daten (hierachische Struktur)
# Spalten/Zellen mit mehreren variablen

#####################################################################
# Beispiel: Zeitreihendaten "sunspots"

?sunspots       # Informationen ueber den Datensatz
sunspots        # Datensatz anzeigen lassen
head(sunspots)  # zeigt erste 6 Beobachtungen
plot(sunspots)  # Grafische Darstellung

#####################################################################
# Daten "tidy" machen: siehe nachfolgende Videos

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L
