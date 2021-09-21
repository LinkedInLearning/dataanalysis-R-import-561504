# Titel:    Nach einzelnen Variablen filtern  
# Datei:    04_08_VariablenFiltern.R

# Installieren und Laden von Paketen ################################
#####################################################################
##Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(pacman, rio, tidyverse)
# rio zum Importieren von Daten

#####################################################
# Importieren und Aufbereiten von Daten
# Speichere Daten als "df" (fuer Dataframe)

df <- import("Daten/adult.xlsx") %>%
        na_if(., "?") %>%      # aendere Missing Values von ? in NA
        as_tibble() %>%        # mach ein Tibble draus
        select(age,            # waehle nur bestimmte Spalten aus
              education,
              occupation, 
              income) %>% 
        mutate(occupation = as.factor(occupation)) %>% # aendere Spalte in einen Factor 
        mutate(education = as.factor(education)) %>% 
        mutate(income = as.factor(income)) %>%  
  print()

#####################################################
# "ODER" - Filterkriterum durch  |

df %>%
  filter(education   == "Bachelors" | 
         occupation == "Exec-managerial") %>%
  print()

# "UND" - Filterkriterium durch  &
df %>%
  filter(education   == "Bachelors" & 
         occupation == "Exec-managerial" &
         income == ">50K" ) %>%
  print()

# Ausschliessen durch vorgelagertes Ausrufezeichen ! 
# Alle Bachelors mit Income >50K, aber ohne Exec-managerial
df %>%
  filter(education   == "Bachelors" & 
         !occupation == "Exec-managerial" &
         income == ">50K") %>%
  print()

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L