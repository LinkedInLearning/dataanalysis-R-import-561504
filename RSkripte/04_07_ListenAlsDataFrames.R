# Titel:    Listen in Dataframes umwandeln
# Datei:    04_07_ListenAlsDataFrames.R

# Installieren und Laden von Paketen ################################
#####################################################################
##Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(pacman, tidyverse)

#####################################################
# Datensatz aufbereiten 

# Generiere eine Liste mit Daten
L <- list(
      c(1:8),
      c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptun"),
      c(4878, 12100, 12700, 6770, 139822, 114632, 51000, 49244),
      c(FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE)
) %>%
  print()

# Speichere die Liste L als Tibble
df <- as_tibble(L, 
                .name_repair = "unique") %>%  # Gib den Spalten eindeutige Namen
  print()

# Benenne die Spaltennamen um
df <- df %>% 
  rename(id         = "...1") %>% 
  rename(planet     = "...2") %>% 
  rename(diameter   = "...3") %>%
  rename(moon       = "...4") %>%
  print()

######################################################
# Analysieren des Dataframes

# Generiere eine Tabelle mit Anzahl der Planeten, die keinen (FALSE) und mind. 
# einen Mond (TRUE) haben
df %>% select(moon) %>% table()

# Gib nur die Anzahl der Planeten mit mind. einem Mond aus. 
sum(df$moon)

# Gib alle Planeten aus, die mind. einen Mond besitzen.
df %>% 
  filter(moon == TRUE) %>%
  select(planet)

# Gib alle Planeten und den jeweiligen Durchmesser aus, wenn 
# der Durchmesser groesser als 100 000 km ist.
df %>% 
  filter(diameter > 100000) %>%
  select(planet, diameter)

# Gib alle Zeilen aus df fuer Planeten mit einem Durchmesser < 50 000 km aus.
df %>% 
  filter(diameter < 50000) 

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"

# Konsole leeren
cat("\014")  # ctrl+L