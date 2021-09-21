# Titel:    Rs integrierte Datensaetze
# Datei:    03_01_IntegrierteDatensaetze.R


# Installieren und Laden von Paketen ################################
#####################################################################

# Das Paket "datasets" ist standardmäßig installiert, aber noch nicht geladen
library(datasets)           # Paket laden
?datasets                   # Informationen zum Paket "datasets"
library(help = "datasets")  # Erhalte Liste mit verfuegbaren Datensaetzen

#Eine Liste mit verfuegbaren Datensaetzen und Links zu den Beschreibungen gibt es unter
#1. oeffne "help" (rechts unten) im RStudio,
#2. klicke auf das Haeuschen (home-icon), 
#3. klicke auf "Packages" unter Reference,
#4. klicke auf "datasets". 

# Einige Beispiele #####################################

# "Iris" Datensatz von Fisher und Anderson
?iris
iris

# "Titanic" Datensatz 
?Titanic
Titanic

# Anscombe's Quartet
?anscombe
anscombe

##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L


