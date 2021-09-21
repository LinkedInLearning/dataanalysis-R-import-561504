# Titel:    data.frames als tibbles
# Datei:    04_02_DataframesAlsTibbles.R

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

# Beispiel: ToothGrowth - Datensatz
?ToothGrowth         # Informationen ueber den Datensatz
ToothGrowth          # Datensatz anzeigen lassen
head(ToothGrowth)    # erste 6 Zeilen ausgeben lassen 

# iris als Dataframe in die Environment laden
df <- ToothGrowth
df

# Konvertiert iris von einem Dataframe zu einem Tibble
df_tibble <- ToothGrowth %>%
              as_tibble() %>%
              print()

# Mit tibble laesst sich leichter arbeiten und Datensatzanpassungen vornehmen, z.B.
df_tibble <- ToothGrowth %>%
                as_tibble() %>% 
                mutate(supp = as.character(supp)) %>%  # Datentyp von "supp" in Character aendern
                print()
##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L


