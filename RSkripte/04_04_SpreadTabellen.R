# Titel:    "Spread" von Tabellen
# Datei:    04_04_SpreadTabellen.R

# Installieren und Laden von Paketen ################################
#####################################################################
## Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(pacman, tidyverse, MASS)

#####################################################
# Datensatz housing vom Paket "MASS" laden und aufbereiten 
?housing  

# Daten als tibble
df <- housing %>%
  as_tibble() %>%
  print()

# Von "tall" zu "wide" durch spread()
# Generiere drei Spalten aus der ursprünglichen Spalte (Sat);
# nimm dafuer die Kategorien "High", "Median" und "Low" als neue Spalten;
# innerhalb der Spalten wird mit "Freq" gezaehlt, wie oft eine Kategorie vorkommt
# (bezueglich aller anderen Spalten)
df_wide <- spread(df, 
                  key = Sat,          # nimm Kategorien als neue Spalten
                  value = Freq) %>%   # Werte fuer jede Kategorie
           print()

# Das ganze wieder Rueckgaengig machen:
# Von "wide" zu "tall" mit gather()
df_tall <- gather(df_wide,
                  'Low','Medium','High',  # Spalten, die zu einer Spalte werden sollen
                  key = 'Sat',            # Neuen Spalte fuer die Kategorien
                  value = 'Freq') %>%     # Neue Spalte fuer die Werte
              print()


##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"

# Konsole leeren
cat("\014")  # ctrl+L

