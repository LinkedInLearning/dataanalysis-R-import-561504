# Titel:    Zaehlvariablen generieren
# Datei:    04_09_Zaehlvariablen.R

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

#######################################################
# Zaehlvariable generieren

# spaltenweises Zaehlen (eine Art "Punktevergabe"/"Bewertung"), wenn Kriterien erfuellt sind
df <- df %>% 
  mutate(
    Count =                                       # die neue Variable heisst "Count"
      ifelse(age > 17 & age <= 20, 1, 0) +        # wenn 17 < age <=20 , dann addiere 1 hinzu
      ifelse(education == "Bachelors", 1, 0) +    # wenn education == "Bachelors", addiere 1 hinzu
      ifelse(income == "<=50K", 1, 0)             # wenn income == "<=50K", addiere 1 hinzu
      ) %>%
    arrange(desc(Count)) %>%                      # sortiere absteigend nach "Count"
  print(n = 20)                                   #zeige die ersten 20 Eintragungen

# Daten nach Zaehlvariable gruppieren und Anzahl der "Treffer" ausgeben lassen
df %>%                         # Count rows by group
  group_by(Count) %>%          # nach Count gruppieren
  summarise(n = n())           # Zaehlen, wie oft 0, 1, 2 und 3 vorkommen

#######################################################################
# Kategoriale Variable mit case_when generieren

# Wenn alle drei Kategorien zutreffen (UND - Kriterium mit &), dann schreib "y", sonst "n" 

df %<>%
  mutate(
    Success = case_when(
      (age > 17 & age <= 20) & education == "Bachelors" & income == "<=50K" ~ "y",
      TRUE ~ "n"  # alle anderen Werte
    )
  ) %>%
  arrange(desc(Success)) %>%  # sortiere absteigend nach Success
  print(n = 20)

################################################################
# Siehe auch die Pakete "psych" und "Scale":

browseURL("https://CRAN.R-project.org/package=psych")
browseURL("https://CRAN.R-project.org/package=Scale")

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"

# Konsole leeren
cat("\014")  # ctrl+L
