# Titel:    Pakete fuer R
# Datei:    02_06_Pakete.R

# Installieren und Laden von Paketen ################################
#####################################################################
##Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(pacman, party, psych, rio, tidyverse)
# pacman: Paket-Manager

# party: zum Schaetzen von Entscheidungsbaeumen (desicion trees)
# https://cran.r-project.org/web/packages/party/index.html

# psych: erleichtert statistische Analysen
# https://cran.r-project.org/web/packages/psych/
 
# rio: erleichtert das Importieren von Daten
# https://cran.r-project.org/web/packages/rio/

# tidyverse: erleichtert das Aufbereiten/Analysieren von Daten
# https://cran.r-project.org/web/packages/tidyverse/

# Beispiel: Laden von Datensaetzen ohne den Paket-Manager paceman
library(datasets)
# https://www.rdocumentation.org/packages/datasets/versions/3.6.2


###################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L

