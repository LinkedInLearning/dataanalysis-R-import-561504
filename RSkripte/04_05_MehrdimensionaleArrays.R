# Titel:    Erstelle tidy-Tabellen aus mehrdimensionalen Arrays
# Datei:    04_05_MehrdimensionaleArrays.R

# Installieren und Laden von Paketen ################################
#####################################################################
## Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(datasets, pacman, tidyverse)

#####################################################
# Datensatz laden und aufbereiten 
?Titanic 
Titanic  # Daten anschauen: 4-dim. Array- mit 4 Attributen und N = 2201

# Daten als tibble mit N = 32 (aggregiert Mehrfachnennungen)
df <- Titanic %>%            
        as_tibble() %>%         
      print()                

# Fuer jede Beobachtung eine Zeile mit uncount(), sodass N = 2,201
df_uncount <- Titanic %>%            
                as_tibble() %>%         
                uncount(n) %>%          
              print()                

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
detach("package:datasets", unload = T)  
p_unload(all)  #Befehl erfordert Paket "paceman"

# Konsole leeren
cat("\014")  # ctrl+L