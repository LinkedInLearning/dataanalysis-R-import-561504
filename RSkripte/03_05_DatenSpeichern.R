# Titel:    Speichern und aufrufen von Daten  
# Datei:    03_05_DatenSpeichern.R

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


#####################################################
# Importieren und Aufbereiten von Daten
# Speichere Daten als "df" (fuer Dataframe)
df <- import("Daten/adult.xlsx") %>%
  na_if(., "?") %>%
  as_tibble() %>%  #als tibble ablegen
  select(age,      #bestimmte Spalten auswählen
         occupation, 
         income) %>% 
  mutate(occupation = as.factor(occupation)) %>%  #Spalte "occupation" in factor umwandeln
  rename(y_Variable = income) %>% #Spalte "income" in "y-Variable" umbenennen
  print()                         #Ausgabe der Daten

#####################################################
# Speichere Daten als .rdata

# Hinweis: .rda ist eine Abkürzung für .rdata

# Befehl save()
save(df, file = "Daten/adultData.rdata")

# Loesche alle Objekte von der Environment
rm(list = ls())  

# Jetzt kann die .rdata - Datei geladen werden, entweder durch
# 1. R - Befehl load() (base)
# 2. Paket "rio"s Befehl import()

# load() importiert Daten in die Environment; die Daten koennen nicht umbenannt werden
load("Daten/adultData.rdata")
df  # Datenausgabe

# Loesche Daten aus Environment
rm(list = ls()) 

# Jetzt mit import() von rio; Daten werden nicht in der Environment geladen
import("Daten/adultData.rdata") %>%
  print()

# import() ermoeglicht es Daten umzubenennen und in Environment zu laden
new_df <- import("Daten/adultData.rdata") %>%
  print()

# Loesche Daten aus Environment
rm(list = ls()) 

###########################################################
##Speichere Daten als .rds
# Nuetzlich fuer die Speicherung verschiedener Bearbeitungsstaenden

# Daten erstellen, falls notwendig
# Speichere Daten als "df" (fuer Dataframe)
 df <- import("Daten/adult.xlsx") %>%
  na_if(., "?") %>%
  as_tibble() %>%  #als tibble ablegen
  select(age,      #bestimmte Spalten auswählen
         occupation, 
         income) %>% 
  mutate(occupation = as.factor(occupation)) %>%  #Spalte "occupation" in factor umwandeln
  rename(y_Variable = income) %>% #Spalte "income" in "y-Variable" umbenennen
  print()   

# Befehl saveRDS() 
df %>% saveRDS("Daten/adultData.rds")

# Alternativ: Befehl write_rds() von tidyverse; Daten werden nicht kompremmiert;
# nuetzlich, wenn Daten schnell gespeichert werden sollen (und Speicherplatz nicht so wichtig ist)
df %>% write_rds("Daten/aldultData2.rds")

# Loesche alle Objekte von der Environment
rm(list = ls())  

# Einleden von .rds - Dateien:
# 1. Befehl readRDS() von Base
# 2. Befehl read_rds() vom Paket readr
# 3. Befehl import() vom Paket rio

# import()
import("Daten/adultData.rds")

# In die Environment laden
new_df <- import("Daten/adultData.rds") %>%
  print()


##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L
