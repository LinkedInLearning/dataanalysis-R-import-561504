# Titel:    Datensaetze aus Paketen laden 
# Datei:    03_02_DatensaetzeAusPaketen.R


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

############################################################
# Liste mit Datensaetze mit p_data #########################

# Informationen ueber Funktion p_data() vom Paket "paceman"
?p_data()

# Tidyverse Datensaetze #######################################

# Die Abfrage erfolgt paketeweise (p_data(Paketname)), da
p_data(tidyverse)  # "no data sets found"
# nicht funktioniert

# browseURL("https://www.tidyverse.org/packages/")
# Tidyverse beinhaltet die Pakete ggplot2, dplyr, tidyr, readr, purrr, tibble,
# stringr, forcats, etc. (aber nicht jedes Paket beinhaltet Datensaetze)

p_data(ggplot2)       # Tidyverse: Grammar of graphics; Liste mit Datensaetzen des ggplot2 - Pakets
?diamonds             # Informationen ueber einen ausgewaehlten Datensatz
diamonds              # Datensatz einfach aufrufen
df <- diamonds        # mit Datensatz spielen

# Weitere Datensaetze aus der Tidyverse - Landschaft
p_data(dplyr)         # Tidyverse: Datenmanipulation
p_data(tidyr)         # Tidyverse: Funktionen zum erzeugen von tidy-Daten (Tabellenform)
p_data(stringr)       # Tidyverse: Funktionen fuer Strings
p_data(forcats)       # Tidyverse: Kategoriale Variablen

# Andere Pakete mit inkludierten Datensaetzen #############################

# Paketen muessen vorher mit z.B. p_load() geladen werden 
p_load(carData, caret, cluster, DescTools, GGally, gnm,
   janeaustenr, Lahman, lava, lmtest, maps, MASS, mlbench,
   nlme, nycflights13, psych, qcc, quantreg, rpart,
   SixSigma, survival, titanic, vcd)

p_data(carData)       # fuer Regressionsanalysen
p_data(caret)         # Klassifikation und Regressionsanalysen
p_data(cluster)       # Clusteranalysen
p_data(DescTools)     # Deskriptive Statistiken
p_data(GGally)        # Erweiterung des Grafikpaketes ggplot2
p_data(gnm)           # Nichtlineare Modelle
p_data(janeaustenr)   # Jane Austen's Romane
p_data(Lahman)        # Sean Lahman Baseball Daten
p_data(lava)          # Modells mit latenten Variablen (z.B. Strukturgleichungsmodells)
p_data(lmtest)        # Tests fuer lineare Regression
p_data(maps)          # mit geografischen Karten arbeiten 
p_data(MASS)          # Moderne angewandte Statistiken mit S
p_data(mlbench)       # Machine learning 
p_data(nlme)          # Lineare und nichtlineare Effekte analysieren
p_data(nycflights13)  # Fluege von NYC im Jahr 2013
p_data(psych)         # Psychometrics
p_data(qcc)           # Quality control charts
p_data(quantreg)      # Quantilregression
p_data(rpart)         # Recursive partitioning
p_data(SixSigma)      # Six sigma tools for quality control
p_data(survival)      # Survival Analyse
p_data(titanic)       # Titanic Datensatz
p_data(vcd)           # Visualisierung von kategorialen Variablen

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L

